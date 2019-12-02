makefile_dir := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

show:
	echo ${makefile_dir}
