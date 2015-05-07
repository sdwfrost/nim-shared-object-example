from ctypes import cdll

a = cdll.LoadLibrary("./lib/a.so")

print "Calling a.so add5 from python"
print a.add5(4)
