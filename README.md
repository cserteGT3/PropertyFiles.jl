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

This package implements properties and property files inspired by [Java](https://docs.oracle.com/en/java/javase/12/docs/api/java.base/java/util/Properties.html).
The Properties class only handles string keys and string values, therefore this package does that too.
Advantage is saving/loading the files is easy-peasy, downside that the user must parse/convert the strings into other types.

## Installation

Install the package by:
```julia
(v1.1) pkg> add https://github.com/cserteGT3/PropertyFiles.jl
```

## Types and functions

The whole package is based on the `Dict{String,String}` type, and a convenience constructor is available for easier use:

```julia
julia> p = Properties()
Dict{String,String} with 0 entries
```

`putproperty()` function can be used to populate the dictionary. For `String` types this is straightforward:

```julia
julia> putproperty(p, "key1", "this is a string")

julia> putproperty(p, "key2", "π")
```

Non-string types are converted before inserting them into the dictionary:

```julia
julia> putproperty(p, "key3", 156)

julia> putproperty(p, "key4", 156.0)
```

As the container is a dictionary, the standard getters can be used (see the [docs](https://docs.julialang.org/en/v1/base/collections/#Dictionaries-1)):

```julia
julia> get(p, "key1", "default value")
"this is a string"

julia> get(p, "key2", "default value")
"π"

julia> get(p, "key3", "0")
"156"

julia> get(p, "key4", "0")
"156.0"

julia> get(p, "key5", "default value")
"default value"
```

## TODO

* [ ] more tests
* [ ] more documentation
* [ ] `Base.show`
* [ ] overload more functions from [Base](https://docs.julialang.org/en/v1/base/collections/#Dictionaries-1)
* [ ] automatic conversion from string

## Acknowledgements

Many thanks to @tpapp for the [PkgSkeleton.jl](https://github.com/tpapp/PkgSkeleton.jl) package which made the publication of this package much more easier.
