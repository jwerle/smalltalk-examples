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
$ git clone git@github.com:jwerle/smalltalk-examples.git && gst-package smalltalk-examples/curl/Release/Curl.star && gst
```
**OR**
```sh
$ git clone git@github.com:jwerle/smalltalk-examples.git
$ cd smalltalk-examples/curl
$ gst-package package.xml
$ gst
```
## Building
From the source directory:
```sh
$ make build
```

## Usage
### Execute static request message with url argument
```st
"Load the package"
PackageLoader fileInPackage: 'Curl'.

Curl request: 'http://example.com'.
```
### Object Oriented approach
```st
"Load the package"
PackageLoader fileInPackage: 'Curl'.

"Create new Curl Object"
curl := Curl new. 

"Set follow location opt"
curl opt: Curl OPT_FOLLOWLOCATION value: true. 

"Set the host, port, and URI parts"
curl host: 'localhost'; port: 4000; uri: 'my/resource'. 

"Set the query as '%secret=ed19b29410b801f2c7d2e7ff49802a6e734987fbce5b7a024c73652a'"
curl query: 'secret' value: 'ed19b29410b801f2c7d2e7ff49802a6e734987fbce5b7a024c73652a'.

"Execute a GET request by default"
c request.
```