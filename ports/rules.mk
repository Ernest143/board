# get depenecies
.PHONY: get-deps
get-deps:
	git -C $(TOP) submodule update --init $(addprefix lib/,$(GIT_SUBMODULES))

print-%:
	@echo $* = $($*)

all:
	@echo "hello"