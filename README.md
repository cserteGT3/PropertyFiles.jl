# PropertyFiles.jl

![Lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)<!--
![Lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-stable-green.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-retired-orange.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-archived-red.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-dormant-blue.svg) -->
[![](https://img.shields.io/badge/docs-stable-blue.svg)](https://cserteGT3.github.io/PropertyFiles.jl/stable)
[![](https://img.shields.io/badge/docs-dev-blue.svg)](https://cserteGT3.github.io/PropertyFiles.jl/dev)
[![Build Status](https://travis-ci.com/cserteGT3/PropertyFiles.jl.svg?branch=master)](https://travis-ci.com/cserteGT3/PropertyFiles.jl)
[![codecov.io](http://codecov.io/github/cserteGT3/PropertyFiles.jl/coverage.svg?branch=master)](http://codecov.io/github/cserteGT3/PropertyFiles.jl?branch=master)

This small package implements properties and property files inspired by [Java](https://docs.oracle.com/en/java/javase/12/docs/api/java.base/java/util/Properties.html).
Replicating it's functionality the package only handles string keys and string values.
Advantage is that saving the files is easy-peasy, downside that the user must parse/convert the strings into other types.
The intended use covers mostly "basic" types like strings, integers, floats, but the package does not restrict the use of other types.

## Installation

Install the package by:
```julia
(v1.1) pkg> add https://github.com/cserteGT3/PropertyFiles.jl
```

## Types and functions

The package introduces the `Properties` type, which wraps a dictionary: `Dict{String,String}`.
```julia
julia> using PropertyFiles

julia> p = Properties()
Properties(Dict{String,String}())
```

`setprop()` function can be used to populate the dictionary.
Only strings can be used for keys and values, values with other types are converted.

```julia
julia> setprop(p, "key1", "this is a string")

julia> setprop(p, "key2", 156.0)
```
You can get the stored values with the `getprop` function.
```julia
julia> getprop(p, "key1")
"0"

julia> getprop(p, "key2")
"156.0"

julia> getprop(p, "not defined key", "default value")
"default value"
```
As the last example shows, you can give a default value for the case the key not exists.

## Storing and loading files

You can save and load the property-dictionary with or without comments:

```julia
julia> store(p, "filename.jlprop")

julia> store(p, "filename2.jlprop", "comments")

julia> p1 = load("filename.jlprop")
Properties(Dict("key2"=>"156.0","key3"=>"0","key1"=>"this is a string"))

julia> p1.properties == p.properties
true
```

The produced file looks like (*filename2.jlprop*):
```
#comments
#2019-08-02T12:41:09.798
key2=156.0
key3=0
key1=this is a string
```

## TODO

* [ ] more tests for different types
* [ ] add more tests in general
* [ ] more documentation
* - [ ] file format description
* - [ ] Usage with user defined types section
* [ ] overload `Base.show`
* [ ] overload more functions from [Base](https://docs.julialang.org/en/v1/base/collections/#Dictionaries-1)
* [ ] automatic conversion from string

## Acknowledgements

Many thanks to @tpapp for the [PkgSkeleton.jl](https://github.com/tpapp/PkgSkeleton.jl) package which made the publication of this package much more easier.
