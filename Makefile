build:
	nim c --noMain --header --app:lib -o:a.so a.nim
	@strip a.so
	@du -h a.so

test:
	luajit a.lua
