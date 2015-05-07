proc add7*(b: int): int {.exportc: "add5"} =
  ## Return b + 7 to prove other code is loaded.
  b + 7
