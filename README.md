test
=====

Test project applications

Build
-----

    $ rebar3 compile

Use
---

Add the plugin to your rebar config:

    {plugins, [
        { test, ".*", {git, "git@host:user/test.git", {tag, "0.1.0"}}}
    ]}.

Then just call your plugin directly in an existing application:


    $ rebar3 test
    ===> Fetching test
    ===> Compiling test
    <Plugin Output>
