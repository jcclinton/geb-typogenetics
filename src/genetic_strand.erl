-module(genetic_strand).

-export([cut/2, del/3, mvr/3, mvl/3, cop/3, swi/1, lpu/3, rpu/3, lpy/3, rpy/3, int/3, ina/3, ing/3, inc/3]).
-export([extract_strands/1]).
-compile([export_all]).



extract_strands(Strands) ->
	Out = lists:foldl(fun(List, AccIn) ->
									AccIn ++ separate_dual_strands(List)
							end, [], Strands),
	lists:filter(fun(El) ->
									 if El == [] -> false;
											El /= [] -> true
									 end
							 end, Out).


separate_dual_strands(Strand) ->
	ListBot = lists:foldr(fun fold_strand_bot/2, [], Strand),
	ListTop = lists:foldr(fun fold_strand_top/2, [], Strand),
	ListBot ++ ListTop.


fold_strand_bot({x,_,_}, AccIn) -> [[]|AccIn];
fold_strand_bot({Bot,_,_}, []) -> [[Bot]];
fold_strand_bot({Bot,_,_}, [Hd|Tl]) -> [[Bot|Hd]] ++ Tl.

fold_strand_top({_,x,_}, AccIn) -> [[]|AccIn];
fold_strand_top({_,Top,_}, []) -> [[Top]];
fold_strand_top({_,Top,_}, [Hd|Tl]) -> [[Top|Hd]] ++ Tl.








int(Op, FStrand, CopyMode) ->
	insert(Op, FStrand, CopyMode, t).

ina(Op, FStrand, CopyMode) ->
	insert(Op, FStrand, CopyMode, a).

ing(Op, FStrand, CopyMode) ->
	insert(Op, FStrand, CopyMode, g).

inc(Op, FStrand, CopyMode) ->
	insert(Op, FStrand, CopyMode, c).



insert({PtrRef,Pos,_}=Op, FStrand, CopyMode, Base) ->
	FStrand2 = lists:foldl(fun(List, AccIn) ->
									Out = lists:foldl(fun({_,_,Ref}=El, AccIn2) ->
																				Node = if Ref == PtrRef -> make_node(Pos, Base, CopyMode, El);
																									Ref /= PtrRef -> [El]
																							 end,
																				AccIn2 ++ Node
																		end, [], List),
									AccIn ++ [Out]
							end, [], FStrand),
	{FStrandOut,Op2} = mvr(Op, FStrand2, CopyMode),
	{FStrandOut,Op2}.


make_node(Pos, Base, CopyMode, El) ->
	Ref = make_ref(),
	NewEl = if Pos == bot ->
							 if CopyMode == false -> {Base,x,Ref};
									CopyMode == true -> {Base,get_opposite_base(Base), Ref}
							 end;
						 Pos == top ->
							 if CopyMode == false -> {x,Base,Ref};
									CopyMode == true -> {get_opposite_base(Base),Base, Ref}
							 end
					end,
	if Pos == bot -> [El, NewEl];
		Pos == top -> [NewEl, El]
	end.







lpu(Op, FStrand, CopyMode) ->
	recurse_strand(Op, FStrand, CopyMode, fun is_pu/1, fun mvl/3).

rpu(Op, FStrand, CopyMode) ->
	recurse_strand(Op, FStrand, CopyMode, fun is_pu/1, fun mvr/3).

lpy(Op, FStrand, CopyMode) ->
	recurse_strand(Op, FStrand, CopyMode, fun is_py/1, fun mvl/3).

rpy(Op, FStrand, CopyMode) ->
	recurse_strand(Op, FStrand, CopyMode, fun is_py/1, fun mvr/3).

recurse_strand({OldRef,Pos,_}=Op, FStrand, CopyMode, CheckFn, MvFn) ->
	{FStrandOut, {NewRef,_,_}=OpOut} = MvFn(Op, FStrand, CopyMode),
	if NewRef == OldRef -> {FStrandOut, OpOut};
		 NewRef /= OldRef ->
				{Bot,Top,_} = get_element(NewRef, FStrandOut),
				IsMatch = if Pos == top -> CheckFn(Top);
										 Pos == bot -> CheckFn(Bot)
									end,
				if IsMatch == true -> {FStrandOut, OpOut};
					 IsMatch == false -> recurse_strand(OpOut, FStrandOut, CopyMode, CheckFn, MvFn)
				end
	end.


get_element(PtrRef, FStrand) ->
	lists:foldl(fun(List, AccIn) ->
									lists:foldl(fun({_,_,Ref}=Op, AccIn2) ->
																	if Ref == PtrRef -> Op;
																		 Ref /= PtrRef -> AccIn2
																	end
															end, AccIn, List)
							end, false, FStrand).


is_py(a) -> true;
is_py(g) -> true;
is_py(c) -> false;
is_py(t) -> false;
is_py(x) -> false.

is_pu(a) -> false;
is_pu(g) -> false;
is_pu(c) -> true;
is_pu(t) -> true;
is_pu(x) -> false.


mvr({_,Pos,_}=Op, FStrand, CopyMode) ->
	Fn = if Pos == bot -> fun get_node_to_right/2;
					Pos == top -> fun get_node_to_left/2
			 end,
	move_one_direction(Op, FStrand, CopyMode, Fn).

mvl({_,Pos,_}=Op, FStrand, CopyMode) ->
	Fn = if Pos == top -> fun get_node_to_right/2;
					Pos == bot -> fun get_node_to_left/2
			 end,
	move_one_direction(Op, FStrand, CopyMode, Fn).

%% moves one spot in one direction, if possible
move_one_direction({PtrRef,Pos,Ops}=Op, FStrand, CopyMode, GetNodeFn) ->
	{NewRef, FStrand2} = case GetNodeFn(Op, FStrand) of
						 {Ref,_,_} ->
													 %% found match, apply copy if needed
								FStrandOut = if CopyMode == true -> copy_one_base(FStrand, Ref, Pos);
														 CopyMode == false -> FStrand
													end,
							 {Ref, FStrandOut};
						 false -> {PtrRef, FStrand}
					 end,
	NewOp = {NewRef,Pos,Ops},
	{FStrand2, NewOp}.


%% returns the node to the right of the given ptr
get_node_to_right(Op, Strand) -> get_node_to_direction(Op, Strand, right).
get_node_to_left(Op, Strand) -> get_node_to_direction(Op, Strand, left).

get_node_to_direction({PtrRef,Pos,Ops}, Strand, Dir) ->
	%% direction specific changes
	FoldFn = if Dir == right -> fun lists:foldl/3;
					Dir == left -> fun lists:foldr/3
			 end,
	NextNFn = fun(N) -> if Dir == right -> N + 1;
												 Dir == left -> N - 1
											end
						end,
	GetStartingN = fun(Len) -> if Dir == right -> 0;
																Dir == left -> Len + 1
														 end
								 end,
	%% logic independent of direction
	lists:foldl(fun(List, AccIn) ->
												Len = length(List),
												StartingN = GetStartingN(Len),
												{Status, Nout} = FoldFn(fun({_,_,Ref}, {Status, Nin}) ->
																							 if Status == go ->
																										NewStatus = if PtrRef /= Ref andalso Status == go -> go;
																																	 true -> stop
																																end,
																										NextN = NextNFn(Nin),
																										{NewStatus, NextN};
																									Status == stop -> {stop, Nin}
																							 end
																					 end, {go, StartingN}, List),
												OpOut = if Status == stop ->
																		 if Nout == 0 orelse Nout > Len -> AccIn;
																				Nout /= 0 ->
																					NextN = NextNFn(Nout),
																					if NextN =< 0 orelse NextN > Len -> AccIn;
																						 NextN > 0 andalso NextN =< Len ->
																							 {Bot,Top,NthRef} = lists:nth(NextN, List),
																							 %% if the next element is an x, you cant advance
																							 NextPtr = if Pos == bot andalso Bot == x -> PtrRef;
																														Pos == top andalso Top == x -> PtrRef;
																														true -> NthRef
																												 end,
																							 {NextPtr,Pos,Ops}
																					end
																		 end;
																	 true -> AccIn
																end,
												OpOut
										end, false, Strand).


del(PtrRef, Strand, Pos) ->
	Strand2 = map_inner_strand(fun({_,_,Ref}=El) ->
															if Ref == PtrRef -> del_base(El, Pos);
																 Ref /= PtrRef -> El
															end
														 end, Strand),
	remove_empty_nodes(Strand2).


del_base({x, x, Ref}, _) -> {x,x,Ref};
del_base({x, _, Ref}, top) -> {x,x,Ref};
del_base({x, _, _}=El, bot) -> El;
del_base({_, x, _}=El, top) -> El;
del_base({_, x, Ref}, bot) -> {x,x,Ref};
del_base({Bot, _, Ref}, top) -> {Bot, x, Ref};
del_base({_, Top, Ref}, bot) -> {x, Top, Ref}.





cut(PtrRef, Strand) ->
	Strand2 = lists:foldl(fun(List, AccIn) ->
														NewLists = cut_strand(List, PtrRef),
														AccIn ++ NewLists
												end, [], Strand),
	Strand2.


%% cut_strand([a, b, c], b) => [[a, b], [c]]
cut_strand(L, PtrRef) ->
	NewList = lists:foldl(fun({_,_,Ref}=El, AccIn) ->
									Tl = lists:last(AccIn),
									Rest = all_but_tail(AccIn),
									NewTail0 = Tl ++ [El],
									%io:format("~naccin: ~p~ntl: ~p~nrest: ~p~nnewtail0: ~p~n", [AccIn, Tl, Rest, NewTail0]),
									NewTail = if Ref == PtrRef -> [NewTail0, []];
															 Ref /= PtrRef -> [NewTail0]
														end,
									Out = if length(Rest) == 0 -> NewTail;
													 true -> Rest ++ NewTail
												end,
									%io:format("out: ~p~n~n", [Out]),
									Out
							end, [[]], L),
	lists:filter(fun(El) -> El =/= [] end, NewList).



cop(FStrand, PtrRef, Pos) ->
	copy_one_base(FStrand, PtrRef, Pos).


copy_one_base(FStrand, PtrRef, Pos) ->
	map_inner_strand(fun({Bot,Top,Ref}=El) ->
																				if Ref /= PtrRef -> El;
																					 Ref == PtrRef ->
																									 if Pos == top andalso Top /= x ->
																												NewBot = get_opposite_base(Top),
																												{NewBot, Top, Ref};
																											Pos == bot andalso Bot /= x ->
																												NewTop = get_opposite_base(Bot),
																												{Bot, NewTop, Ref};
																											true -> El
																									 end
																				end
									 end, FStrand).



swi({Ref,Pos,Ops}) ->
	NewPos = if Pos == top -> bot;
		 Pos == bot -> top
	end,
	{Ref,NewPos,Ops}.


%% helper

%% removes any nodes of the type {x,x,_} that may be left over from any operation
remove_empty_nodes(Strand) ->
	filter_inner_strand(fun({Bot,Top,_}) -> Bot /= x orelse Top /= x end, Strand).

%% wrapper to filter inner strands
filter_inner_strand(Fun, Strand) ->
	lists:map(fun(List) ->
								lists:filter(Fun, List)
						end, Strand).



%% wrapper to map inner strand
map_inner_strand(Fun, Strand) ->
	lists:map(fun(List) ->
								lists:map(Fun, List)
						end, Strand).


get_opposite_base(x) -> x;
get_opposite_base(a) -> t;
get_opposite_base(t) -> a;
get_opposite_base(c) -> g;
get_opposite_base(g) -> c.

%% retrives all elements of a list except the final element
all_but_tail([]) -> [];
all_but_tail([_]) -> [];
all_but_tail([Hd|Rest]) -> [Hd | all_but_tail(Rest)].






%% old stuff
mvr_old({PtrRef,Pos,Ops}=Op, Strand, _CopyMode) ->
	Op2 = lists:foldl(fun(List, _AccIn) ->
												Len = length(List),
												{Status, Nout} = lists:foldl(fun({_,_,Ref}, {Status, Nin}) ->
																							 if Status == go ->
																										NewStatus = if PtrRef /= Ref andalso Status == go -> go;
																																	 true -> stop
																																end,
																										{NewStatus, Nin + 1};
																									Status == stop -> {stop, Nin}
																							 end
																					 end, {go, 0}, List),
												OpOut = if Status == stop ->
																		 if Nout == 0 orelse Nout == Len -> Op;
																				true ->
																					{_,_,NthRef} = lists:nth(Nout + 1, List),
																					{NthRef,Pos,Ops}
																		 end;
																	 true -> Op
																end,
												OpOut
										end, Op, Strand),
	{Strand, Op2}.

