"""
Reverse function for `sinh`.
"""
function sinh_rev(y::Interval, x::Interval)
    x = x ∩ asinh(y)

    return y, x
end

"""
Reverse function for `cosh`.
"""
function cosh_rev(y::Interval,x::Interval)
    y_new = y ∩ Interval(1.,∞)
    x = x ∩ acosh(y)

    return y_new, x
end

"""
Reverse function for `tanh`.
"""
function tanh_rev(y::Interval,x::Interval)
    y_new = y ∩ Interval(-1.,1.)
    x = x ∩ atanh(y)

    return y_new, x
end
