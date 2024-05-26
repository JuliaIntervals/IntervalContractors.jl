function asin!(X::IntervalBox)
    x, y = X

    h = inf(half_pi)
    y_new = y ⊓ Interval(-h, h)  # range of asin
    x_new = sin(y_new)

    return IntervalBox(x_new, y_new)
end

"""
Reverse `asin`.
"""
function asin_rev(y::Interval, x::Interval)  # y = asin(x)

    h = inf(half_pi)
    y_new = y ⊓ Interval(-h, h)  # range of asin

    x_new = sin(y_new)

    return y_new, x_new  # return in order y, x
end

"""
Reverse `acos`.
"""
function acos_rev(y::Interval, x::Interval)
        y_new = y ⊓ Interval(0.0,sup(two_pi))
        x_new = x ⊓ cos(y_new)

        return y_new, x_new
end

"""
    atan_rev(y::Interval, x::Interval)

Inverse of `y = atan(x)`.
Returns the new `y` and `x`.
"""
function atan_rev(y::Interval, x::Interval)
        y_new = y ⊓ Interval(-sup(half_pi), sup(half_pi))
        x_new = x ⊓ tan(y_new)

        return y_new, x_new
end
