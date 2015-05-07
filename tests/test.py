# import the ability to run arbitrary .so symbols
from ctypes import cdll

# load the library
a = cdll.LoadLibrary("./lib/a.so")

# use the library
print "Calling a.so add5 from python"
print a.add5(4)
