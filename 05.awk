#!/bin/awk -f
{
    a[c++] = $0;
}
END {
    jumps = 0;
    i = 0;
    while (i >= 0 && i < c) {
        i += a[i]++;
        jumps++;
    }
    print jumps;
}
