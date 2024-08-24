function asin!(X::IntervalBox)
    x, y = X

    h = inf(half_pi(y))
    y_new = y ⊓ interval(-h, h)  # range of asin
    x_new = sin(y_new)

    return IntervalBox(x_new, y_new)
end

"""
Reverse `asin`.
"""
function asin_rev(y::IntervalType, x::IntervalType = entireinterval(y))  # y = asin(x)
    h = inf(half_pi(y))
    y_new = y ⊓ interval(-h, h)  # range of asin

    x_new = sin(y_new)

    return y_new, x_new  # return in order y, x
end

"""
Reverse `acos`.
"""
function acos_rev(y::IntervalType, x::IntervalType = entireinterval(y))
    y_new = y ⊓ interval(0.0, sup(two_pi(y)))
    x_new = x ⊓ cos(y_new)

    return y_new, x_new
end

"""
    atan_rev(y::IntervalType, x::IntervalType)

Inverse of `y = atan(x)`.
Returns the new `y` and `x`.
"""
function atan_rev(y::IntervalType, x::IntervalType = entireinterval(y))
    h = sup(half_pi(y))
    y_new = y ⊓ interval(-h, h)
    x_new = x ⊓ tan(y_new)

    return y_new, x_new
end
