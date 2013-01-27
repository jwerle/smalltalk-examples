GNU SmallTalk cURL Basic Implementation
========

This is an example and learning lesson for me to understand GNU SmallTalk and its syntax.

### NOTE - requires GNU SmallTalk
See the [prerequisites](http://smalltalk.gnu.org/download) and [build guide](http://smalltalk.gnu.org/wiki/building-gst-guides). Install with these steps:
```sh
# Ubuntu/Debian
$ sudo apt-get install gst

# OSX MacPorts
$ sudo port install gst

# Brew 
$ brew install gnu-smalltalk
```

## Install
```sh
$ git clone git@github.com:jwerle/smalltalk-examples.git
$ cd smalltalk-examples/curl
$ gst-package package.xml
$ gst
```

## Usage
```st
"Load the package"
PackageLoader fileInPackage: 'Curl'.

"Execute static request message with url argument"
Curl request: 'http://everybit.co'.
```

```st
"Load the package"
PackageLoader fileInPackage: 'Curl'.

"Object Oriented approach"
c := Curl new.
c setHost: 'everybit.co'.
c setOpt: Curl FOLLOWLOCATION and: true.
c request.
```