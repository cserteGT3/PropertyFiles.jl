"""
    store(prop::Properties, filename, comment::Union{String,Nothing})

Store the property-dictionary in a text file called `filename`.
Additional comment can be added, that will be written to the beginning of the file.
"""
function store(prop::Properties, filename, comment::Union{String,Nothing})
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
        for v in keys(prop.properties)
            println(io, v, "=" , prop.properties[v])
        end
    end
    nothing
end

"""
    store(prop::Properties, filename)

Store the property-dictionary in a text file called `filename`.
"""
function store(prop::Properties, filename)
    store(prop, filename, nothing)
    nothing
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
    Properties(p)
end
