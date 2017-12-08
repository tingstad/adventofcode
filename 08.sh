#!/usr/bin/env bash

function run() {
    awk '
    function cond(a, op, b) {
        switch (op) {
            case "==":
                return a == b
            case ">":
                return a > b
            case "<":
                return a < b
            case ">=":
                return a >= b
            case "<=":
                return a <= b
            case "!=":
                return a != b
            default:
                print "error: " op
        }
    }
    {
        if (cond(reg[$5], $6, $7)) {
            if ($2 == "inc")
                reg[$1] += $3
            else
                reg[$1] -= $3
        }
    } END {
        for (k in reg) {
            if (reg[k] > max || length(max)<1)
                max = reg[k]
        }
        print max
    }'
}

if [ -n "$1" ]; then
    run < $1
    exit
fi

echo Test:
cat <<- EOF | run
	b inc 5 if a > 1
	a inc 1 if b < 5
	c dec -10 if a >= 1
	c inc -20 if c == 10
EOF

