# load add5 from the shared library at compile time
proc add5(a: int): int {.importc, dynlib: "./lib/a.so".}

# Use it
echo "Running add5(4)"
echo ($ add5(4))
