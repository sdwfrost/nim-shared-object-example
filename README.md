Making a C library in Nim
=========================

This is a simple example of how to compile a set of Nim procedures into
a library that can be imported and used by C programs at runtime.

Building
--------

Install the [Nim](http://nim-lang.org) compiler. I am using:

```console
$  nim --version
Nim Compiler Version 0.11.2 (2015-05-04) [Linux: amd64]
Copyright (c) 2006-2015 by Andreas Rumpf

git hash: 3bef848a2cf60008f23e72571d7c20c0eb9fd728
active boot switches: -d:release
```

Run `make build`:

```console
$ make build
nim c -d:release --noMain --header --deadCodeElim:on --app:lib -o:../lib/a.so ./src/add5.nim > /dev/null
nim c -d:release --noMain --header --deadCodeElim:on --app:lib -o:../lib/b.so ./src/add5other.nim > /dev/null
nim c -d:release -o:../bin/fromnim --deadCodeElim:on ./src/fromnim.nim > /dev/null
nim c -d:release -o:../bin/dynamic --deadCodeElim:on ./src/dynamic.nim > /dev/null
```

Several binaries and libraries will be put into `bin/` and `lib`. To use these 
you can wrap the function prototype of `add5` with the following C-like 
declaration:

```c
int add5(int);
```

This is fairly trivial in python:

```python
from ctypes import cdll

a = cdll.LoadLibrary("./lib/a.so")

print "Calling a.so add5 from python"
print a.add5(4)
```

Testing This
------------

You need to have luajit and python 2 installed for the tests to work.

Run `make test`:

```console
$ make test
luajit tests/test.lua
calling NimMain
calling a.add5(4)
9
python tests/test.py
Calling a.so add5 from python
9
bin/fromnim
Running add5(4)
9
bin/dynamic
using a.so (will add 5)
9
using b.so (will add something else!)
11
```
