"""
Reverse function for `asinh`.
"""
function asinh_rev(y::Interval,x::Interval)
    x = x ∩ sinh(y)

    return y, x
end

"""
Reverse function for `acosh`.
"""
function acosh_rev(y::Interval,x::Interval)
    y_new = y ∩ Interval(0.0,∞)
    x = x ∩ cosh(y)

    return y_new, x
end

"""
Reverse function for `atanh`.
"""
function atanh_rev(y::Interval,x::Interval)
    x = x ∩ tanh(y)

    return y, x
end
