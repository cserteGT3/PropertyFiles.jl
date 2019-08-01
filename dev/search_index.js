var documenterSearchIndex = {"docs":
[{"location":"lib/interface/#Interface-documentation-1","page":"Interface","title":"Interface documentation","text":"","category":"section"},{"location":"lib/interface/#","page":"Interface","title":"Interface","text":"Modules = [PropertyFiles]","category":"page"},{"location":"lib/interface/#PropertyFiles.Properties-Tuple{}","page":"Interface","title":"PropertyFiles.Properties","text":"Properties()\n\nConvenience constructor for Dict{String,String}.\n\n\n\n\n\n","category":"method"},{"location":"lib/interface/#PropertyFiles.load-Tuple{Any}","page":"Interface","title":"PropertyFiles.load","text":"load(filename)\n\nLoad filename propertyfile into a property-dictionary.\n\n\n\n\n\n","category":"method"},{"location":"lib/interface/#PropertyFiles.putproperty-Tuple{Dict{String,String},String,Any}","page":"Interface","title":"PropertyFiles.putproperty","text":"putproperty(prop::Dict{String,String}, key::String, value)::Nothing\n\nPuts a property into the property-dictionary. The string() constructor is used to convert non-string values to string.\n\n\n\n\n\n","category":"method"},{"location":"lib/interface/#PropertyFiles.putproperty-Tuple{Dict{String,String},String,String}","page":"Interface","title":"PropertyFiles.putproperty","text":"putproperty(prop::Dict{String,String}, key::String, value::String)::Nothing\n\nPuts a property into the property-dictionary. Only String keys and values can be used.\n\n\n\n\n\n","category":"method"},{"location":"lib/interface/#PropertyFiles.store-Tuple{Dict{String,String},Any,Union{Nothing, String}}","page":"Interface","title":"PropertyFiles.store","text":"store(prop::Dict{String,String}, filename, comment::Union{String,Nothing})::Nothing\n\nStore the property-dictionary in a text file called filename. Additional comment can be added, that will be writed to the beginning of the file.\n\n\n\n\n\n","category":"method"},{"location":"lib/interface/#PropertyFiles.store-Tuple{Dict{String,String},Any}","page":"Interface","title":"PropertyFiles.store","text":"store(prop::Dict{String,String}, filename)::Nothing\n\nStore the property-dictionary in a text file called filename.\n\n\n\n\n\n","category":"method"},{"location":"#PropertyFiles-1","page":"Home","title":"PropertyFiles","text":"","category":"section"},{"location":"#","page":"Home","title":"Home","text":"This small package uses Dictionary from Base to implement properties and property files inspired by Java. The Properties class only handles string keys and string values, therefore this package does that too. Advantage is that saving the files is easy-peasy, downside that the user must parse/convert the strings into other types.","category":"page"},{"location":"#Installation-1","page":"Home","title":"Installation","text":"","category":"section"},{"location":"#","page":"Home","title":"Home","text":"Install the package by:","category":"page"},{"location":"#","page":"Home","title":"Home","text":"(v1.1) pkg> add https://github.com/cserteGT3/PropertyFiles.jl","category":"page"},{"location":"#Types-and-functions-1","page":"Home","title":"Types and functions","text":"","category":"section"},{"location":"#","page":"Home","title":"Home","text":"The whole package is based on the Dict{String,String} type, and a convenience constructor is available for easier use:","category":"page"},{"location":"#","page":"Home","title":"Home","text":"julia> p = Properties()\nDict{String,String} with 0 entries","category":"page"},{"location":"#","page":"Home","title":"Home","text":"putproperty() function can be used to populate the dictionary. For String types this is straightforward:","category":"page"},{"location":"#","page":"Home","title":"Home","text":"julia> putproperty(p, \"key1\", \"this is a string\")\n\njulia> putproperty(p, \"key2\", \"π\")","category":"page"},{"location":"#","page":"Home","title":"Home","text":"Non-string types are converted before inserting them into the dictionary (more on that: Usage with user defined types):","category":"page"},{"location":"#","page":"Home","title":"Home","text":"julia> putproperty(p, \"key3\", 156)\n\njulia> putproperty(p, \"key4\", 156.0)","category":"page"},{"location":"#","page":"Home","title":"Home","text":"As the container is a dictionary, the standard getters can be used (see the docs):","category":"page"},{"location":"#","page":"Home","title":"Home","text":"julia> get(p, \"key1\", \"default value\")\n\"this is a string\"\n\njulia> get(p, \"key2\", \"default value\")\n\"π\"\n\njulia> get(p, \"key3\", \"0\")\n\"156\"\n\njulia> get(p, \"key4\", \"0\")\n\"156.0\"\n\njulia> get(p, \"key5\", \"default value\")\n\"default value\"","category":"page"},{"location":"#","page":"Home","title":"Home","text":"I did not want to override the standard getters, therefore it is suggested to use string default values (see the following example):","category":"page"},{"location":"#","page":"Home","title":"Home","text":"julia> get(p, \"k\", \"10\")\n\"10\"\n\njulia> get(p, \"k\", 10)\n10","category":"page"},{"location":"#","page":"Home","title":"Home","text":"The first one returns a string, while latter an integer. As the container can only store strings, using the latter could cause problems if the result would be parsed later.","category":"page"},{"location":"#Storing-and-loading-files-1","page":"Home","title":"Storing and loading files","text":"","category":"section"},{"location":"#","page":"Home","title":"Home","text":"TBD","category":"page"},{"location":"#File-format-1","page":"Home","title":"File format","text":"","category":"section"},{"location":"#","page":"Home","title":"Home","text":"TBD","category":"page"},{"location":"#Usage-with-user-defined-types-1","page":"Home","title":"Usage with user defined types","text":"","category":"section"},{"location":"#","page":"Home","title":"Home","text":"TBD","category":"page"}]
}
