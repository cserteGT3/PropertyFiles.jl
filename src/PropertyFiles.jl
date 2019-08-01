module PropertyFiles

using Dates: now

export Properties, putproperty
export store, load

"""
    Properties()

Convenience constructor for `Dict{String,String}`.
"""
Properties() = Dict{String,String}()

"""
    putproperty(prop::Dict{String,String}, key::String, value::String)::Nothing

Puts a property into the property-dictionary. Only `String` keys and values can be used.
"""
function putproperty(prop::Dict{String,String}, key::String, value::String)::Nothing
    prop[key] = value
    nothing
end

"""
    putproperty(prop::Dict{String,String}, key::String, value)::Nothing

Puts a property into the property-dictionary. The `string()` constructor is used to
convert non-string values to string.
"""
function putproperty(prop::Dict{String,String}, key::String, value)::Nothing
    prop[key] = string(value)
    nothing
end

"""
    store(prop::Dict{String,String}, filename, comment::Union{String,Nothing})::Nothing

Store the property-dictionary in a text file called `filename`.
Additional comment can be added, that will be writed to the beginning of the file.
"""
function store(prop::Dict{String,String}, filename, comment::Union{String,Nothing})::Nothing
    open(abspath(filename), "w") do io
        # add comment
        if comment != nothing
            # if multiline comment, place # before every line
            comment = replace(comment, "\n" => "\n#")

            print(io, "#")
            println(io, comment)
        end
        # add date every time
        println(io, "#", now())
        # write every key-value pair
        for v in keys(prop)
            println(io, v, "=" , prop[v])
        end
    end
    nothing
end

"""
    store(prop::Dict{String,String}, filename)::Nothing

Store the property-dictionary in a text file called `filename`.
"""
function store(prop::Dict{String,String}, filename)::Nothing
    store(prop, filename, nothing)
end

"""
    load(filename)

Load `filename` propertyfile into a property-dictionary.
"""
function load(filename)
    p = Dict{String,String}()
    lines = readlines(abspath(filename))
    for line in lines
        # skip comments
        startswith(line, "#") && continue
        #split by "="
        splitted = split(line, "=")
        p[splitted[1]] = splitted[2]
    end
    p
end

end # module
