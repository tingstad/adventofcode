import fileinput

s = 0
for line in fileinput.input():
    a = line.strip().split(" ")
    c = {}
    for v in a:
        k = ''.join(sorted(v))
        if k in c:
            c[k] = c[k] + 1
        else:
            c[k] = 1
    dupl = 0
    for v in c:
        if c[v] > 1:
            dupl = dupl + 1
    if dupl == 0:
        s = s + 1

print s
