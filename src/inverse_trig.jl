function asin!(X::IntervalBox{N,T}) where {N,T}
    x, y = X

    h = inf(_half_pi(T))
    y_new = y ∩ Interval(-h, h)  # range of asin
    x_new = sin(y_new)

    return IntervalBox(x_new, y_new)
end

"""
Reverse `asin`.
"""
function asin_rev(y::Interval{T}, x::Interval{T})  where {T<:Real} # y = asin(x)

    h = inf(_half_pi(T))
    y_new = y ∩ Interval(-h, h)  # range of asin

    x_new = sin(y_new)

    return y_new, x_new  # return in order y, x
end

"""
Reverse `acos`.
"""
function acos_rev(y::Interval{T}, x::Interval{T}) where {T<:Real}
    y_new = y ∩ Interval(0.0, sup(_two_pi(T)))
    x_new = x ∩ cos(y_new)

    return y_new, x_new
end

"""
    atan_rev(y::Interval, x::Interval)

Inverse of `y = atan(x)`.
Returns the new `y` and `x`.
"""
function atan_rev(y::Interval{T}, x::Interval{T}) where {T<:Real}
    h = sup(_half_pi(T))
    y_new = y ∩ Interval(-h, h)
    x_new = x ∩ tan(y_new)

    return y_new, x_new
end
