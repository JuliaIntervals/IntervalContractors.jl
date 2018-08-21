function asin!(X::IntervalBox)
    x, y = X

    h = half_pi.lo
    y_new = y ∩ Interval(-h, h)  # range of asin
    x_new = sin(y_new)

    return IntervalBox(x_new, y_new)
end

"""
Reverse `asin`.
"""
function asin_rev(y::Interval, x::Interval)  # y = asin(x)

    h = half_pi.lo
    y_new = y ∩ Interval(-h, h)  # range of asin

    x_new = sin(y_new)

    return y_new, x_new  # return in order y, x
end

"""
Reverse `acos`.
"""
function acos_rev(y::Interval, x::Interval)
        y_new = y ∩ Interval(0.0,two_pi.hi)
        x_new = x ∩ cos(y_new)

        return y_new, x_new
end

"""
Reverse `atan`.
"""
function atan_rev(y::Interval, x::Interval)
        y_new = y ∩ Interval(-half_pi.lo,half_pi.hi)
        x_new = x ∩ tan(y_new)

        return y_new, x_new
end
