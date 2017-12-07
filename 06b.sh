#!/usr/bin/env bash
function realloc() {
    awk '{
        OFS = "\t"
        seen[$0] = 1
        while (1) {
            cycles++
            max = 0
            for (i = NF; i > 0; i--)
                if ($i >= max) {
                    max = $i
                    p = i
                }
            $p = 0
            while (max > 0) {
                if (++p > NF) p = 1
                $p++
                max--
            }
            print $0
            if ($0 in seen) {
                print cycles - seen[$0]
                break
            }
            seen[$0] = cycles
        }
    }'
}

#echo -e "0\t2\t7\t0" | \
realloc

