"""
Reverse function for `asinh`.
"""
function asinh_rev(y::Interval, x::Interval = entireinterval(y))
    x = x ⊓ sinh(y)

    return y, x
end

"""
Reverse function for `acosh`.
"""
function acosh_rev(y::Interval, x::Interval = entireinterval(y))
    y_new = y ⊓ interval(0.0,Inf)
    x = x ⊓ cosh(y)

    return y_new, x
end

"""
Reverse function for `atanh`.
"""
function atanh_rev(y::Interval, x::Interval = entireinterval(y))
    x = x ⊓ tanh(y)

    return y, x
end
