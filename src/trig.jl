

## sin contractor: alters x and y
"""
Contractor for "main branch" of sin, from x = -π/2 to π/2.
"""
function sin_main(X::IntervalBox)

    x, y = X

    x_range = Interval(-half_pi.hi, half_pi.hi)
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

"""
    sin!(X::IntervalBox)

Contractor for `sin`.
Takes an `IntervalBox` containing the `x` and `y` component intervals.
Returns an `IntervalBox` contracted down to the set ``y = \\sin(x)``.
"""
sin!(X::IntervalBox) = periodise(sin_main, two_pi)(X) ∪ periodise(sin_reverse, two_pi)(X)

# Reverse function for sin; does not alter y
"""
    sin_rev(y::Interval, x::Interval)

Reverse function for `sin`:
- find the subset of `x` such that ``y = \\sin(x)`` for the given `y`.
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
function cos_main(X::IntervalBox)

    x, y = X

    x_range = Interval(0, IntervalArithmetic.pi_interval(Float64).lo)
    y_range = -1..1

    x = x ∩ x_range
    y = y ∩ y_range

    isempty(IntervalBox(x, y)) && return IntervalBox(x, y)

    y = y ∩ cos(x)
    x = x ∩ acos(y)

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
cos!(X::IntervalBox) = periodise(cos_main, two_pi)(X) ∪ periodise(cos_reverse, two_pi)(X)


# Reverse function for cos; does not alter y
"""
    cos_rev(y::Interval, x::Interval)

Reverse function for `cos`:
- find the subset of `x` such that ``y = \\cos(x)`` for the given `y`.
"""
function cos_rev(y::Interval, x::Interval)

    X = IntervalBox(x, y)

    X_new = cos!(X)

    return X_new[2], X_new[1]   # return in order y, x
end


"""
Contractor for "main branch" of tan, from x = -π/2 to π/2.
"""
function tan_main(X::IntervalBox)

    x, y = X

    x_range = Interval(-half_pi.hi, half_pi.hi)

    x = x ∩ x_range

    isempty(x) && return IntervalBox(x, y)

    y = y ∩ tan(x)
    x = x ∩ atan(y)

    return IntervalBox(x, y)

end

tan!(X::IntervalBox) = periodise(tan_main, IntervalArithmetic.pi_interval(Float64))(X)

"""
    tan_rev(y::Interval, x::Interval)

Reverse function for `tan`:
- find the subset of `x` such that ``y = \\tan(x)`` for the given `y`.
"""
function tan_rev(y::Interval, x::Interval)

    X = IntervalBox(x, y)

    X_new = tan!(X)

    return X_new[2], X_new[1]   # return in order y, x
end
