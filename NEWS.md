# IntervalContractors.jl NEWS.md

## v0.5.0
- Update to `IntervalArithmetic.jl` v0.22
    - Use square versions of intersection and union symbols (available from v0.22.12)
    - Some previous functions were removed from `IntervalArithmetic.jl`

    - Adds a dependency on the separate `IntervalBoxes.jl` package (to replace the functionality removed from
      `IntervalArithmetic.jl`)

    - Although the user-facing API of `IntervalContractors.jl` has *not changed*
      in this release, the extra dependency warrants a minor-version bump
