-module(genetic_strand_tests).
-include_lib("eunit/include/eunit.hrl").



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% TESTS DESCRIPTIONS %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

initial_strand_test_() ->
	[{"The formatted strand will get cut",
	 {setup, fun get_cut_data1/0, fun stop/1, fun cut/1}},
	{"The formatted strand will get cut",
	 {setup, fun get_cut_data2/0, fun stop/1, fun cut/1}},
	{"the formatted strand will get cut",
	 {setup, fun get_cut_data3/0, fun stop/1, fun cut/1}},
	{"the formatted strand will get cut",
	 {setup, fun get_cut_data4/0, fun stop/1, fun cut/1}},
	{"the base will get deleted",
	 {setup, fun get_del_data1/0, fun stop/1, fun del/1}},
	{"the base will get deleted",
	 {setup, fun get_del_data2/0, fun stop/1, fun del/1}},
	{"the base will get deleted",
	 {setup, fun get_del_data3/0, fun stop/1, fun del/1}},
	{"the base will get deleted",
	 {setup, fun get_del_data4/0, fun stop/1, fun del/1}},
	{"the base will get deleted",
	 {setup, fun get_del_data5/0, fun stop/1, fun del/1}},
	{"the base will get deleted",
	 {setup, fun get_del_data6/0, fun stop/1, fun del/1}},
	{"the base will get deleted",
	 {setup, fun get_del_data7/0, fun stop/1, fun del/1}},
	{"the ptr will move to the right",
	 {setup, fun get_mvr_bot_data1/0, fun stop/1, fun mvr/1}},
	{"the ptr will move to the right",
	 {setup, fun get_mvr_bot_data2/0, fun stop/1, fun mvr/1}},
	{"the ptr will move to the right",
	 {setup, fun get_mvr_bot_data3/0, fun stop/1, fun mvr/1}},
	{"copy mode is turned on",
	 {setup, fun get_mvr_copy_bot_data1/0, fun stop/1, fun mvr_copy/1}},
	{"the ptr will move to the right",
	 {setup, fun get_mvr_copy_bot_data2/0, fun stop/1, fun mvr_copy/1}},
	{"copy mode is turned on",
	 {setup, fun get_mvr_top_data1/0, fun stop/1, fun mvr/1}},
	{"the ptr will move to the right",
	 {setup, fun get_mvr_top_data2/0, fun stop/1, fun mvr/1}},
	{"the ptr will move to the right",
	 {setup, fun get_mvr_top_data3/0, fun stop/1, fun mvr/1}},
	{"copy mode is turned on",
	 {setup, fun get_mvr_copy_top_data1/0, fun stop/1, fun mvr_copy/1}},
	{"the ptr will move to the right",
	 {setup, fun get_mvr_copy_top_data2/0, fun stop/1, fun mvr_copy/1}},
	{"the ptr will move to the right",
	 {setup, fun get_mvl_bot_data1/0, fun stop/1, fun mvl/1}},
	{"the ptr will move to the right",
	 {setup, fun get_mvl_bot_data2/0, fun stop/1, fun mvl/1}},
	{"the ptr will move to the right",
	 {setup, fun get_mvl_bot_data3/0, fun stop/1, fun mvl/1}},
	{"copy mode is turned on",
	 {setup, fun get_mvl_copy_bot_data1/0, fun stop/1, fun mvl_copy/1}},
	{"the ptr will move to the right",
	 {setup, fun get_mvl_copy_bot_data2/0, fun stop/1, fun mvl_copy/1}},
	{"copy mode is turned on",
	 {setup, fun get_mvl_top_data1/0, fun stop/1, fun mvl/1}},
	{"the ptr will move to the right",
	 {setup, fun get_mvl_top_data2/0, fun stop/1, fun mvl/1}},
	{"the ptr will move to the right",
	 {setup, fun get_mvl_top_data3/0, fun stop/1, fun mvl/1}},
	{"copy mode is turned on",
	 {setup, fun get_mvl_copy_top_data1/0, fun stop/1, fun mvl_copy/1}},
	{"the ptr will move to the right",
	 {setup, fun get_mvl_copy_top_data2/0, fun stop/1, fun mvl_copy/1}},
	{"copy mode is turned on",
	 {setup, fun get_cop_data1/0, fun stop/1, fun cop/1}},
	{"copy mode is turned on",
	 {setup, fun get_cop_data2/0, fun stop/1, fun cop/1}},
	{"copy mode is turned on",
	 {setup, fun get_cop_data3/0, fun stop/1, fun cop/1}},
	{"copy mode is turned on",
	 {setup, fun get_cop_data4/0, fun stop/1, fun cop/1}},
	{"copy mode is turned on",
	 {setup, fun get_cop_data5/0, fun stop/1, fun cop/1}},
	{"copy mode is turned on",
	 {setup, fun get_swi_data1/0, fun stop/1, fun swi/1}},
	{"copy mode is turned on",
	 {setup, fun get_swi_data2/0, fun stop/1, fun swi/1}}
	].

rpy_test_() ->
	[{"rpy test",
	 {setup, fun get_rpy_bot_data1/0, fun stop/1, fun rpy/1}},
	{"rpy test",
	 {setup, fun get_rpy_bot_data2/0, fun stop/1, fun rpy/1}},
	{"rpy test",
	 {setup, fun get_rpy_bot_data3/0, fun stop/1, fun rpy/1}},
	{"rpy test",
	 {setup, fun get_rpy_top_data1/0, fun stop/1, fun rpy/1}},
	{"rpy test",
	 {setup, fun get_rpy_top_data2/0, fun stop/1, fun rpy/1}},
	{"rpy test",
	 {setup, fun get_rpy_copy_bot_data1/0, fun stop/1, fun rpy_copy/1}},
	{"rpy test",
	 {setup, fun get_rpy_copy_bot_data2/0, fun stop/1, fun rpy_copy/1}},
	{"rpy test",
	 {setup, fun get_rpy_copy_top_data1/0, fun stop/1, fun rpy_copy/1}},
	{"rpy test",
	 {setup, fun get_rpy_copy_top_data2/0, fun stop/1, fun rpy_copy/1}}
	].
lpy_test_() ->
	[{"lpy test",
	 {setup, fun get_lpy_bot_data1/0, fun stop/1, fun lpy/1}},
	{"lpy test",
	 {setup, fun get_lpy_bot_data2/0, fun stop/1, fun lpy/1}},
	{"lpy test",
	 {setup, fun get_lpy_bot_data3/0, fun stop/1, fun lpy/1}},
	{"lpy test",
	 {setup, fun get_lpy_top_data1/0, fun stop/1, fun lpy/1}},
	{"lpy test",
	 {setup, fun get_lpy_top_data2/0, fun stop/1, fun lpy/1}},
	{"lpy test",
	 {setup, fun get_lpy_copy_bot_data1/0, fun stop/1, fun lpy_copy/1}},
	{"lpy test",
	 {setup, fun get_lpy_copy_bot_data2/0, fun stop/1, fun lpy_copy/1}},
	{"lpy test",
	 {setup, fun get_lpy_copy_top_data1/0, fun stop/1, fun lpy_copy/1}},
	{"lpy test",
	 {setup, fun get_lpy_copy_top_data2/0, fun stop/1, fun lpy_copy/1}}
	].
rpu_test_() ->
	[{"rpu test",
	 {setup, fun get_rpu_bot_data1/0, fun stop/1, fun rpu/1}},
	{"rpu test",
	 {setup, fun get_rpu_bot_data2/0, fun stop/1, fun rpu/1}},
	{"rpu test",
	 {setup, fun get_rpu_bot_data3/0, fun stop/1, fun rpu/1}},
	{"rpu test",
	 {setup, fun get_rpu_top_data1/0, fun stop/1, fun rpu/1}},
	{"rpu test",
	 {setup, fun get_rpu_top_data2/0, fun stop/1, fun rpu/1}},
	{"rpu test",
	 {setup, fun get_rpu_copy_bot_data1/0, fun stop/1, fun rpu_copy/1}},
	{"rpu test",
	 {setup, fun get_rpu_copy_bot_data2/0, fun stop/1, fun rpu_copy/1}},
	{"rpu test",
	 {setup, fun get_rpu_copy_top_data1/0, fun stop/1, fun rpu_copy/1}},
	{"rpu test",
	 {setup, fun get_rpu_copy_top_data2/0, fun stop/1, fun rpu_copy/1}}
	].
lpu_test_() ->
	[{"lpu test",
	 {setup, fun get_lpu_bot_data1/0, fun stop/1, fun lpu/1}},
	{"lpu test",
	 {setup, fun get_lpu_bot_data2/0, fun stop/1, fun lpu/1}},
	{"lpu test",
	 {setup, fun get_lpu_bot_data3/0, fun stop/1, fun lpu/1}},
	{"lpu test",
	 {setup, fun get_lpu_top_data1/0, fun stop/1, fun lpu/1}},
	{"lpu test",
	 {setup, fun get_lpu_top_data2/0, fun stop/1, fun lpu/1}},
	{"lpu test",
	 {setup, fun get_lpu_copy_bot_data1/0, fun stop/1, fun lpu_copy/1}},
	{"lpu test",
	 {setup, fun get_lpu_copy_bot_data2/0, fun stop/1, fun lpu_copy/1}},
	{"lpu test",
	 {setup, fun get_lpu_copy_top_data1/0, fun stop/1, fun lpu_copy/1}},
	{"lpu test",
	 {setup, fun get_lpu_copy_top_data2/0, fun stop/1, fun lpu_copy/1}}
	].


extract_strands_test_() ->
	[
	 {"extractor test",
		{setup, fun get_extract_data1/0, fun stop/1, fun extract_strands/1}}
	].




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% SETUP FUNCTIONS %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

get_cut_data1() ->
	PtrRef = make_ref(),
	Ref1 = make_ref(),
	FStrand = [
						 [
							{x,x, Ref1},
							{x,x, PtrRef},
							{x,x, Ref1}
						 ],
						 [
							{x,x, Ref1},
							{x,x, Ref1}
						 ]
						],
	Output = [
						[
							{x,x, Ref1},
							{x,x, PtrRef}
						],
						[
							{x,x, Ref1}
						 ],
						 [
							{x,x, Ref1},
							{x,x, Ref1}
						 ]
						],
	{FStrand, Output, PtrRef}.
get_cut_data2() ->
	PtrRef = make_ref(),
	Ref1 = make_ref(),
	FStrand = [
						 [
							{x,x, Ref1},
							{x,x, Ref1},
							{x,x, PtrRef}
						 ],
						 [
							{x,x, Ref1},
							{x,x, Ref1}
						 ]
						],
	Output = [
						[
							{x,x, Ref1},
							{x,x, Ref1},
							{x,x, PtrRef}
						],
						 [
							{x,x, Ref1},
							{x,x, Ref1}
						 ]
						],
	{FStrand, Output, PtrRef}.
get_cut_data3() ->
	PtrRef = make_ref(),
	FStrand = [
						 [
							{x,x, PtrRef}
						 ]
						],
	Output = [
						[
							{x,x, PtrRef}
						 ]
						],
	{FStrand, Output, PtrRef}.
get_cut_data4() ->
	Ref1 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [
						 [
							{x,x, Ref1},
							{x,x, Ref1}
						 ],
						 [
							{x,x, Ref1},
							{x,x, Ref1}
						 ]
						],
	Output = [
						 [
							{x,x, Ref1},
							{x,x, Ref1}
						 ],
						 [
							{x,x, Ref1},
							{x,x, Ref1}
						 ]
						],
	{FStrand, Output, PtrRef}.




get_del_data1() ->
	Ref1 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{1,x, Ref1}, {x,x, Ref1}]],
	Output = [[{1,x, Ref1}]],
	{FStrand, Output, PtrRef, top}.
get_del_data2() ->
	Ref1 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{2,x, Ref1}, {a,x, PtrRef}]],
	Output = [[{2,x, Ref1}, {a,x, PtrRef}]],
	{FStrand, Output, PtrRef, top}.
get_del_data3() ->
	Ref1 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{3,x, Ref1}, {x,a, PtrRef}]],
	Output = [[{3,x, Ref1}]],
	{FStrand, Output, PtrRef, top}.
get_del_data4() ->
	Ref1 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{4,x, Ref1}, {a,x, PtrRef}]],
	Output = [[{4,x, Ref1}]],
	{FStrand, Output, PtrRef, bot}.
get_del_data5() ->
	Ref1 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{5,x, Ref1}, {x,a, PtrRef}]],
	Output = [[{5,x, Ref1}, {x,a, PtrRef}]],
	{FStrand, Output, PtrRef, bot}.
get_del_data6() ->
	Ref1 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{6,x, Ref1}, {a,b, PtrRef}]],
	Output = [[{6,x, Ref1}, {a,x, PtrRef}]],
	{FStrand, Output, PtrRef, top}.
get_del_data7() ->
	Ref1 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{7,x, Ref1}, {a,b, PtrRef}]],
	Output = [[{7,x, Ref1}, {x,b, PtrRef}]],
	{FStrand, Output, PtrRef, bot}.



%% mvr
get_mvr_bot_data1() ->
	Ref1 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{x,x, Ref1}, {a,b, PtrRef}, {a,b, Ref1}]],
	InputOp = {PtrRef, bot, [1,b]},
	OutputOp = {Ref1, bot, [1,b]},
	{FStrand, FStrand, InputOp, OutputOp}.
get_mvr_bot_data2() ->
	Ref1 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{x,x, Ref1}, {a,b, PtrRef}], [{a,b, Ref1}]],
	InputOp = {PtrRef, bot, [2,b]},
	OutputOp = {PtrRef, bot, [2,b]},
	{FStrand, FStrand, InputOp, OutputOp}.
get_mvr_bot_data3() ->
	Ref1 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{t,x, Ref1}, {g,c, PtrRef}, {x,t, Ref1}]],
	InputOp = {PtrRef, bot, [2,b]},
	OutputOp = {PtrRef, bot, [2,b]},
	{FStrand, FStrand, InputOp, OutputOp}.

get_mvr_copy_bot_data1() ->
	Ref1 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{x,x, Ref1}, {t,x, PtrRef}, {g,x, Ref1}]],
	FStrandOutput = [[{x,x, Ref1}, {t,x, PtrRef}, {g,c, Ref1}]],
	InputOp = {PtrRef, bot, [1,b]},
	OutputOp = {Ref1, bot, [1,b]},
	{FStrand, FStrandOutput, InputOp, OutputOp}.
get_mvr_copy_bot_data2() ->
	Ref1 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{x,x, Ref1}, {t,x, PtrRef}], [{g,x, Ref1}]],
	FStrandOutput = [[{x,x, Ref1}, {t,x, PtrRef}], [{g,x, Ref1}]],
	InputOp = {PtrRef, bot, [2,b]},
	OutputOp = {PtrRef, bot, [2,b]},
	{FStrand, FStrandOutput, InputOp, OutputOp}.

get_mvr_top_data1() ->
	Ref1 = make_ref(),
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{g,c, Ref1}, {a,b, PtrRef}, {a,b, Ref2}]],
	InputOp = {PtrRef, top, [1,b]},
	OutputOp = {Ref1, top, [1,b]},
	{FStrand, FStrand, InputOp, OutputOp}.
get_mvr_top_data2() ->
	Ref1 = make_ref(),
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{t,a, Ref1}], [{a,b, PtrRef}, {a,b, Ref2}]],
	InputOp = {PtrRef, top, [2,b]},
	OutputOp = {PtrRef, top, [2,b]},
	{FStrand, FStrand, InputOp, OutputOp}.
get_mvr_top_data3() ->
	Ref1 = make_ref(),
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{t,x, Ref1}, {c,g, PtrRef}, {g,c, Ref2}]],
	InputOp = {PtrRef, top, [2,b]},
	OutputOp = {PtrRef, top, [2,b]},
	{FStrand, FStrand, InputOp, OutputOp}.

get_mvr_copy_top_data1() ->
	Ref1 = make_ref(),
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{x,g, Ref1}, {t,a, PtrRef}, {x,c, Ref2}]],
	FStrandOutput = [[{c,g, Ref1}, {t,a, PtrRef}, {x,c, Ref2}]],
	InputOp = {PtrRef, top, [1,b]},
	OutputOp = {Ref1, top, [1,b]},
	{FStrand, FStrandOutput, InputOp, OutputOp}.
get_mvr_copy_top_data2() ->
	Ref1 = make_ref(),
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{x,t, Ref1}, {t,a, PtrRef}], [{x,c, Ref2}]],
	FStrandOutput = [[{a,t, Ref1}, {t,a, PtrRef}], [{x,c, Ref2}]],
	InputOp = {PtrRef, top, [2,b]},
	OutputOp = {PtrRef, top, [2,b]},
	{FStrand, FStrandOutput, InputOp, OutputOp}.


%% mvl
get_mvl_bot_data1() ->
	Ref1 = make_ref(),
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{c,x, Ref1}, {a,b, PtrRef}, {a,b, Ref2}]],
	InputOp = {PtrRef, bot, [5,b]},
	OutputOp = {Ref1, bot, [5,b]},
	{FStrand, FStrand, InputOp, OutputOp}.
get_mvl_bot_data2() ->
	Ref1 = make_ref(),
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{x,x, Ref1}], [{a,b, PtrRef}, {a,b, Ref2}]],
	InputOp = {PtrRef, bot, [6,b]},
	OutputOp = {PtrRef, bot, [6,b]},
	{FStrand, FStrand, InputOp, OutputOp}.
get_mvl_bot_data3() ->
	Ref1 = make_ref(),
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{x,t, Ref1}, {a,b, PtrRef}, {a,b, Ref2}]],
	InputOp = {PtrRef, bot, [6,b]},
	OutputOp = {PtrRef, bot, [6,b]},
	{FStrand, FStrand, InputOp, OutputOp}.

get_mvl_copy_bot_data1() ->
	Ref1 = make_ref(),
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{c,x, Ref1}, {t,a, PtrRef}, {g,x, Ref2}]],
	FStrandOutput = [[{c,g, Ref1}, {t,a, PtrRef}, {g,x, Ref2}]],
	InputOp = {PtrRef, bot, [7,b]},
	OutputOp = {Ref1, bot, [7,b]},
	{FStrand, FStrandOutput, InputOp, OutputOp}.
get_mvl_copy_bot_data2() ->
	Ref1 = make_ref(),
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{c,x, Ref1}], [{a,t, PtrRef}, {g,x, Ref2}]],
	FStrandOutput = [[{c,x, Ref1}], [{a,t, PtrRef}, {g,x, Ref2}]],
	InputOp = {PtrRef, bot, [8,b]},
	OutputOp = {PtrRef, bot, [8,b]},
	{FStrand, FStrandOutput, InputOp, OutputOp}.

get_mvl_top_data1() ->
	Ref1 = make_ref(),
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{g,c, Ref1}, {a,b, PtrRef}, {a,b, Ref2}]],
	InputOp = {PtrRef, top, [9,b]},
	OutputOp = {Ref2, top, [9,b]},
	{FStrand, FStrand, InputOp, OutputOp}.
get_mvl_top_data2() ->
	Ref1 = make_ref(),
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{t,a, Ref1}, {a,b, PtrRef}], [{a,b, Ref2}]],
	InputOp = {PtrRef, top, [10,b]},
	OutputOp = {PtrRef, top, [10,b]},
	{FStrand, FStrand, InputOp, OutputOp}.
get_mvl_top_data3() ->
	Ref1 = make_ref(),
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{t,a, Ref1}, {c,g, PtrRef}, {t,x, Ref2}]],
	InputOp = {PtrRef, top, [10,b]},
	OutputOp = {PtrRef, top, [10,b]},
	{FStrand, FStrand, InputOp, OutputOp}.

get_mvl_copy_top_data1() ->
	Ref1 = make_ref(),
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{x,g, Ref1}, {t,a, PtrRef}, {x,c, Ref2}]],
	FStrandOutput = [[{x,g, Ref1}, {t,a, PtrRef}, {g,c, Ref2}]],
	InputOp = {PtrRef, top, [11,b]},
	OutputOp = {Ref2, top, [11,b]},
	{FStrand, FStrandOutput, InputOp, OutputOp}.
get_mvl_copy_top_data2() ->
	Ref1 = make_ref(),
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{x,t, Ref1}, {t,a, PtrRef}], [{x,c, Ref2}]],
	FStrandOutput = [[{x,t, Ref1}, {t,a, PtrRef}], [{x,c, Ref2}]],
	InputOp = {PtrRef, top, [12,b]},
	OutputOp = {PtrRef, top, [12,b]},
	{FStrand, FStrandOutput, InputOp, OutputOp}.


%% rpy

get_rpy_bot_data1() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{t,x, make_ref()}, {c,x, PtrRef}, {t,x, make_ref()}, {t,x, make_ref()}, {t,x, make_ref()}, {g,x, Ref2}, {c,x, make_ref()}]],
	InputOp = {PtrRef, bot, [1,b]},
	OutputOp = {Ref2, bot, [1,b]},
	{FStrand, FStrand, InputOp, OutputOp}.

get_rpy_bot_data2() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{t,x, make_ref()}, {c,x, PtrRef}, {t,x, make_ref()}, {t,x, make_ref()}, {t,x, make_ref()}, {t,x, Ref2}], [{g,x,make_ref()}]],
	InputOp = {PtrRef, bot, [1,b]},
	OutputOp = {Ref2, bot, [1,b]},
	{FStrand, FStrand, InputOp, OutputOp}.

get_rpy_bot_data3() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{t,x, make_ref()}, {c,x, PtrRef}, {t,x, make_ref()}, {t,x, make_ref()}, {t,x, make_ref()}, {g,x, Ref2}, {t,x, make_ref()}], [{g,x,make_ref()}]],
	InputOp = {PtrRef, bot, [1,b]},
	OutputOp = {Ref2, bot, [1,b]},
	{FStrand, FStrand, InputOp, OutputOp}.

get_rpy_top_data1() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{x,t, make_ref()}, {x,a, Ref2}, {x,t, make_ref()}, {x,t, make_ref()}, {x,t, make_ref()}, {x,g, PtrRef}, {x,c, make_ref()}]],
	InputOp = {PtrRef, top, [1,b]},
	OutputOp = {Ref2, top, [1,b]},
	{FStrand, FStrand, InputOp, OutputOp}.

get_rpy_top_data2() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{x,t, Ref2}, {x,t, make_ref()}, {x,t, make_ref()}, {x,t, make_ref()}, {x,g, PtrRef}, {x,c, make_ref()}]],
	InputOp = {PtrRef, top, [1,b]},
	OutputOp = {Ref2, top, [1,b]},
	{FStrand, FStrand, InputOp, OutputOp}.


get_rpy_copy_bot_data1() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{t,x, ref0}, {c,g, PtrRef}, {t,x, ref1}, {t,x, ref2}, {c,x, ref3}, {g,x, Ref2}, {t,x, ref4}], [{g,x,ref5}]],
	FStrandOutput = [[{t,x, ref0}, {c,g, PtrRef}, {t,a, ref1}, {t,a, ref2}, {c,g, ref3}, {g,c, Ref2}, {t,x, ref4}], [{g,x,ref5}]],
	InputOp = {PtrRef, bot, [1,b]},
	OutputOp = {Ref2, bot, [1,b]},
	{FStrand, FStrandOutput, InputOp, OutputOp}.

get_rpy_copy_bot_data2() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{t,x, ref0}, {c,g, PtrRef}, {t,x, ref1}, {t,x, ref2}, {c,x, ref3}, {t,x, Ref2}], [{t,x, ref4}], [{g,x,ref5}]],
	FStrandOutput = [[{t,x, ref0}, {c,g, PtrRef}, {t,a, ref1}, {t,a, ref2}, {c,g, ref3}, {t,a, Ref2}], [{t,x, ref4}], [{g,x,ref5}]],
	InputOp = {PtrRef, bot, [1,b]},
	OutputOp = {Ref2, bot, [1,b]},
	{FStrand, FStrandOutput, InputOp, OutputOp}.

get_rpy_copy_top_data1() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{x,t, ref0}, {x,g, Ref2}, {x,t, ref1}, {x,t, ref2}, {x,c, ref3}, {c,g, PtrRef}, {x,t, ref4}], [{x,g,ref5}]],
	FStrandOutput = [[{x,t, ref0}, {c,g, Ref2}, {a,t, ref1}, {a,t, ref2}, {g,c, ref3}, {c,g, PtrRef}, {x,t, ref4}], [{x,g,ref5}]],
	InputOp = {PtrRef, top, [1,b]},
	OutputOp = {Ref2, top, [1,b]},
	{FStrand, FStrandOutput, InputOp, OutputOp}.

get_rpy_copy_top_data2() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{x,t, ref0}, {x,g, Ref2}, {x,t, ref1}, {x,t, ref2}, {x,c, ref3}, {a,t, PtrRef}], [{x,t, ref4}], [{x,g,ref5}]],
	FStrandOutput = [[{x,t, ref0}, {c,g, Ref2}, {a,t, ref1}, {a,t, ref2}, {g,c, ref3}, {a,t, PtrRef}], [{x,t, ref4}], [{x,g,ref5}]],
	InputOp = {PtrRef, top, [1,b]},
	OutputOp = {Ref2, top, [1,b]},
	{FStrand, FStrandOutput, InputOp, OutputOp}.


%% rpu

get_rpu_bot_data1() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{a,x, make_ref()}, {g,x, PtrRef}, {a,x, make_ref()}, {a,x, make_ref()}, {a,x, make_ref()}, {c,x, Ref2}, {g,x, make_ref()}]],
	InputOp = {PtrRef, bot, [1,b]},
	OutputOp = {Ref2, bot, [1,b]},
	{FStrand, FStrand, InputOp, OutputOp}.

get_rpu_bot_data2() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{a,x, make_ref()}, {g,x, PtrRef}, {a,x, make_ref()}, {a,x, make_ref()}, {a,x, make_ref()}, {a,x, Ref2}], [{c,x,make_ref()}]],
	InputOp = {PtrRef, bot, [1,b]},
	OutputOp = {Ref2, bot, [1,b]},
	{FStrand, FStrand, InputOp, OutputOp}.

get_rpu_bot_data3() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{a,x, make_ref()}, {g,x, PtrRef}, {a,x, make_ref()}, {a,x, make_ref()}, {a,x, make_ref()}, {c,x, Ref2}, {a,x, make_ref()}], [{c,x,make_ref()}]],
	InputOp = {PtrRef, bot, [1,b]},
	OutputOp = {Ref2, bot, [1,b]},
	{FStrand, FStrand, InputOp, OutputOp}.

get_rpu_top_data1() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{x,a, make_ref()}, {x,t, Ref2}, {x,a, make_ref()}, {x,a, make_ref()}, {x,a, make_ref()}, {x,c, PtrRef}, {x,g, make_ref()}]],
	InputOp = {PtrRef, top, [1,b]},
	OutputOp = {Ref2, top, [1,b]},
	{FStrand, FStrand, InputOp, OutputOp}.

get_rpu_top_data2() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{x,a, Ref2}, {x,a, make_ref()}, {x,a, make_ref()}, {x,a, make_ref()}, {x,c, PtrRef}, {x,g, make_ref()}]],
	InputOp = {PtrRef, top, [1,b]},
	OutputOp = {Ref2, top, [1,b]},
	{FStrand, FStrand, InputOp, OutputOp}.


get_rpu_copy_bot_data1() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{a,x, ref0}, {g,c, PtrRef}, {a,x, ref1}, {a,x, ref2}, {g,x, ref3}, {c,x, Ref2}, {a,x, ref4}], [{c,x,ref5}]],
	FStrandOutput = [[{a,x, ref0}, {g,c, PtrRef}, {a,t, ref1}, {a,t, ref2}, {g,c, ref3}, {c,g, Ref2}, {a,x, ref4}], [{c,x,ref5}]],
	InputOp = {PtrRef, bot, [1,b]},
	OutputOp = {Ref2, bot, [1,b]},
	{FStrand, FStrandOutput, InputOp, OutputOp}.

get_rpu_copy_bot_data2() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{a,x, ref0}, {g,c, PtrRef}, {a,x, ref1}, {a,x, ref2}, {g,x, ref3}, {a,x, Ref2}], [{a,x, ref4}], [{c,x,ref5}]],
	FStrandOutput = [[{a,x, ref0}, {g,c, PtrRef}, {a,t, ref1}, {a,t, ref2}, {g,c, ref3}, {a,t, Ref2}], [{a,x, ref4}], [{c,x,ref5}]],
	InputOp = {PtrRef, bot, [1,b]},
	OutputOp = {Ref2, bot, [1,b]},
	{FStrand, FStrandOutput, InputOp, OutputOp}.

get_rpu_copy_top_data1() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{x,a, ref0}, {x,c, Ref2}, {x,a, ref1}, {x,a, ref2}, {x,g, ref3}, {g,c, PtrRef}, {x,a, ref4}], [{x,c,ref5}]],
	FStrandOutput = [[{x,a, ref0}, {g,c, Ref2}, {t,a, ref1}, {t,a, ref2}, {c,g, ref3}, {g,c, PtrRef}, {x,a, ref4}], [{x,c,ref5}]],
	InputOp = {PtrRef, top, [1,b]},
	OutputOp = {Ref2, top, [1,b]},
	{FStrand, FStrandOutput, InputOp, OutputOp}.

get_rpu_copy_top_data2() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{x,a, ref0}, {x,c, Ref2}, {x,a, ref1}, {x,a, ref2}, {x,g, ref3}, {t,a, PtrRef}], [{x,a, ref4}], [{x,c,ref5}]],
	FStrandOutput = [[{x,a, ref0}, {g,c, Ref2}, {t,a, ref1}, {t,a, ref2}, {c,g, ref3}, {t,a, PtrRef}], [{x,a, ref4}], [{x,c,ref5}]],
	InputOp = {PtrRef, top, [1,b]},
	OutputOp = {Ref2, top, [1,b]},
	{FStrand, FStrandOutput, InputOp, OutputOp}.


%% lpy

get_lpy_bot_data1() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{t,x, make_ref()}, {g,x, Ref2}, {t,x, make_ref()}, {t,x, make_ref()}, {t,x, make_ref()}, {g,x, PtrRef}, {c,x, make_ref()}]],
	InputOp = {PtrRef, bot, [1,b]},
	OutputOp = {Ref2, bot, [1,b]},
	{FStrand, FStrand, InputOp, OutputOp}.

get_lpy_bot_data2() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{t,x, make_ref()}, {g,x, Ref2}, {t,x, make_ref()}, {t,x, make_ref()}, {t,x, make_ref()}, {t,x, PtrRef}], [{g,x,make_ref()}]],
	InputOp = {PtrRef, bot, [1,b]},
	OutputOp = {Ref2, bot, [1,b]},
	{FStrand, FStrand, InputOp, OutputOp}.

get_lpy_bot_data3() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{t,x, make_ref()}, {g,x, make_ref()}, {t,x, make_ref()}, {t,x, make_ref()}], [{t,x, Ref2}, {g,x, PtrRef}, {t,x, make_ref()}], [{g,x,make_ref()}]],
	InputOp = {PtrRef, bot, [1,b]},
	OutputOp = {Ref2, bot, [1,b]},
	{FStrand, FStrand, InputOp, OutputOp}.

get_lpy_top_data1() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{x,t, make_ref()}, {x,a, PtrRef}, {x,t, make_ref()}, {x,t, make_ref()}, {x,t, make_ref()}, {x,g, Ref2}, {x,c, make_ref()}]],
	InputOp = {PtrRef, top, [1,b]},
	OutputOp = {Ref2, top, [1,b]},
	{FStrand, FStrand, InputOp, OutputOp}.

get_lpy_top_data2() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{x,t, PtrRef}, {x,t, make_ref()}, {x,t, make_ref()}, {x,t, make_ref()}, {x,t, Ref2}], [{x,c, make_ref()}]],
	InputOp = {PtrRef, top, [1,b]},
	OutputOp = {Ref2, top, [1,b]},
	{FStrand, FStrand, InputOp, OutputOp}.


get_lpy_copy_bot_data1() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{t,x, ref0}, {g,c, Ref2}, {t,x, ref1}, {t,x, ref2}, {c,x, ref3}, {g,c, PtrRef}, {t,x, ref4}], [{g,x,ref5}]],
	FStrandOutput = [[{t,x, ref0}, {g,c, Ref2}, {t,a, ref1}, {t,a, ref2}, {c,g, ref3}, {g,c, PtrRef}, {t,x, ref4}], [{g,x,ref5}]],
	InputOp = {PtrRef, bot, [1,b]},
	OutputOp = {Ref2, bot, [1,b]},
	{FStrand, FStrandOutput, InputOp, OutputOp}.

get_lpy_copy_bot_data2() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{t,x, ref0}, {g,c, Ref2}, {t,x, ref1}, {t,x, ref2}, {c,x, ref3}, {t,a, PtrRef}], [{t,x, ref4}], [{g,x,ref5}]],
	FStrandOutput = [[{t,x, ref0}, {g,c, Ref2}, {t,a, ref1}, {t,a, ref2}, {c,g, ref3}, {t,a, PtrRef}], [{t,x, ref4}], [{g,x,ref5}]],
	InputOp = {PtrRef, bot, [1,b]},
	OutputOp = {Ref2, bot, [1,b]},
	{FStrand, FStrandOutput, InputOp, OutputOp}.

get_lpy_copy_top_data1() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{x,t, ref0}, {c,g, PtrRef}, {x,t, ref1}, {x,t, ref2}, {x,c, ref3}, {c,g, Ref2}, {x,t, ref4}], [{x,g,ref5}]],
	FStrandOutput = [[{x,t, ref0}, {c,g, PtrRef}, {a,t, ref1}, {a,t, ref2}, {g,c, ref3}, {c,g, Ref2}, {x,t, ref4}], [{x,g,ref5}]],
	InputOp = {PtrRef, top, [1,b]},
	OutputOp = {Ref2, top, [1,b]},
	{FStrand, FStrandOutput, InputOp, OutputOp}.

get_lpy_copy_top_data2() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{x,t, ref0}, {c,g, PtrRef}, {x,t, ref1}, {x,t, ref2}, {x,c, ref3}, {t,a, Ref2}], [{x,t, ref4}], [{x,g,ref5}]],
	FStrandOutput = [[{x,t, ref0}, {c,g, PtrRef}, {a,t, ref1}, {a,t, ref2}, {g,c, ref3}, {t,a, Ref2}], [{x,t, ref4}], [{x,g,ref5}]],
	InputOp = {PtrRef, top, [1,b]},
	OutputOp = {Ref2, top, [1,b]},
	{FStrand, FStrandOutput, InputOp, OutputOp}.


%% lpu

get_lpu_bot_data1() ->
	Ref2 = lpu_bot1_data,
	PtrRef = lpu_bot1_ptr,
	FStrand = [[{a,x, make_ref()}, {c,x, Ref2}, {a,x, make_ref()}, {a,x, make_ref()}, {a,x, make_ref()}, {c,x, PtrRef}, {g,x, make_ref()}]],
	InputOp = {PtrRef, bot, [1,b]},
	OutputOp = {Ref2, bot, [1,b]},
	{FStrand, FStrand, InputOp, OutputOp}.

get_lpu_bot_data2() ->
	Ref2 = lpu_bot2_data,
	PtrRef = lpu_bot2_ptr,
	FStrand = [[{a,x, make_ref()}, {c,x, make_ref()}, {a,x, make_ref()}, {a,x, make_ref()}], [{a,x, Ref2}, {a,x, PtrRef}], [{c,x,make_ref()}]],
	InputOp = {PtrRef, bot, [1,b]},
	OutputOp = {Ref2, bot, [1,b]},
	{FStrand, FStrand, InputOp, OutputOp}.

get_lpu_bot_data3() ->
	Ref2 = lpu_bot3_data,
	PtrRef = lpu_bot3_ptr,
	FStrand = [[{a,x, make_ref()}, {c,x, make_ref()}, {a,x, make_ref()}, {a,x, make_ref()}], [{a,x, Ref2}, {c,x, PtrRef}, {a,x, make_ref()}], [{c,x,make_ref()}]],
	InputOp = {PtrRef, bot, [1,b]},
	OutputOp = {Ref2, bot, [1,b]},
	{FStrand, FStrand, InputOp, OutputOp}.

get_lpu_top_data1() ->
	Ref2 = lpu_top1_data,
	PtrRef = lpu_top1_ptr,
	FStrand = [[{x,a, make_ref()}, {x,t, PtrRef}, {x,a, make_ref()}, {x,a, make_ref()}, {x,a, make_ref()}, {x,c, Ref2}, {x,c, make_ref()}]],
	InputOp = {PtrRef, top, [1,b]},
	OutputOp = {Ref2, top, [1,b]},
	{FStrand, FStrand, InputOp, OutputOp}.

get_lpu_top_data2() ->
	Ref2 = lpu_top2_data,
	PtrRef = lpu_top2_ptr,
	FStrand = [[{x,a, PtrRef}, {x,a, make_ref()}, {x,a, make_ref()}, {x,a, make_ref()}, {x,c, Ref2}, {x,g, make_ref()}]],
	InputOp = {PtrRef, top, [1,b]},
	OutputOp = {Ref2, top, [1,b]},
	{FStrand, FStrand, InputOp, OutputOp}.


get_lpu_copy_bot_data1() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{a,x, ref0_cb1}, {c,g, Ref2}, {a,x, ref1}, {a,x, ref2}, {g,x, ref3}, {c,g, PtrRef}, {a,x, ref4}], [{c,x,ref5}]],
	FStrandOutput = [[{a,x, ref0_cb1}, {c,g, Ref2}, {a,t, ref1}, {a,t, ref2}, {g,c, ref3}, {c,g, PtrRef}, {a,x, ref4}], [{c,x,ref5}]],
	InputOp = {PtrRef, bot, [1,b]},
	OutputOp = {Ref2, bot, [1,b]},
	{FStrand, FStrandOutput, InputOp, OutputOp}.

get_lpu_copy_bot_data2() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{a,x, ref0_cb2}, {c,g, Ref2}, {a,x, ref1}, {a,x, ref2}, {g,x, ref3}, {a,t, PtrRef}], [{a,x, ref4}], [{c,x,ref5}]],
	FStrandOutput = [[{a,x, ref0_cb2}, {c,g, Ref2}, {a,t, ref1}, {a,t, ref2}, {g,c, ref3}, {a,t, PtrRef}], [{a,x, ref4}], [{c,x,ref5}]],
	InputOp = {PtrRef, bot, [1,b]},
	OutputOp = {Ref2, bot, [1,b]},
	{FStrand, FStrandOutput, InputOp, OutputOp}.

get_lpu_copy_top_data1() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{x,a, ref0_ct1}, {g,c, PtrRef}, {x,a, ref1}, {x,a, ref2}, {x,g, ref3}, {g,c, Ref2}, {x,a, ref4}], [{x,c,ref5}]],
	FStrandOutput = [[{x,a, ref0_ct1}, {g,c, PtrRef}, {t,a, ref1}, {t,a, ref2}, {c,g, ref3}, {g,c, Ref2}, {x,a, ref4}], [{x,c,ref5}]],
	InputOp = {PtrRef, top, [1,b]},
	OutputOp = {Ref2, top, [1,b]},
	{FStrand, FStrandOutput, InputOp, OutputOp}.

get_lpu_copy_top_data2() ->
	Ref2 = make_ref(),
	PtrRef = make_ref(),
	FStrand = [[{x,a, ref0_cp2}, {g,c, PtrRef}, {x,a, ref1}, {x,a, ref2}, {x,g, ref3}, {a,a, Ref2}], [{x,a, ref4}], [{x,c,ref5}]],
	FStrandOutput = [[{x,a, ref0_cp2}, {g,c, PtrRef}, {t,a, ref1}, {t,a, ref2}, {c,g, ref3}, {t,a, Ref2}], [{x,a, ref4}], [{x,c,ref5}]],
	InputOp = {PtrRef, top, [1,b]},
	OutputOp = {Ref2, top, [1,b]},
	{FStrand, FStrandOutput, InputOp, OutputOp}.






get_cop_data1() ->
	Ref1 = make_ref(),
	PtrRef = make_ref(),
	Pos = bot,
	FStrand = [[{x,x, Ref1}, {a,x, PtrRef}], [{a,b, Ref1}]],
	FStrandOutput = [[{x,x, Ref1}, {a,t, PtrRef}], [{a,b, Ref1}]],
	{FStrand, FStrandOutput, PtrRef, Pos}.

get_cop_data2() ->
	Ref1 = make_ref(),
	PtrRef = make_ref(),
	Pos = bot,
	FStrand = [[{x,x, Ref1}, {x,a, PtrRef}], [{a,b, Ref1}]],
	FStrandOutput = [[{x,x, Ref1}, {x,a, PtrRef}], [{a,b, Ref1}]],
	{FStrand, FStrandOutput, PtrRef, Pos}.

get_cop_data3() ->
	Ref1 = make_ref(),
	PtrRef = make_ref(),
	Pos = top,
	FStrand = [[{x,x, Ref1}, {x,c, PtrRef}], [{a,b, Ref1}]],
	FStrandOutput = [[{x,x, Ref1}, {g,c, PtrRef}], [{a,b, Ref1}]],
	{FStrand, FStrandOutput, PtrRef, Pos}.

get_cop_data4() ->
	Ref1 = make_ref(),
	PtrRef = make_ref(),
	Pos = top,
	FStrand = [[{x,x, Ref1}, {g,c, PtrRef}], [{a,b, Ref1}]],
	FStrandOutput = [[{x,x, Ref1}, {g,c, PtrRef}], [{a,b, Ref1}]],
	{FStrand, FStrandOutput, PtrRef, Pos}.

get_cop_data5() ->
	Ref1 = make_ref(),
	PtrRef = make_ref(),
	Pos = top,
	FStrand = [[{x,x, Ref1}, {g,c, Ref1}], [{a,b, Ref1}]],
	FStrandOutput = [[{x,x, Ref1}, {g,c, Ref1}], [{a,b, Ref1}]],
	{FStrand, FStrandOutput, PtrRef, Pos}.

get_swi_data1() ->
	PtrRef = make_ref(),
	Op = {PtrRef, bot, [2,b]},
	OutOp = {PtrRef, top, [2,b]},
	{Op, OutOp}.

get_swi_data2() ->
	PtrRef = make_ref(),
	Op = {PtrRef, top, [2,b]},
	OutOp = {PtrRef, bot, [2,b]},
	{Op, OutOp}.


get_extract_data1() ->
	Strand = [{a1,x,ref1}, {a2,b1,ref1}, {x,b2,ref3}, {c1,b3,ref4}, {c2,x,ref5}, {c3,d4,ref6}],
	Strands = [Strand, Strand],
	OutStrand = [[a1,a2], [c1,c2,c3], [b1,b2,b3], [d4]],
	OutStrands = OutStrand ++ OutStrand,
	{Strands, OutStrands}.




stop(_SetupData) ->
	ok.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Actual Tests %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cut({Strand, Output, PtrRef}) ->
	CutStrand = genetic_strand:cut(PtrRef, Strand),
	?_assertEqual(Output, CutStrand).

del({Strand, Output, PtrRef, Pos}) ->
	NewStrand = genetic_strand:del(PtrRef, Strand, Pos),
	?_assertEqual(Output, NewStrand).

mvr({Strand, _OutputStrand, InputOp, OutputOp}) ->
	{_NewStrand, NewOp} = genetic_strand:mvr(InputOp, Strand, false),
	?_assertEqual(OutputOp, NewOp).

mvr_copy({Strand, OutputStrand, InputOp, _OutputOp}) ->
	{NewStrand, _NewOp} = genetic_strand:mvr(InputOp, Strand, true),
	?_assertEqual(OutputStrand, NewStrand).

mvl({Strand, _OutputStrand, InputOp, OutputOp}) ->
	{_NewStrand, NewOp} = genetic_strand:mvl(InputOp, Strand, false),
	?_assertEqual(OutputOp, NewOp).

mvl_copy({Strand, OutputStrand, InputOp, _OutputOp}) ->
	{NewStrand, _NewOp} = genetic_strand:mvl(InputOp, Strand, true),
	?_assertEqual(OutputStrand, NewStrand).

rpy({Strand, _OutputStrand, InputOp, OutputOp}) ->
	{_NewStrand, NewOp} = genetic_strand:rpy(InputOp, Strand, false),
	?_assertEqual(OutputOp, NewOp).

rpy_copy({Strand, OutputStrand, InputOp, _OutputOp}) ->
	{NewStrand, _NewOp} = genetic_strand:rpy(InputOp, Strand, true),
	?_assertEqual(OutputStrand, NewStrand).

rpu({Strand, _OutputStrand, InputOp, OutputOp}) ->
	{_NewStrand, NewOp} = genetic_strand:rpu(InputOp, Strand, false),
	?_assertEqual(OutputOp, NewOp).

rpu_copy({Strand, OutputStrand, InputOp, _OutputOp}) ->
	{NewStrand, _NewOp} = genetic_strand:rpu(InputOp, Strand, true),
	?_assertEqual(OutputStrand, NewStrand).

lpy({Strand, _OutputStrand, InputOp, OutputOp}) ->
	{_NewStrand, NewOp} = genetic_strand:lpy(InputOp, Strand, false),
	?_assertEqual(OutputOp, NewOp).

lpy_copy({Strand, OutputStrand, InputOp, _OutputOp}) ->
	{NewStrand, _NewOp} = genetic_strand:lpy(InputOp, Strand, true),
	?_assertEqual(OutputStrand, NewStrand).

lpu({Strand, _OutputStrand, InputOp, OutputOp}) ->
	{_NewStrand, NewOp} = genetic_strand:lpu(InputOp, Strand, false),
	?_assertEqual(OutputOp, NewOp).

lpu_copy({Strand, OutputStrand, InputOp, _OutputOp}) ->
	{NewStrand, _NewOp} = genetic_strand:lpu(InputOp, Strand, true),
	?_assertEqual(OutputStrand, NewStrand).

swi({Op, OutOp}) ->
	Op2 = genetic_strand:swi(Op),
	?_assertEqual(OutOp, Op2).

cop({FStrand, OutputStrand, PtrRef, Pos}) ->
	FStrand2 = genetic_strand:cop(FStrand, PtrRef, Pos),
	?_assertEqual(OutputStrand, FStrand2).


extract_strands({FStrands, OutputStrands}) ->
	FStrands2 = genetic_strand:extract_strands(FStrands),
	?_assertEqual(OutputStrands, FStrands2).
