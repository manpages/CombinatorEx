combinatorex_src := $(wildcard apps/combinatorex/lib/*.ex) \
	$(wildcard apps/combinatorex/lib/**/*.ex) \
	apps/combinatorex/mix.exs

#combinatorex_test_src := $(wildcard apps/combinatorex_test/lib/*.ex) \
#	$(wildcard apps/combinatorex_test/lib/**/*.ex) \
#	apps/combinatorex_test/mix.exs

.PHONY: clean test

test: apps/combinatorex/ebin

apps/combinatorex/ebin: $(combinatorex_src)
	@rm -rf "apps/combinatorex/ebin"
	@cd apps/combinatorex && mix do deps.get, compile
	@sh test.sh

#apps/combinatorex_test/ebin: apps/combinatorex/ebin $(combinatorex_src) $(combinatorex_test_src)
#	@rm -rf "apps/combinatorex_test/ebin"
#	@cd apps/combinatorex_test && mix do deps.get, compile

clean: 
	@cd apps/combinatorex && mix clean
#	@cd apps/combinatorex_test && mix clean

wipe: clean
	@rm -rf "deps"
