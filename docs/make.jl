using Documenter, PropertyFiles

makedocs(
    modules = [PropertyFiles],
    format = :html,
    checkdocs = :exports,
    sitename = "PropertyFiles.jl",
    pages = ["Home" => "index.md"]
)

deploydocs(
    repo = "github.com/cserteGT3/PropertyFiles.jl.git",
)
