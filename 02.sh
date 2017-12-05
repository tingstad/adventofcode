#!/usr/bin/env bash

check() {
    awk -F ' ' '{
        min = max = $1;
        for (i=2; i <= NF; i++) {
            if ($i < min) min = $i;
            if ($i > max) max = $i;
        }
        sum += max - min;
    }
    END { print sum }'
}

[ -f "$1" ] && check < $1 && exit

cat <<- EOF | check
		5 1 9 5    
		7 5 3
		2 4 6 8
	EOF

