-module(genetic_sup).
-behavior(supervisor).

-export([start_link/0,init/1]).



start_link() ->
	supervisor:start_link(?MODULE, []).


init(_Args) ->
	GenSpec = getGenSpec(),
	OpSupSpec = getOpSupSpec(),
	{ok, {{one_for_all, 0, 60},
				[GenSpec, OpSupSpec]}}.


%% private
getGenSpec() ->
	{genetic_generator,
	 {genetic_generator, start_link, []},
	 transient,
	 6000,
	 worker,
	 [genetic_generator]}.

getOpSupSpec() ->
	{genetic_operator_sup,
	 {genetic_operator_sup, start_link, []},
	 transient,
	 6000,
	 supervisor,
	 [genetic_operator_sup]}.
