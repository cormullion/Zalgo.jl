using Documenter, Zalgo, Luxor

makedocs(
    modules = [Zalgo],
    sitename = "Zalgo",
    format = Documenter.HTML(
        prettyurls = get(ENV, "CI", nothing) == "true",
        assets = ["assets/zalgo-docs.css"]),
    pages = Any[
        "Introduction"  => "index.md",
        "Index"         => "functionindex.md"
    ]
)

deploydocs(
    repo = "github.com/cormullion/Zalgo.jl.git",
    target = "build"
)
