module PropertyFiles

using Dates: now

export Properties, putproperty
export store, load

Properties() = Dict{String,String}()

function putproperty(prop::Dict{String,String}, key, value::String)
    prop[key] = value
    nothing
end

function putproperty(prop::Dict{String,String}, key, value)
    prop[key] = string(value)
    nothing
end

function store(prop::Dict{String,String}, filename; comment::Union{String,Nothing}=nothing)
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
