-module(perm).

-export([get_all_perms/1]).


get_all_perms(L) ->
	get_all_perms(L, []).

get_all_perms([], Perms) ->Perms;
get_all_perms([Hd|Tl], []) ->
	P = [[X] || X <- Hd],
	get_all_perms(Tl, P);
get_all_perms([Hd|Tl], Perms) ->
	P = [X++[Y] || X <- Perms, Y <- Hd],
	get_all_perms(Tl, P).
