-module(genetic_operator_sup).
-behavior(supervisor).

-export([start_link/0]).
-export([init/1]).


%% public
start_link() ->
	supervisor:start_link({local, operator_sup}, ?MODULE, []).


%% callback
init(_Args) ->
	Spec = getSpec(),
	{ok, {{simple_one_for_one, 5, 3600}, [Spec]}}.



%% private
getSpec() ->
	{genetic_operator,
	 {genetic_operator, start_link, []},
	 temporary,
	 5000,
	 worker,
	 [genetic_operator]}.
