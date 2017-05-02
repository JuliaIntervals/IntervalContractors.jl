using IntervalContractors
using IntervalArithmetic
using Base.Test

# import Documenter
# Documenter.makedocs(
#     modules = [IntervalContractors],
#     format = :html,
#     sitename = "IntervalContractors.jl",
#     root = joinpath(dirname(dirname(@__FILE__)), "docs"),
#     pages = Any["Home" => "index.md"],
#     strict = true,
#     linkcheck = true,
#     checkdocs = :exports,
#     authors = "David Sanders"
# )

include("abs_rev.jl")
include("libieeep1788_rev.jl")

@testset "power_rev for odd power" begin
    x = -∞..∞
    a = -8..27
    power_rev(a, x, 3)[2] == Interval(-2.0000000000000004, 3.0000000000000004)
end
