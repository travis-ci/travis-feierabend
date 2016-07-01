# travis-feierabend

Unused code detection modeled after David Schnepper's talk (https://www.youtube.com/watch?v=29UXzfQWOhQ).

## usage

    require 'travis/feierabend'
    require 'travis/feierabend/redis_storage'

    Travis::Feierabend.configure { Travis::Feierabend::RedisStorage.new }
    Travis::Feierabend.place('2016-07-01/old-smelly-code')

    Travis::Feierabend.list_in_use('2016-07-01/old-smelly-code')

## install

    $ make install

## test

    $ make
