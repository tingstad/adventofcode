#!/usr/bin/env node

// Not working :(

function log(val) {
    console.log(val + (val>361527 ? " HERE" : ""));
}

a = [ 25, 1, 2, 4, 5, 10, 11, 23, 25 ];

var v = 0;
for (dim = 5; v <= 361527; dim += 2) {
    console.log("Dim " + dim);
    n = dim*dim - (dim-2)*(dim-2);
    b = [];
    for (i = 0; i < a.length; i++) {
        const is_corner = i>0 && i % (dim - 3) == 0;
        console.log("i: " + i + "  a[i]: " + a[i] + "  corner: " + is_corner);
        const a_minus_1 = (i > 0 ? a[i-1] : 0);
        const a_plus_1 = (i+1<a.length ? a[i+1] : 0);
        if (is_corner) {
            v =   b[b.length-1]
                + a[i-1]
                + a[i]
                ;
            log(v);
            b.push(v);
            const is_last = (i == a.length - 1);
            v =   b[b.length-1]
                + a[i]
                + (is_last ? b[0] : 0)
                ;
            log(v);
            b.push(v);
            if (!is_last) {
                v =   b[b.length-1]
                    + b[b.length-2]
                    + a[i]
                    + a_plus_1
                    ;
                log(v);
                b.push(v);
            }
        } else {
            v =   (b.length ? b[b.length-1] : 0)
                + a_minus_1
                + a[i]
                + a_plus_1
                ;
            log(v);
            b.push(v);
        }
        if (v>361527) break;
    }
    a = [b[b.length-1]].concat(b);
    if (v>361527) break;
}
console.log("done");

