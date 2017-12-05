#!/usr/bin/env awk -f
{
    split($0, a, " ");
    for (i in a)
        c[a[i]]++;
    dupl = 0;
    for (i in c) 
        if (c[i] > 1) dupl++;
    delete c;
    if (!dupl) sum++;
}
END {
    print sum;
}
