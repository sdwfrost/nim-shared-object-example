proc add5(a: int): int {.importc, dynlib: "./lib/a.so".}

echo "Running add5(4)"
echo ($ add5(4))
