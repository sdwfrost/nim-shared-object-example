local ffi = require "ffi"

ffi.cdef [[
int add5(int);
void NimMain();
]]

local a = ffi.load("./a.so")

print "Calling NimMain"
a.NimMain()

print "calling a.add5(4)"
print(a.add5(4))
