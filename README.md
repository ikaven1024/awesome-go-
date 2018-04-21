# Go Project Template [![Build Status](https://travis-ci.org/ikaven1024/awesome-go-.svg?branch=master)](https://travis-ci.org/ikaven1024/awesome-go-)

Easy to write and build a GO application

## Features:

- Easy to build, test without GOPATH
- Generate version from GIT

## Requires

- Git
- Golang
- Make

## Quick Start

### clone template

You can clone this template wherever you like (not limited in GOPATH).

```
git clone https://github.com/ikaven1024/go-project-template.git <your-workspace>
```

### set your GO package
Open `hack/lib/init.sh`, and set `PROJ_PACKAGE` to your GO package`

### add your application

Delete directory `cmd/awesome` and create a new one for your app. You can add more applications under `cmd`. The name of application is the same as the directory name.

You also can rename the `main.go` to any else you like.

### implement your application

Add you package implement in package

## Build

```sh
make update # update your code with gofmt or others
make        # build all of your application
make verify # run verify
make test   # run test
```

More see in Makefile.

---

Enjoy Your Self ​:smile:​
