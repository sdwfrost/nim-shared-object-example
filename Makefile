build:
	nim c -d:release --noMain --header --deadCodeElim:on --app:lib -o:lib/a.so add5.nim > /dev/null
	nim c -d:release --noMain --header --deadCodeElim:on --app:lib -o:lib/b.so add5other.nim > /dev/null
	nim c -d:release -o:bin/fromnim --deadCodeElim:on fromnim.nim
	nim c -d:release -o:bin/dynamic --deadCodeElim:on dynamic.nim
	@strip lib/a.so
	@strip lib/b.so

test: build
	luajit test.lua
	bin/fromnim
	bin/dynamic
