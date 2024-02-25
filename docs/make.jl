using Documenter, Zalgo

makedocs(
    modules = [Zalgo],
    sitename = "Zalgo",
    warnonly = true,
    format = Documenter.HTML(
        prettyurls = get(ENV, "CI", nothing) == "true",
        size_threshold=nothing,
        collapselevel=1,
        assets = ["assets/zalgo-docs.css"]
    ),
    pages = Any[
        "Introduction"  => "index.md",
        "Index"         => "functionindex.md"
    ]
)

deploydocs(
    repo = "github.com/cormullion/Zalgo.jl.git",
    target = "build",
    push_preview=true,
    forcepush=true
)
