#!/bin/awk -f
{
    a[c++] = $0;
}
END {
    jumps = 0;
    i = 0;
    while (i >= 0 && i < c) {
        offset = a[i];
        if (offset >= 3)
            a[i]--;
        else
            a[i]++;
        i += offset;
        jumps++;
    }
    print jumps;
}
