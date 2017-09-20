-module(test_prv).

-export([init/1, do/1, format_error/1]).

-define(PROVIDER, test).
-define(DEPS, [install_deps]).

%% ===================================================================
%% Public API
%% ===================================================================
-spec init(rebar_state:t()) -> {ok, rebar_state:t()}.
init(State) ->
    Provider = providers:create([
            {name, ?PROVIDER},            % The 'user friendly' name of the task
            {module, ?MODULE},            % The module implementation of the task
            {bare, true},                 % The task can be run by the user, always true
            {deps, ?DEPS},                % The list of dependencies
            {example, "rebar3 test"}, % How to use the plugin
            {opts, []},                   % list of options understood by the plugin
            {short_desc, "Test project applications"},
            {desc, "Test project applications"}
    ]),
    {ok, rebar_state:add_provider(State, Provider)}.


-spec do(rebar_state:t()) -> {ok, rebar_state:t()} | {error, string()}.
do(State) ->
    Apps = rebar_state:project_apps(State),
    Deps = rebar_state:deps_names(State),
    AppNames = [element(2, AppInfo) || AppInfo <- Apps],
    rebar_api:info("~p APPS (~p): ~p~n", [length(Apps), AppNames, Apps]),
    rebar_api:info("~p DEPS: ~p~n", [length(Deps), Deps]),
    {ok, State}.

-spec format_error(any()) ->  iolist().
format_error(Reason) ->
    io_lib:format("~p", [Reason]).
