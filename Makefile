build:
	nim c -d:release --noMain --header --deadCodeElim:on --app:lib -o:a.so add5.nim
	nim c -d:release --noMain --header --deadCodeElim:on --app:lib -o:b.so add5other.nim
	nim c -d:release --deadCodeElim:on fromnim.nim
	@strip a.so
	@strip b.so

test:
	luajit test.lua
	./fromnim
