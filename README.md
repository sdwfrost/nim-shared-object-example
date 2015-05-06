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
nim c --noMain --header --app:lib -o:a.so a.nim
config/nim.cfg(53, 3) Hint: added path: '/home/xena/.babel/pkgs/' [Path]
config/nim.cfg(54, 3) Hint: added path: '/home/xena/.nimble/pkgs/' [Path]
Hint: used config file '/home/xena/prefix/nim/config/nim.cfg' [Conf]
Hint: system [Processing]
Hint: a [Processing]
[Linking]
Hint: operation successful (9075 lines compiled; 0.129 sec total; 14.143MB;
Debug Build) [SuccessX]
164K    a.so
```

A file called `a.so` should show up in the current working directory.

Testing This
------------

Run `make test`:

```console
$ make test
luajit a.lua
calling a.add5(4)
9
```
