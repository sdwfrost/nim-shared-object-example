## This module provides a simple "add 5" function to test
## Nim FFI with things that expect C functions.

proc add5*(b: int): int {.exportc: "add5"} =
  ## Returns its input plus 5
  ##
  ## A simple demonstration of a Nim proc that can be used
  ## as a C function.
  b + 5
