build:
	nim c -d:release --noMain --header --deadCodeElim:on --app:lib -o:a.so add5.nim > /dev/null
	nim c -d:release --noMain --header --deadCodeElim:on --app:lib -o:b.so add5other.nim > /dev/null
	nim c -d:release --deadCodeElim:on fromnim.nim > /dev/null
	nim c -d:release --deadCodeElim:on dynamic.nim > /dev/null
	@strip a.so
	@strip b.so

test: build
	luajit test.lua
	./fromnim
	./dynamic
