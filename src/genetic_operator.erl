-module(genetic_operator).
-behavior(gen_fsm).

-export([start_link/3]).
-export([init/1, handle_sync_event/4, handle_event/3,
				 handle_info/3, terminate/3, code_change/4]).
%-export([challenge/2,proof/2,verified/2]). %% states
-export([loop/2,done/2]).

-record(data, {input_strand, fstrand, num_ops, finished_ops=0, copy_mode=false}).



%% public
start_link(InputStrand, FStrand, Ops) ->
	gen_fsm:start_link(?MODULE, [InputStrand, FStrand, Ops], []).




%% callbacks
init([InputStrand, FStrand, Ops]) ->
	%io:format("starting operator~n"),
	%io:format("Fstrand: ~p~n", [FStrand]),
	%io:format("Initial Ops: ~p~n", [Ops]),
	Len = length(Ops),
	Data = #data{input_strand=InputStrand, fstrand=FStrand},
	%% if there are no operations to be performed
	%% then send done message now
	%% else start the procedure
	if Len > 0 ->
			gen_fsm:send_event(self(), {start, Ops});
		 Len == 0 ->
			gen_fsm:send_event(self(), done)
	end,
	{ok, loop, Data#data{num_ops=Len}}.



send_next_op({_, _, []}) -> gen_fsm:send_event(self(), done);
send_next_op({Ref, Pos, [NextOp | RestOps]}) ->
									NewBoundAminoAcid = {Ref, Pos, RestOps},
									Msg = {NextOp, NewBoundAminoAcid},
	%io:format("sending msg: ~p~n", [Msg]),
									gen_fsm:send_event(self(), Msg).


%% states

%% start begins the process of sending a message for the next operation for each amino acid
loop({start, Ops}, Data) ->
	lists:foreach(fun send_next_op/1, Ops),
	{next_state, loop, Data};
%% done checks whether all amino acid operations have been performed
loop(done, Data) ->
	Num_done = Data#data.finished_ops + 1,
	if Num_done >= Data#data.num_ops ->
			 gen_fsm:send_event(self(), finish),
			 {next_state, done, Data};
		 Num_done < Data#data.num_ops ->
			 {next_state, loop, Data#data{finished_ops=Num_done}}
	end;
loop({cut, {Ref,_,_}=Op}, Data) ->
	FStrand2 = genetic_strand:cut(Ref, Data#data.fstrand),
	%io:format("cut msg: ~p~n", [Op]),
	send_next_op(Op),
	{next_state, loop, Data#data{fstrand=FStrand2}};
loop({del, {Ref,Pos,_}=Op}, Data) ->
	FStrand2 = genetic_strand:del(Ref, Data#data.fstrand, Pos),
	%io:format("del msg: ~p~n", [Op]),
	send_next_op(Op),
	{next_state, loop, Data#data{fstrand=FStrand2}};
loop({swi, Op}, Data) ->
	%io:format("swi msg: ~p~n", [Op]),
	Op2 = genetic_strand:swi(Op),
	send_next_op(Op2),
	{next_state, loop, Data};
loop({mvr, Op}, Data) ->
	%io:format("mvr msg: ~p~n", [Op]),
	%% currently works for only bot and while copy mode is off
	{FStrand2, Op2} = genetic_strand:mvr(Op, Data#data.fstrand, Data#data.copy_mode),
	send_next_op(Op2),
	{next_state, loop, Data#data{fstrand=FStrand2}};
loop({mvl, Op}, Data) ->
	%io:format("mvl msg: ~p~n", [Op]),
	{FStrand2, Op2} = genetic_strand:mvl(Op, Data#data.fstrand, Data#data.copy_mode),
	send_next_op(Op2),
	{next_state, loop, Data#data{fstrand=FStrand2}};
loop({cop, {PtrRef,Pos,_}=Op}, Data) ->
	%io:format("cop msg: ~p~n", [Op]),
	FStrand2 = genetic_strand:cop(Data#data.fstrand, PtrRef, Pos),
	send_next_op(Op),
	{next_state, loop, Data#data{copy_mode=true,fstrand=FStrand2}};
loop({off, Op}, Data) ->
	%io:format("off msg: ~p~n", [Op]),
	send_next_op(Op),
	{next_state, loop, Data#data{copy_mode=false}};
loop({ina, Op}, Data) ->
	%io:format("ina msg: ~p~n", [Op]),
	{FStrand2, Op2} = genetic_strand:ina(Op, Data#data.fstrand, Data#data.copy_mode),
	send_next_op(Op2),
	{next_state, loop, Data#data{fstrand=FStrand2}};
loop({inc, Op}, Data) ->
	%io:format("inc msg: ~p~n", [Op]),
	{FStrand2, Op2} = genetic_strand:inc(Op, Data#data.fstrand, Data#data.copy_mode),
	send_next_op(Op2),
	{next_state, loop, Data#data{fstrand=FStrand2}};
loop({ing, Op}, Data) ->
	%io:format("ing msg: ~p~n", [Op]),
	{FStrand2, Op2} = genetic_strand:ing(Op, Data#data.fstrand, Data#data.copy_mode),
	send_next_op(Op2),
	{next_state, loop, Data#data{fstrand=FStrand2}};
loop({int, Op}, Data) ->
	%io:format("int msg: ~p~n", [Op]),
	{FStrand2, Op2} = genetic_strand:int(Op, Data#data.fstrand, Data#data.copy_mode),
	send_next_op(Op2),
	{next_state, loop, Data#data{fstrand=FStrand2}};
loop({rpy, Op}, Data) ->
	%io:format("rpy msg: ~p~n", [Op]),
	{FStrand2, Op2} = genetic_strand:rpy(Op, Data#data.fstrand, Data#data.copy_mode),
	send_next_op(Op2),
	{next_state, loop, Data#data{fstrand=FStrand2}};
loop({rpu, Op}, Data) ->
	%io:format("rpu msg: ~p~n", [Op]),
	{FStrand2, Op2} = genetic_strand:rpu(Op, Data#data.fstrand, Data#data.copy_mode),
	send_next_op(Op2),
	{next_state, loop, Data#data{fstrand=FStrand2}};
loop({lpy, Op}, Data) ->
	%io:format("lpy msg: ~p~n", [Op]),
	{FStrand2, Op2} = genetic_strand:lpy(Op, Data#data.fstrand, Data#data.copy_mode),
	send_next_op(Op2),
	{next_state, loop, Data#data{fstrand=FStrand2}};
loop({lpu, Op}, Data) ->
	%io:format("lpu msg: ~p~n", [Op]),
	{FStrand2, Op2} = genetic_strand:lpu(Op, Data#data.fstrand, Data#data.copy_mode),
	send_next_op(Op2),
	{next_state, loop, Data#data{fstrand=FStrand2}};
loop(Msg, Data) ->
	io:format("UNKNOWN MSG: ~p~n", [Msg]),
	{next_state, loop, Data}.
	%{stop, normal, Data}.


done(finish, Data) ->
	OutputStrands = genetic_strand:extract_strands(Data#data.fstrand),
	%io:format("final formatted strands: ~p~n", [Data#data.fstrand]),
	%io:format("input string strands: ~p~n", [Data#data.input_strand]),
	%io:format("final string strands: ~p~n~n", [OutputStrands]),
	gen_server:cast(generator, op_done),
	if length(OutputStrands) == 2 ->
				%io:format("~p -> ~p~n", [Data#data.input_strand, OutputStrands]),
			 [S1,S2] = OutputStrands,
			 if S1 == S2 andalso S1 == Data#data.input_strand -> io:format("match on: ~p~n", [S1]);
					true -> ok
			 end;
		 true -> ok
	end,
	{stop, normal, Data}.


%% callbacks
handle_info(_Info, State, Data) ->
	{next_state, State, Data}.

handle_event(_Event, State, Data) ->
	{next_state, State, Data}.

handle_sync_event(_Event, _From, State, Data) ->
	{next_state, State, Data}.

terminate(_Reason, _State, _Data) ->
	ok.

code_change(_OldVsn, State, Data, _Extra) ->
	{ok, State, Data}.
