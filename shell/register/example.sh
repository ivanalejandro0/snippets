one() { echo "one: do stuff"; }
two() { echo "two: do stuff"; }

t1() { t2; }
t2() { echo "this is t2"; }

log() { echo "$(date): $@"; }
