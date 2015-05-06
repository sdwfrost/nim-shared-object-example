build:
	nim c --noMain --header --deadCodeElim:on --app:lib -o:a.so add5.nim
	@strip a.so
	@du -h a.so

test:
	luajit test.lua
