import dynlib

var add5Func: proc (a: int): int

echo("using a.so (will add 5)")
var lib1 = dynlib.loadLib("./a.so")

add5Func = cast[proc (a: int): int {.nimcall.}](
  lib1.symAddr("add5"))

echo(add5Func(4))

echo("using b.so (will add something else!)")
var lib2 = dynlib.loadLib("./b.so")

add5Func = cast[proc (a: int): int {.nimcall.}](
  lib2.symAddr("add5"))

echo(add5Func(4))

lib1.unloadLib()
lib2.unloadLib()
