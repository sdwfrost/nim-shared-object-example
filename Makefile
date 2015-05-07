build:
	nim c -d:release --noMain --header --deadCodeElim:on --app:lib -o:../lib/a.so ./src/add5.nim > /dev/null
	nim c -d:release --noMain --header --deadCodeElim:on --app:lib -o:../lib/b.so ./src/add5other.nim > /dev/null
	nim c -d:release -o:../bin/fromnim --deadCodeElim:on ./src/fromnim.nim > /dev/null
	nim c -d:release -o:../bin/dynamic --deadCodeElim:on ./src/dynamic.nim > /dev/null
	@strip lib/a.so
	@strip lib/b.so

test: build
	luajit tests/test.lua
	python tests/test.py
	bin/fromnim
	bin/dynamic
