#!/bin/awk -f
{
    split($0, chars, "")
    sum = 0
    n = length(chars)
    for (i = 1; i <= n; i++) {
        if (i > 1 && chars[i] == chars[i-1])
            sum += chars[i]
    }
    if (chars[n] == chars[1])
        sum += chars[1]
    print sum
}
