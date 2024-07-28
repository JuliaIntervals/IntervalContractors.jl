"""
    sinh_rev(c::IntervalType[, x::IntervalType])

Reverse hyperbolic sine. Calculates the preimage of `a = sinh(x)`. If `x` is not provided, then
byt default ``[-Inf, Inf]`` is used. See section 10.5.4 of the IEEE 1788-2015 standard for interval arithmetic.

### Output

The pair `(c, x_new)` where

- `c` is unchanged
- `x_new` is the interval hull of the set ``{x ∈ b : sinh(x) ∈ a}``
"""
function sinh_rev(y::IntervalType, x::IntervalType = entireinterval(y))
    x = x ⊓ asinh(y)

    return y, x
end

"""
    cosh_rev(c::IntervalType[, x::IntervalType])

Reverse square root. Calculates the preimage of `a = cosh(x)`. If `x` is not provided, then
byt default ``[-Inf, Inf]`` is used. See section 10.5.4 of the IEEE 1788-2015 standard for interval arithmetic.

### Output

The pair `(c, x_new)` where

- `c` is unchanged
- `x_new` is the interval hull of the set ``{x ∈ b : cosh(x) ∈ a}``
"""
function cosh_rev(y::IntervalType, x::IntervalType = entireinterval(y))
    y_new = y ⊓ interval(1.,Inf)
    x = (x ⊓ acosh(y)) ⊔ (x ⊓ -acosh(y))

    return y_new, x
end

"""
    tanh_rev(c::IntervalType[, x::IntervalType])

Reverse square root. Calculates the preimage of `a = tanh(x)`. If `x` is not provided, then
byt default ``[-Inf, Inf]`` is used. See section 10.5.4 of the IEEE 1788-2015 standard for interval arithmetic.

### Output

The pair `(c, x_new)` where

- `c` is unchanged
- `x_new` is the interval hull of the set ``{x ∈ b : tanh(x) ∈ a}``
"""
function tanh_rev(y::IntervalType, x::IntervalType = entireinterval(y))
    y_new = y ⊓ interval(-1.,1.)
    x = x ⊓ atanh(y)

    return y_new, x
end
