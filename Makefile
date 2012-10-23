combinatorex_src := $(wildcard lib/*.ex) \
	$(wildcard lib/**/*.ex) \
	$(wildcard test/*.ex*) \
	mix.exs

.PHONY: clean test

test: ebin

ebin: $(combinatorex_src)
	@rm -rf "ebin/"
	@mix do deps.get, compile
	@sh test.sh

clean: 
	@mix clean

wipe: clean
	@rm -rf "deps"
