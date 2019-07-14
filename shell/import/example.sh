one() { echo "one: do stuff"; }
two() { echo "two: do stuff"; }

# this won't work if namespaced
t1() { t2; }
t2() { echo "t2"; }
