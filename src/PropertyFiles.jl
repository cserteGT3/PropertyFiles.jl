module PropertyFiles

using Dates: now

import Base: haskey, delete!, keys, values, pairs, sizehint!
import Base: keytype, valtype

export  Properties,
        setprop,
        getprop,
        getprop!

export  haskey,
        delete!,
        keys,
        values,
        pairs,
        sizehint!,
        keytype,
        valtype

export  store,
        load


struct Properties
    properties::Dict{String,String}
end

"""
    Properties()

Constructor for the `Properties` type.
"""
Properties() = Properties(Dict{String,String}())

include("overloads.jl")
include("store.jl")


"""
    setprop(prop::Properties, key::String, value::String)

Puts a property into the property-dictionary.
Only `String` keys and values can be used.
"""
function setprop(prop::Properties, key::String, value::String)
    prop.properties[key] = value
    nothing
end

"""
    setprop(prop::Properties, key::String, value)

Puts a property into the property-dictionary.
The `string()` constructor is used to
convert non-string values to string.
The property-dictionary is not returned.
"""
function setprop(prop::Properties, key::String, value)
    prop.properties[key] = string(value)
    nothing
end

"""
    getprop(prop::Properties, key::String, default::Union{String,Nothing}=nothing)

Return the value stored for the given key or the given default value, if there's no such key.
"""
function getprop(prop::Properties, key::String, default::Union{String,Nothing}=nothing)
    get(prop.properties, key, default)
end

"""
    getprop!(prop::Properties, key::String, default::String)

Return the value stored for the given key.
If there's no such key, add the `key=>default` pair to the property-dictionary.
See `Base.get!`.
"""
function getprop!(prop::Properties, key::String, default::String)
    get!(prop.properties, key, default)
end

end # module
