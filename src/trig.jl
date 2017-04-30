


"Main branch of sin, from -pi/2 to pi/2"
function sin0(X::IntervalBox)

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

sin_reverse = symmetrise(sin0, reflect_x(@interval(pi)/2))
