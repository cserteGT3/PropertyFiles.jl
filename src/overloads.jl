"""
    haskey(prop::Properties, key::String)

Check if the property-dictionary has the given key. See `Base.haskey`.
"""
haskey(prop::Properties, key::String) = haskey(prop.properties, key)

"""
    delete!(prop::Properties, key::String)

Delete the pair identified by the given key.
See `Base.delete!`.
"""
function delete!(prop::Properties, key::String)
    delete!(prop.properties, key)
    prop
end

"""
    keys(prop::Properties)

Return all keys stored in the property-dictionary.
See `Base.keys`.
"""
keys(prop::Properties) = keys(prop.properties)

"""
    values(prop::Properties)

Return all values stored in the property-dictionary.
See `Base.values`.
"""
values(prop::Properties) = values(prop.properties)

"""
    pairs(prop::Properties)

Return an iterator over `key => value` pairs.
See `Base.pairs`.
"""
pairs(prop::Properties) = pairs(prop.properties)

"""
    function sizehint!(prop::Properties, n::Integer)

From the `Base` docs: "*Suggest that collection `prop` reserve capacity for at least `n` elements.
This can improve performance.*"
"""
function sizehint!(prop::Properties, n::Integer)
    sizehint!(prop.properties, n)
    prop
end

"""
    keytype(prop::Properties)

Return type of `prop`'s keys. From it's definition it is always `String`.
"""
keytype(prop::Properties) = String

"""
    valtype(prop::Properties)

Return type of `prop`'s values. From it's definition it is always `String`.
"""
valtype(prop::Properties) = String
