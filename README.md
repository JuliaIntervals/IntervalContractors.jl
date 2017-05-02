# IntervalContractors

[![travis badge][travis_badge]][travis_url]
[![appveyor badge][appveyor_badge]][appveyor_url]
[![codecov badge][codecov_badge]][codecov_url]

## Documentation

- [**STABLE**][documenter_stable] &mdash; **most recently tagged version of the documentation.**
- [**LATEST**][documenter_latest] &mdash; *in-development version of the documentation.*

[travis_badge]: https://travis-ci.org/dpsanders/IntervalContractors.jl.svg?branch=master
[travis_url]: https://travis-ci.org/dpsanders/IntervalContractors.jl

[appveyor_badge]: https://ci.appveyor.com/api/projects/status/github/dpsanders/IntervalContractors.jl?svg=true&branch=master
[appveyor_url]: https://ci.appveyor.com/project/dpsanders/intervalcontractors-jl

[codecov_badge]: http://codecov.io/github/dpsanders/IntervalContractors.jl/coverage.svg?branch=master
[codecov_url]: http://codecov.io/github/dpsanders/IntervalContractors.jl?branch=master

[documenter_stable]: https://dpsanders.github.io/IntervalContractors.jl/stable
[documenter_latest]: https://dpsanders.github.io/IntervalContractors.jl/latest

`IntervalContractors.jl` provides contractors and reverse functions for interval arithmetic.

For example, `sin_rev(Y::Interval, X::Interval)` returns the (interval hull of) those `x ∈ X` such that `sin(x) ∈ Y`.

This can be thought of as an inverse function, returning $\sin^{-1}(Y) \cap X$.

The list of available functions may be found in the documentation.

These functions are designed to be used inside the [`IntervalConstraintProgramming.jl`]( https://github.com/JuliaIntervals/IntervalConstraintProgramming.jl) library,
and (eventually) to satisfy the section on reverse functions in the IEEE-1788 2015 standard on interval arithmetic.

## Author

- [David P. Sanders](http://sistemas.fciencias.unam.mx/~dsanders),
Departamento de Física, Facultad de Ciencias, Universidad Nacional Autónoma de México (UNAM)


## References:
- *Applied Interval Analysis*, Luc Jaulin, Michel Kieffer, Olivier Didrit, Eric Walter (2001)

- IBEX library documentation: http://www.ibex-lib.org/doc/interval.html#backward-arithmetic



## Acknowledements
Financial support is acknowledged from DGAPA-UNAM PAPIIT grant IN-117117. The author thanks Luc Jaulin and Jordan Ninin for the [IAMOOC](http://iamooc.ensta-bretagne.fr/) online course, which introduced him to this subject.
