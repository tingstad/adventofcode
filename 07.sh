#!/usr/bin/env bash
function analyze() {
    awk '{
        for (i = 2; i <= NF; i++)
            parent[$i] = $1
        p = $1
    } END {
        while (p in parent) {
            p = parent[p]
        }
        print p
    }'
}

function fun() {
    sed 's/[^a-z ]//g;s/  */ /g' | analyze
}

fun

#cat <<- EOF | fun
#	bga (66)
#	xhth (57)
#	ebii (61)
#	havc (66)
#	ktlj (57)
#	fwft (72) -> ktlj, cntj, xhth
#	qoyq (66)
#	padx (45) -> pbga, havc, qoyq
#	tknk (41) -> ugml, padx, fwft
#	jptl (61)
#	ugml (68) -> gyxo, ebii, jptl
#	gyxo (61)
#	cntj (57)
#EOF

