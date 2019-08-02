haskey(prop::Properties, key::String) = haskey(prop.properties, key)

function delete!(prop::Properties, key::String)
    delete!(prop.properties, key)
    prop
end

keys(prop::Properties) = keys(prop.properties)

values(prop::Properties) = values(prop.properties)

pairs(prop::Properties) = pairs(prop.properties)

function sizehint!(prop::Properties, n::Integer)
    sizehint!(prop.properties, n)
    prop
end

keytype(prop::Properties) = String
valtype(prop::Properties) = String
