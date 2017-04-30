

## sin contractor: alters x and y
"Contractor for "main branch" of sin, from x = -π/2 to π/2"
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
sin_reverse = symmetrise(sin_main, reflect_x(half_pi)

"""
    sin!(X::IntervalBox)

Contractor for `sin`.
Takes an `IntervalBox` containing the `x` and `y` component intervals.
Returns an `IntervalBox` contracted down to the set $y = \sin(x)$.
"""
sin! = periodic(sin_main, two_pi) ∪ periodic(sin_reverse, two_pi)


# Reverse function for sin; does not alter y
"""
    sin_rev(y::Interval, x::Interval)

Reverse function for `sin`; main branch, from -pi/2 to pi/2.

Find the subset of `x` such that $y = \sin(x)$ for the given `y`.
"""
function sin_rev(y::Interval, x::Interval)

    X = IntervalBox(x, y)

    X_new = sin!(X)  #

    return X_new[1]
end
