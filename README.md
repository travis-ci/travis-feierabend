# travis-feierabend

Unused code detection modeled after David Schnepper's talk (https://www.youtube.com/watch?v=29UXzfQWOhQ).

Finding unused code can be difficult. Especially in highly dynamic environments, where it is harder to make static assurances about what is in use.

Feierabend allows you to deprecated markers on code that you believe is no longer in use, and run that in production. If that code path gets executed, a backtrace is stored to redis, allowing you to see exactly what is using it.

By following a convention of including a date in the label (though some `git blame` magic could do the same) it becomes possible to filter markers by age, giving you increasing confidence that code can be cleaned up.

Here's an out-of-context Dijkstra quote for good measure:

> Program testing can be a very effective way to show the presence of bugs, but it is hopelessly inadequate for showing their absence.

## Usage

### Setup

    require 'travis/feierabend'
    require 'travis/feierabend/redis_storage'

    Travis::Feierabend.configure { Travis::Feierabend::RedisStorage.new }

### Form hypothesis on unused code

    Travis::Feierabend.deprecated('2016-07-01/no-longer-needed-code')

### Verify or refute hypothesis

    Travis::Feierabend.list_in_use('2016-07-01/no-longer-needed-code')
    #=> [{trace: "...", meta: nil}, ...]

## Installation

    $ make install

## Running the test suite

    $ make

## TODO

* method that recursively traverses a code base and its dependencies searching for `Feierabend.deprecated` in files and then using a ruby parser to extract the label from the line -- as well as calculating which line it was on
* publish gem

## License

MIT
