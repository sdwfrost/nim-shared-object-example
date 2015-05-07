local ffi = require "ffi"

-- Define the nim function into luajit ffi
ffi.cdef "int add5(int);"

-- load the library
local a = ffi.load("./lib/a.so")

-- Use the function
print "calling a.add5(4)"
print(a.add5(4))
