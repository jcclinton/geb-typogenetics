-module(typo_lib_tests).
-include_lib("eunit/include/eunit.hrl").


get_strand1() ->
	[a, g, c, t].

get_strand2() ->
	[a, g, c, t, a, g, c, t].

get_strand3() ->
	[a, g, c, t, a, c, a, a, g, a, t, c, c, a].


duplicate_start1() ->
	Strand = [a, g, c, t],
	Dup = [[{a,g},{c,t}]],
	{Strand, Dup}.
duplicate_start2() ->
	Strand = [a, g, c, t, a, g, c, t],
	Dup = [[{a,g},{c,t},{a,g},{c,t}]],
	{Strand, Dup}.
duplicate_start3() ->
	Strand = [a, g, c, t, a, c, a, a, g, a, t, c, c, a],
	Dup = [[{a,g},{c,t},{a,c}], [{g,a},{t,c},{c,a}]],
	{Strand, Dup}.

duplicate_stop(_SetupData) ->
	ok.





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% TESTS DESCRIPTIONS %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

initial_strand_test_() ->
	[{"The initial strand is formatted in the form [[{a,x,Ref}..]]",
	 {setup, fun get_initial_strand1/0, fun stop/1, fun check_initial_strand/1}},
	{"The initial strand is formatted in the form [[{a,x,Ref}..]]",
	 {setup, fun get_initial_strand2/0, fun stop/1, fun check_initial_strand/1}},
	{"The initial strand is formatted in the form [[{a,x,Ref}..]]",
	 {setup, fun get_initial_strand3/0, fun stop/1, fun check_initial_strand/1}}
	].




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% SETUP FUNCTIONS %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

get_initial_strand1() -> [a, g, c, t].
get_initial_strand2() -> [a, g, c, t, a, g, c, t].
get_initial_strand3() -> [a, g, c, t, a, c, a, a, g, a, t, c, c, a].

stop(_SetupData) ->
	ok.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Actual Tests %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

check_initial_strand(Strand) ->
	[InitialStrand] = typo_lib:formatInitialStrand(Strand),
	check_initial_strand(Strand, InitialStrand).

check_initial_strand([], []) -> [];
check_initial_strand([Base|Strand], [Base2|InitialStrand]) ->
	{Letter, x, _Ref} = Base2,
	[?_assertEqual(Letter, Base) |
	check_initial_strand(Strand, InitialStrand)].
