#!/usr/bin/python

# generate xxd format hexidemal data
# use `xxd -r` to revert to binary

n = 0x168000 / 16

for i in range(0, n):
    s = "%06x0:" % i + " 0000" * 8 + "  " + "." * 16
    print s
