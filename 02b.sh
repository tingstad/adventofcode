#!/usr/bin/env bash

check() {
    awk -F ' ' '{
        for (i=1; i <= NF; i++) {
            for (j=i+1; j <= NF; j++) {
                a = ($i < $j ? $i : $j);
                b = ($i < $j ? $j : $i);
                if (b % a == 0) {
                    sum += b / a;
                }
            }
        }
    }
    END { print sum }'
}

[ -f "$1" ] && check < $1 && exit

cat <<- EOF | check
		5 9 2 8
		9 4 7 3
		3 8 6 5
	EOF

