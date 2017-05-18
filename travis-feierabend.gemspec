Gem::Specification.new do |s|
  s.name        = 'travis-feierabend'
  s.version     = '1.0.0'
  s.date        = '2016-06-01'
  s.summary     = "Feierabend"
  s.description = "Unused code detection modeled after David Schnepper's talk (https://www.youtube.com/watch?v=29UXzfQWOhQ)"
  s.authors     = ["Igor Wiedler"]
  s.email       = 'igor@travis-ci.org'
  s.files       = ["lib/travis/feierabend.rb", "lib/travis/feierabend/deprecations.rb", "lib/travis/feierabend/memory_storage.rb", "lib/travis/feierabend/redis_storage.rb"]
  s.homepage    = 'http://rubygems.org/gems/travis-feierabend'
  s.license     = 'MIT'
end
