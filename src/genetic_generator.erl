-module(genetic_generator).
-behavior(gen_server).

-export([start_link/0]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
				 terminate/2, code_change/3]).
-export([start_generator/0]).


-record(state, {current=[a], children_started=0, children_done=0}).

%% API
start_generator() ->
	gen_server:cast(generator, next).


start_link() ->
	gen_server:start_link({local, generator}, ?MODULE, [], []).


init([]) ->
	io:format("starting generator~n"),
	{ok, #state{}}.



handle_call(_Msg, _From, State) ->
	{noreply, State}.


handle_cast(next, State) ->
	N = 5,

	Strand = State#state.current,
	%Strand = [a, g, c, t, a, c, a, a, g, a, t, c, c, a, a, a, c, t, c, t],
	Next = get_next(Strand),
	%io:format("current: ~p next: ~p~n", [Strand, Next]),
	FStrand = typo_lib:formatInitialStrand(Strand),
	Dupes = typo_lib:convertToDuplicates(Strand),
	Operators = typo_lib:getFinalOperators(Dupes),
	BindPoints = typo_lib:findAllPossibleBindPoints(FStrand, Operators),
	Perms = typo_lib:get_all_perms(BindPoints),
	FilteredPerms = typo_lib:filter_redundant_perms(Perms),

										%Elem = hd(FilteredPerms),
										%supervisor:start_child(operator_sup, [Strand, FStrand, Elem]),
	lists:foreach(fun(Elem) ->
										supervisor:start_child(operator_sup, [Strand, FStrand, Elem])
								end, FilteredPerms),
	Len = length(Next),
	if Len < N -> gen_server:cast(generator, next);
		 true -> ok
	end,
	NCurrent = length(FilteredPerms),
	NTotal = NCurrent + State#state.children_started,
	{noreply, State#state{current=Next, children_started=NTotal}};
handle_cast(op_done, State) ->
	%% this gets matched every time an op is finished, so it is worthless
	FinishedTotal = State#state.children_done + 1,
	if FinishedTotal >= State#state.children_started ->ok;
		 FinishedTotal < State#state.children_started -> ok
	end,
	{noreply, State#state{children_done=FinishedTotal}};
handle_cast(_Msg, State) ->
	{noreply, State}.


handle_info(_Info, State) ->
	{noreply, State}.

terminate(_Reason, _State) ->
	ok.

code_change(_OldVsn, State, _Extra) ->
	{ok, State}.


%% private
get_next([a|Tl]) -> [c|Tl];
get_next([c|Tl]) -> [g|Tl];
get_next([g|Tl]) -> [t|Tl];
get_next([t|Tl]) -> [a | get_next(Tl)];
get_next([]) -> [a].
