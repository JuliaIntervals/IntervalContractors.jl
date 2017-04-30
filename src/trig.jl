

## sin contractor: alters x and y
"""
Contractor for "main branch" of sin, from x = -π/2 to π/2.
"""
function sin_main(X::IntervalBox)

    x, y = X

    x_range = Interval(-half_pi.lo, half_pi.lo)
    y_range = -1..1

    x = x ∩ x_range
    y = y ∩ y_range

    isempty(IntervalBox(x, y)) && return IntervalBox(x, y)

    y = y ∩ sin(x)
    x = x ∩ asin(y)

    return IntervalBox(x, y)

end

# TODO: Be careful with the pi constants if using e.g. BigFloats
sin_reverse = symmetrise(sin_main, reflect_x(half_pi))

doc"""
    sin!(X::IntervalBox)

Contractor for `sin`.
Takes an `IntervalBox` containing the `x` and `y` component intervals.
Returns an `IntervalBox` contracted down to the set $y = \sin(x)$.
"""
sin! = periodic(sin_main, two_pi) ∪ periodic(sin_reverse, two_pi)

cos! = translate(sin!, half_pi)

# Reverse function for sin; does not alter y
doc"""
    sin_rev(y::Interval, x::Interval)

Reverse function for `sin`:
- find the subset of `x` such that $y = \sin(x)$ for the given `y`.
"""
function sin_rev(y::Interval, x::Interval)

    X = IntervalBox(x, y)

    X_new = sin!(X)

    return X_new[2], X_new[1]   # return in order y, x
end

# Reverse function for cos; does not alter y
doc"""
    cos_rev(y::Interval, x::Interval)

Reverse function for `cos`:
- find the subset of `x` such that $y = \cos(x)$ for the given `y`.
"""
function cos_rev(y::Interval, x::Interval)

    x += half_pi

    # X = IntervalBox(x, y)

    y, x_new = sin_rev(y, x)

    x_new -= half_pi

    # X_new = cos!(X)  #

    #return X_new[2], X_new[1]   # return in order y, x

    return y, x_new
end

# cos_rev(y, x) = sin_rev(y, x - half_pi)

"""
Contractor for "main branch" of tan, from x = -π/2 to π/2.
"""
function tan_main(X::IntervalBox)

    x, y = X

    x_range = Interval(-half_pi.lo, half_pi.lo)

    x = x ∩ x_range

    isempty(x) && return IntervalBox(x, y)

    y = y ∩ tan(x)
    x = x ∩ atan(y)

    return IntervalBox(x, y)

end

tan! = periodic(tan_main, 2*half_pi)

doc"""
    sin_rev(y::Interval, x::Interval)

Reverse function for `sin`:
- find the subset of `x` such that $y = \sin(x)$ for the given `y`.
"""
function tan_rev(y::Interval, x::Interval)

    X = IntervalBox(x, y)

    X_new = tan!(X)

    return X_new[2], X_new[1]   # return in order y, x
end
