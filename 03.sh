#!/usr/bin/env bash

dist() {
    awk '
    function abs(n) {
        return n >= 0 ? n : -n;
    }
    BEGIN {
        s='$1';
        i=int(sqrt(s));
        dim = (i * i < s ? i+1 : i);
        if (dim % 2 == 0) ++dim;
        max = dim * dim;
        inside = (dim-2)*(dim-2);
        n = max - inside;
        s2 = s - inside;
        s3 = s2 % (n / 2);
        ycenter = int(dim / 2);
        xcenter = ycenter + dim - 1;
        corner = n / 4;
        vertical = (s3 >= corner ? int(dim / 2) : abs(s3 - ycenter));
        horizontal = (s3 <= corner ? int(dim / 2) : abs(s3 - xcenter));
        print vertical + horizontal;
    }'
}

check() {
    in=$1
    expect=$2
    actual=$(dist $in)
    status=$([ "$actual" == "$expect" ] && echo OK || echo FAIL)
    echo "$in $expect $actual $status"
}

check 12 3
check 23 2
check 1024 31
dist 361527
