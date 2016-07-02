.PHONY: test
test:
	bundle exec rspec

.PHONY: install
install:
	bundle install

.PHONY: build
build:
	bundle exec gem build travis-feierabend.gemspec
