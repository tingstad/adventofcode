#!/bin/awk -f
{
    split($0, chars, "")
    sum = 0
    n = length(chars)
    o = n/2
    for (i = 1; i <= n; i++) {
        if (chars[i] == chars[(i-1 + o) % n + 1])
            sum += chars[i]
    }
    print sum
}

