using IntervalContractors
using Base.Test

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

# write your own tests here
@test 1 == 1
