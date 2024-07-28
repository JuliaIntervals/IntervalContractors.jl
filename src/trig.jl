

## sin contractor: alters x and y
"""
Contractor for "main branch" of sin, from x = -π/2 to π/2.
"""
function sin_main(X::IntervalBox)

    x, y = X

    h = sup(half_pi(x))

    x_range = _build_interval(x, -h, h)
    y_range = _build_interval(x, -1, 1)

    x = x ⊓ x_range
    y = y ⊓ y_range

    isempty(IntervalBox(x, y)) && return IntervalBox(x, y)

    y = y ⊓ sin(x)
    x = x ⊓ asin(y)

    return IntervalBox(x, y)

end

# TODO: Be careful with the pi constants if using e.g. BigFloats
sin_reverse = symmetrise(sin_main, reflect_x(half_pi))

"""
    sin!(X::IntervalBox)

Contractor for `sin`.
Takes an `IntervalBox` containing the `x` and `y` component intervals.
Returns an `IntervalBox` contracted down to the set ``y = \\sin(x)``.
"""
sin!(X::IntervalBox) = periodise(sin_main, two_pi)(X) ⊔ periodise(sin_reverse, two_pi)(X)

# Reverse function for sin; does not alter y
"""
    sin_rev(c::IntervalType[, x::IntervalType])

Reverse sine. Calculates the preimage of `a = sin(x)`. If `x` is not provided, then
byt default ``[-Inf, Inf]`` is used. See section 10.5.4 of the IEEE 1788-2015 standard for interval arithmetic.

### Output

The pair `(c, x_new)` where

- `c` is unchanged
- `x_new` is the interval hull of the set ``{x ∈ b : sin(x) ∈ a}``
"""
function sin_rev(y::IntervalType, x::IntervalType = entireinterval(y))

    X = IntervalBox(x, y)

    X_new = sin!(X)

    return X_new[2], X_new[1]   # return in order y, x
end


## cos contractor: alters x and y
"""
Contractor for main branch of cos, from x = 0 to π.
"""
function cos_main(X::IntervalBox)

    x, y = X

    x_range = _build_interval(x, 0, inf(pi_interval(x)))
    y_range = _build_interval(x, -1, 1)

    x = x ⊓ x_range
    y = y ⊓ y_range

    isempty(IntervalBox(x, y)) && return IntervalBox(x, y)

    y = y ⊓ cos(x)
    x = x ⊓ acos(y)

    return IntervalBox(x, y)

end

# TODO: Be careful with the pi constants if using e.g. BigFloats
cos_reverse = symmetrise(cos_main, reflect_x(0.0))

"""
    cos!(X::IntervalBox)

Contractor for `cos`.
Takes an `IntervalBox` containing the `x` and `y` component intervals.
Returns an `IntervalBox` contracted down to the set ``y = \\cos(x)``.
"""
cos!(X::IntervalBox) = periodise(cos_main, two_pi)(X) ⊔ periodise(cos_reverse, two_pi)(X)


# Reverse function for cos; does not alter y
"""
    cos_rev(c::IntervalType[, x::IntervalType])

Reverse cosine. Calculates the preimage of `a = cos(x)`. If `x` is not provided, then
byt default ``[-Inf, Inf]`` is used. See section 10.5.4 of the IEEE 1788-2015 standard for interval arithmetic.

### Output

The pair `(c, x_new)` where

- `c` is unchanged
- `x_new` is the interval hull of the set ``{x ∈ b : cos(x) ∈ a}``
"""
function cos_rev(y::IntervalType, x::IntervalType = entireinterval(y))

    X = IntervalBox(x, y)

    X_new = cos!(X)

    return X_new[2], X_new[1]   # return in order y, x
end


"""
Contractor for "main branch" of tan, from x = -π/2 to π/2.
"""
function tan_main(X::IntervalBox)

    x, y = X

    h = sup(half_pi)

    x_range = _build_interval(x, -h, h)

    x = x ⊓ x_range

    isempty_interval(x) && return IntervalBox(x, y)

    y = y ⊓ tan(x)
    x = x ⊓ atan(y)

    return IntervalBox(x, y)

end

tan!(X::IntervalBox) = periodise(tan_main, interval(π))(X)

"""
    tan_rev(c::IntervalType[, x::IntervalType])

Reverse tangent. Calculates the preimage of `a = tan(x)`. If `x` is not provided, then
byt default ``[-Inf, Inf]`` is used. See section 10.5.4 of the IEEE 1788-2015 standard for interval arithmetic.

### Output

The pair `(c, x_new)` where

- `c` is unchanged
- `x_new` is the interval hull of the set ``{x ∈ b : tan(x) ∈ a}``
"""
function tan_rev(y::IntervalType, x::IntervalType = entireinterval(y))

    X = IntervalBox(x, y)

    X_new = tan!(X)

    return X_new[2], X_new[1]   # return in order y, x
end


# build an interval of the corresponding type:
_build_interval(x::Interval, a, b) = interval(a, b)
_build_interval(x::BareInterval, a, b) = bareinterval(a, b)