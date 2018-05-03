using IntervalContractors
import Documenter

Documenter.makedocs(
    modules = [IntervalContractors],
    format = :html,
    sitename = "IntervalContractors.jl",
    root = joinpath(dirname(dirname(@__FILE__)), "docs"),
    pages = Any["Home" => "index.md"],
    strict = true,
    linkcheck = true,
    checkdocs = :exports,
    authors = "David Sanders"
)


Documenter.deploydocs(
    julia = "0.6",
    repo = "github.com/JuliaIntervals/IntervalContractors.jl.git",
    target = "build",
    deps = nothing,
    make = nothing
)
