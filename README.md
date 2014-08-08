# Tuleap utilites docker image

## What is it about?

It is sometime frustrating to have to deploy all the utilities (PHPAB, lessc, recess…) to
have a fully working development environment. This docker image lets you build/compile
most of the files without having to deploy all the stack on your working station.

As of today you can:
* Compile less files
* Generate autoload files

## How to use

Build your less files:

    $ docker run --rm=true -v $PWD:/tuleap enalean/tuleap-dev-swissarmyknife --less --user-id yourUserId

Generate autoload files:

    $ docker run --rm=true -v $PWD:/tuleap enalean/tuleap-dev-swissarmyknife --autoload --user-id yourUserId

## Makefile

Tuleap's makefile is also modified, you can automatically run these by issuing a `make less-docker`
or `make autoload-docker` from your Tuleap working copy.