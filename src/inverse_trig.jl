
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
