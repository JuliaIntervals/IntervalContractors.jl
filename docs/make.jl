using IntervalContractors
import Documenter

Documenter.DocMeta.setdocmeta!(IntervalContractors, :DocTestSetup, :(using IntervalContractors); recursive=true)

Documenter.makedocs(;
    modules = [IntervalContractors],
    format = Documenter.HTML(; prettyurls=get(ENV, "CI", nothing) == "true"),
    sitename = "IntervalContractors.jl",
    pages = ["Home" => "index.md"]
)


Documenter.deploydocs(;
    repo = "github.com/JuliaIntervals/IntervalContractors.jl.git"
)
