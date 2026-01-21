<h1 align="center">
IntervalBoxes

[![Build Status](https://github.com/JuliaIntervals/IntervalBoxes.jl/workflows/CI/badge.svg)](https://github.com/JuliaIntervals/IntervalBoxes.jl/actions/workflows/CI.yml)
</h1>

## About `IntervalContractors.jl`

`IntervalContractors.jl` provides contractors and reverse functions (also called backward functions or relational functions) for interval arithmetic.

### Reverse functions

The reverse function of a function `f` calculates the (interval hull of) its inverse function, `f⁻¹`.

For example, `sin_rev(Y::IntervalType, X::IntervalType)` calculates the (interval hull of) those `x ∈ X` such that `sin(x) ∈ Y`. This can also be thought of as an inverse function, calculating `X_new := sin⁻¹(Y) ⊓ X`.
The return value is `(Y, X_new)`.

Functions such as `mul_rev(C::IntervalType, A::IntervalType, B::IntervalType)` take three arguments, and correspond to `C = A * B`; they return `(C, A_new, B_new)`, with `A_new` and `B_new` similarly defined to be the corresponding inverse images of the multiplication operator in each component.

### Contractors

Functions like `sin!` (currently non-exported) are contractors for the set `{(x, y): y = sin(x)}`.

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
Financial support is acknowledged from DGAPA-UNAM PAPIIT grant IN-117117. The author thanks Luc Jaulin and Jordan Ninin for the [IAMOOC](http://iamooc.ensta-bretagne.fr/) online course, which introduced him to this subject, and Zenna Tavares for a helpful conversation.
