# PropertyFiles

This small package uses `Dictionary` from Base to implement properties and property files inspired by [Java](https://docs.oracle.com/en/java/javase/12/docs/api/java.base/java/util/Properties.html).
The Properties class only handles string keys and string values, therefore this package does that too.
Advantage is that saving the files is easy-peasy, downside that the user must parse/convert the strings into other types.

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

Non-string types are converted before inserting them into the dictionary (more on that: [Usage with user defined types](@ref)):

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

I did not want to override the standard getters, therefore it is suggested to use string default values (see the following example):

```julia
julia> get(p, "k", "10")
"10"

julia> get(p, "k", 10)
10
```

The first one returns a string, while latter an integer.
As the container can only store strings, using the latter could cause problems if the result would be parsed later.

## Storing and loading files

TBD

## File format

TBD

## Usage with user defined types

TBD
