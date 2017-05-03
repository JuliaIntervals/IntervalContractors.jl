import Documenter

Documenter.deploydocs(
    repo = "github.com/JuliaIntervals/IntervalContractors.jl.git",
    target = "build",
    deps = nothing,
    make = nothing
)
