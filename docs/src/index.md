# PropertyFiles

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
With the `setprop()` function you can populate the property-dictionary.
Only strings can be used for keys and values, values with other types are converted (more on that later: [Usage with user defined types](@ref)).
Note that the `setprop` function does not return anything, it mutates the given `Properties`.
```julia
julia> setprop(p, "key1", "this is a string")

julia> setprop(p, "key2", 156.0)

julia> setprop(p, "key3", 0)
```
You can get the stored values with the `getprop` function.
```julia
julia> getprop(p, "key1")
"0"

julia> getprop(p, "key2")
"156.0"

julia> getprop(p, "key3")
"0"

julia> getprop(p, "not defined key", "default value")
"default value"
```
As the last example shows, you can give a default value for the case the key not exists.

## Storing and loading files

You can save and load the property-dictionary:

```julia
julia> store(p, "filename.jlprop")

julia> store(p, "filename2.jlprop", "comments")

julia> p1 = load("filename.jlprop")
Properties(Dict("key2"=>"156.0","key3"=>"0","key1"=>"this is a string"))

julia> p2 = load("filename2.jlprop")
Properties(Dict("key2"=>"156.0","key3"=>"0","key1"=>"this is a string"))

julia> p1.properties == p2.properties == p.properties
true
```

You can see that the loaded data is the same, regardless of the comments.

## File format

The above saved files look like:

*filename.jlprop*:
```
#2019-08-02T12:41:12.109
key2=156.0
key3=0
key1=this is a string
```

*filename2.jlprop*:
```
#comments
#2019-08-02T12:41:09.798
key2=156.0
key3=0
key1=this is a string
```
Longer description of the file format is coming later...

!!! warn "Java compatibility"

    The file format is not compatible with Java's file format.
    In theory Java should be able to parse these files, but not the other way.
    (This may change in the future, but that is not a priority for now.)

## Usage with user defined types

TBD
