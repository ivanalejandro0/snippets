# Each line of the command list is run as a separate invocation of the shell.
# So, if you set a variable, it won't be available in the next line! To see
# this in action, try running `make var-lost`
var-lost:
	export foo=bar
	echo "foo=[$${foo}]"

# Notice that we have to use a double-$ in the command line.  That is because
# each line of a makefile is parsed first using the makefile syntax, and THEN
# the result is passed to the shell.
# Let's try running both of the commands in the *same* shell invocation, by
# escaping the \n character.  Run `make var-kept` and note the difference.

var-kept:
	export foo=bar; echo "foo=[$${foo}]"
	export foo=bar; \
	    echo "foo=[$${foo}]"

# Export the variable to this specific target.
# Read about Target specific variable here:
# https://www.gnu.org/software/make/manual/html_node/Target_002dspecific.html
var-alt: export foo = bar_target
var-alt:
	echo "foo=[$${foo}]"

# exported for the whole makefile, even targets above
export foo_global = bar_global
var-global:
	echo "foo_global=[$${foo_global}]"
