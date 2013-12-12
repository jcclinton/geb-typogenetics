-module(genetic).
-behavior(application).

-export([start/2, stop/1]).



start(normal, _Args) ->
	genetic_sup:start_link().

stop(_State) ->
	ok.
