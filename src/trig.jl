

## sin contractor: alters x and y
"""
Contractor for "main branch" of sin, from x = -π/2 to π/2.
"""
function sin_main(X::IntervalBox{N,T}) where {N,T}

    x, y = X

    h = sup(_half_pi(T))
    x_range = Interval(-h, h)
    y_range = -one(T) .. one(T)

    x = x ∩ x_range
    y = y ∩ y_range

    isempty(IntervalBox(x, y)) && return IntervalBox(x, y)

    y = y ∩ sin(x)
    x = x ∩ asin(y)

    return IntervalBox(x, y)

end

# TODO: Be careful with the pi constants if using e.g. BigFloats
sin_reverse(::Type{T}) where {T<:Real} = symmetrise(sin_main, reflect_x(_half_pi(T)))

"""
    sin!(X::IntervalBox)

Contractor for `sin`.
Takes an `IntervalBox` containing the `x` and `y` component intervals.
Returns an `IntervalBox` contracted down to the set ``y = \\sin(x)``.
"""
sin!(X::IntervalBox{N,T}) where {N,T} = periodise(sin_main, _two_pi(T))(X) ∪ periodise(sin_reverse(T), _two_pi(T))(X)

# Reverse function for sin; does not alter y
"""
    sin_rev(c::Interval[, x::Interval])

Reverse sine. Calculates the preimage of `a = sin(x)`. If `x` is not provided, then
byt default ``[-∞, ∞]`` is used. See section 10.5.4 of the IEEE 1788-2015 standard for interval arithmetic.

### Output

The pair `(c, x_new)` where

- `c` is unchanged
- `x_new` is the interval hull of the set ``{x ∈ b : sin(x) ∈ a}``
"""
function sin_rev(y::Interval, x::Interval)

    X = IntervalBox(x, y)

    X_new = sin!(X)

    return X_new[2], X_new[1]   # return in order y, x
end


## cos contractor: alters x and y
"""
Contractor for main branch of cos, from x = 0 to π.
"""
function cos_main(X::IntervalBox{N,T}) where {N,T}

    x, y = X

    x_range = Interval(0, inf(Interval{T}(π)))
    y_range = -one(T) .. one(T)

    x = x ∩ x_range
    y = y ∩ y_range

    isempty(IntervalBox(x, y)) && return IntervalBox(x, y)

    y = y ∩ cos(x)
    x = x ∩ acos(y)

    return IntervalBox(x, y)

end

# TODO: Be careful with the pi constants if using e.g. BigFloats
cos_reverse(::Type{T}) where {T<:Real} = symmetrise(cos_main, reflect_x(zero(T)))

"""
    cos!(X::IntervalBox)

Contractor for `cos`.
Takes an `IntervalBox` containing the `x` and `y` component intervals.
Returns an `IntervalBox` contracted down to the set ``y = \\cos(x)``.
"""
cos!(X::IntervalBox{N,T}) where {N,T} = periodise(cos_main, _two_pi(T))(X) ∪ periodise(cos_reverse(T), _two_pi(T))(X)


# Reverse function for cos; does not alter y
"""
    cos_rev(c::Interval[, x::Interval])

Reverse cosine. Calculates the preimage of `a = cos(x)`. If `x` is not provided, then
byt default ``[-∞, ∞]`` is used. See section 10.5.4 of the IEEE 1788-2015 standard for interval arithmetic.

### Output

The pair `(c, x_new)` where

- `c` is unchanged
- `x_new` is the interval hull of the set ``{x ∈ b : cos(x) ∈ a}``
"""
function cos_rev(y::Interval, x::Interval)

    X = IntervalBox(x, y)

    X_new = cos!(X)

    return X_new[2], X_new[1]   # return in order y, x
end


"""
Contractor for "main branch" of tan, from x = -π/2 to π/2.
"""
function tan_main(X::IntervalBox{N,T}) where {N,T}

    x, y = X

    h = sup(_half_pi(T))
    x_range = Interval(-h, h)
    x = x ∩ x_range

    isempty(x) && return IntervalBox(x, y)

    y = y ∩ tan(x)
    x = x ∩ atan(y)

    return IntervalBox(x, y)

end

tan!(X::IntervalBox{N,T}) where {N,T} = periodise(tan_main, Interval{T}(π))(X)

"""
    tan_rev(c::Interval[, x::Interval])

Reverse tangent. Calculates the preimage of `a = tan(x)`. If `x` is not provided, then
byt default ``[-∞, ∞]`` is used. See section 10.5.4 of the IEEE 1788-2015 standard for interval arithmetic.

### Output

The pair `(c, x_new)` where

- `c` is unchanged
- `x_new` is the interval hull of the set ``{x ∈ b : tan(x) ∈ a}``
"""
function tan_rev(y::Interval, x::Interval)

    X = IntervalBox(x, y)

    X_new = tan!(X)

    return X_new[2], X_new[1]   # return in order y, x
end
