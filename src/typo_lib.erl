-module(typo_lib).

-export([convertToDuplicates/1, createDirList/1, getFinalDir/1, getBindingPref/1]).
-export([getFinalOperators/1]).
-export([strandFormatter/2, formatInitialStrand/1, findAllPossibleBindPoints/2]).
-export([get_all_perms/1,filter_redundant_perms/1]).
-export([doAll/0]).

doAll() ->
	Strand0 = [c, c],
	Strand1 = [a, g, c, t],
	Strand2 = [a, g, c, t, a, g, c, t],
	Strand3 = [a, g, c, t, a, c, a, a, g, a, t, c, c, a],
	Strand4 = [a, g, c, t, a, c, a, a, g, a, t, c, c, a, a, a, c, t, c, t],
	ActualStrand = Strand3,
	io:format("Initial strand: ~p~n", [ActualStrand]),
	FStrand = formatInitialStrand(ActualStrand),
	io:format("Formatted strand: ~p~n", [FStrand]),
	Dupes = convertToDuplicates(ActualStrand),
	Operators = getFinalOperators(Dupes),
	io:format("Operators: ~p~n", [Operators]),
	BindPoints = findAllPossibleBindPoints(FStrand, Operators),
	io:format("Bind points: ~p~n", [BindPoints]),
	Perms = get_all_perms(BindPoints),
	FilteredPerms = filter_redundant_perms(Perms),
	io:format("Filtered Permutations: ~p~n", [FilteredPerms]),
	%io:format("Filtered length: ~p~nreg length: ~p~n", [length(FilteredPerms), length(Perms)]),
	done.



%% removes permutations where multiple amino acids share a bind point
filter_redundant_perms(Perms) ->
	lists:filter(fun filter_perms/1, Perms).
filter_perms(L) ->
	Result = lists:foldl(fun check_redundant_ref/2, gb_sets:new(), L),
	if Result == false -> false;
		 true -> true
	end.
check_redundant_ref(_, false) -> false;
check_redundant_ref({Ref, _, _}, Sets) ->
	Is_elem = gb_sets:is_element(Ref, Sets),
	if Is_elem == true -> false;
		 true -> gb_sets:add(Ref, Sets)
	end.




%% BindPoints = [ [ {Ref, TopOrBot, Ops}...], ...]
get_all_perms(L) ->
	get_all_perms(L, []).

%% get all combinations of binding points
get_all_perms([], Perms) ->Perms;
get_all_perms([Hd|Tl], []) ->
	P = [[X] || X <- Hd],
	get_all_perms(Tl, P);
get_all_perms([Hd|Tl], Perms) ->
	%P = [[{XRef, XPos, XOp}]++[{YRef, YPos, YOp}] || [{XRef, XPos, XOp}] <- Perms, {YRef, YPos, YOp} <- Hd, XRef =/= YRef],
	P = [X++[Y] || X <- Perms, Y <- Hd],
	get_all_perms(Tl, P).



findAllPossibleBindPoints(FormattedStrands, Operators) ->
	F1 = fun({BindPoint, Ops}, AccIn1) ->
		F2 = fun(OneStrand, AccIn2) ->
			%% OneStrand = [{BaseBot, BaseTop, Ref}...]
			F3 = fun({BotBase, TopBase, Ref}, AccIn) ->
				if BotBase == BindPoint andalso TopBase == BindPoint ->
						 El = {Ref, bot, Ops},
						 El2 = {Ref, top, Ops},
						 [El | [El2 | AccIn]];
					BotBase == BindPoint ->
						 El = {Ref, bot, Ops},
						 [El | AccIn];
					TopBase == BindPoint ->
						 El = {Ref, top, Ops},
						 [El | AccIn];
					 true -> AccIn
				end
			end,
			L = lists:foldl(F3, [], OneStrand),
			L ++ AccIn2
		end,
		L = lists:foldl(F2, [], FormattedStrands),
		[L | AccIn1]
	end,
	lists:foldl(F1, [], Operators).



%% FORMAT STRANDS
formatInitialStrand(Strand) ->
	Out = lists:foldl(fun strandFormatter/2, [], lists:reverse(Strand)),
	[Out].

strandFormatter(Elem, AccIn) ->
	Ref = make_ref(),
	Val = {Elem, x, Ref},
	[Val | AccIn].


%% BUILD OPERATIONS

%% returns a list of all gene commands and their binding prefs
%% eg: [{c,[cut,int]},{c,[cop,rpy,inc]}]
getFinalOperators(Dupes) ->
	lists:foldl(fun geneHandler/2, [], Dupes).


%% elem is a list of tuples, eg [{c,g}, {a,t}]
geneHandler(Dupes, AccIn) ->
	Dirs = createDirList(Dupes),
	Dir = getFinalDir(Dirs),
	BindingPref = getBindingPref(Dir),
	CommandList = lists:foldl(fun getCommandFromDupe/2, [], Dupes),
	Out = {BindingPref, CommandList},
	[Out | AccIn].


getCommandFromDupe(Dupe, AccIn) ->
	C = getCommandFromDupe(Dupe),
	AccIn ++ [C].

getCommandFromDupe({a, a}) -> exit(bad_command_aa); %% should never get here
getCommandFromDupe({a, c}) -> cut;
getCommandFromDupe({a, g}) -> del;
getCommandFromDupe({a, t}) -> swi;
getCommandFromDupe({c, a}) -> mvr;
getCommandFromDupe({c, c}) -> mvl;
getCommandFromDupe({c, g}) -> cop;
getCommandFromDupe({c, t}) -> off;
getCommandFromDupe({g, a}) -> ina;
getCommandFromDupe({g, c}) -> inc;
getCommandFromDupe({g, g}) -> ing;
getCommandFromDupe({g, t}) -> int;
getCommandFromDupe({t, a}) -> rpy;
getCommandFromDupe({t, c}) -> rpu;
getCommandFromDupe({t, g}) -> lpy;
getCommandFromDupe({t, t}) -> lpu.


getBindingPref(r) -> a;
getBindingPref(u) -> c;
getBindingPref(d) -> g;
getBindingPref(l) -> t.


getFinalDir(DirList) ->
	%% always start pointing to the right
	lists:foldl(fun foldHandler/2, r, DirList).

foldHandler(s, AccIn) -> AccIn;
foldHandler(r, u) -> r;
foldHandler(r, l) -> u;
foldHandler(r, d) -> l;
foldHandler(r, r) -> d;
foldHandler(l, u) -> l;
foldHandler(l, l) -> d;
foldHandler(l, d) -> r;
foldHandler(l, r) -> u.



%% converts ["ATCGT"] -> [{"A", "T"}, {"C", "G"}]
convertToDuplicates(Strand) ->
	Tups = convertToTuples(Strand, []),
	Out = lists:foldl(fun tupHandler/2, [], Tups),
	%% reverse the list just so it is in the same order as the input, which is strictly a superficial change
	lists:reverse(Out).

tupHandler({a, a}, []) -> [[]];
tupHandler(El, []) -> [[El]];
tupHandler({a, a}, [Hd|Tl]) -> [[] | [Hd | Tl]];
tupHandler(El, [Hd|Tl]) ->
	Hd2 = Hd ++ [El],
	[Hd2 | Tl].



convertToTuples([], L) -> L;
convertToTuples([_], L) -> L;
convertToTuples([B1|[B2|Tl]], L) ->
	L2 = L ++ [{B1, B2}],
	convertToTuples(Tl, L2).


createDirList(Duplicates) ->
	getDirList(Duplicates, []).

getDirList([], L) -> L;
getDirList([{A, B} | Tl], L) ->
	Dir = getDir(A, B),
	L2 = L ++ [Dir],
	getDirList(Tl, L2).



getDir(a, a) -> exit(badarg_aa); %% should never get here
getDir(a, c) -> s;
getDir(a, g) -> s;
getDir(a, t) -> r;
getDir(c, a) -> s;
getDir(c, c) -> s;
getDir(c, g) -> r;
getDir(c, t) -> l;
getDir(g, a) -> s;
getDir(g, c) -> r;
getDir(g, g) -> r;
getDir(g, t) -> l;
getDir(t, a) -> r;
getDir(t, c) -> l;
getDir(t, g) -> l;
getDir(t, t) -> l.
