## this is a test for dynamic loading of things such that it could
## be used as the core of a dynamic module-based application.

import dynlib

var add5Func: proc (a: int): int
  ## The function prototype that add5 is

# Load a.so, the add5 implementation
echo("using a.so (will add 5)")
var lib1 = dynlib.loadLib("./lib/a.so")

# load the add5 symbol to the function prototype
add5Func = cast[proc (a: int): int {.nimcall.}](
  lib1.symAddr("add5"))

# Use the function
echo(add5Func(4))

# load the alternative implementation
echo("using b.so (will add something else!)")
var lib2 = dynlib.loadLib("./lib/b.so")

# activate it as the prototype
add5Func = cast[proc (a: int): int {.nimcall.}](
  lib2.symAddr("add5"))

# use it
echo(add5Func(4))

# clean up
lib1.unloadLib()
lib2.unloadLib()
