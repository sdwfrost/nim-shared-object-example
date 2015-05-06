local ffi = require "ffi"

ffi.cdef [[
int add5(int);
]]

local a = ffi.load("./a.so")

print "calling a.add5(4)"
print(a.add5(4))
