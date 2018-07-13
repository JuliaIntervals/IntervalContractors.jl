function asinh!(X::IntervalBox)
    x, y = X

    x = x ∩ sinh(y)

    return IntervalBox(x, y)
end

doc"""
Reverse function for `asinh`.
"""
function asinh_rev(y::Interval,x::Interval)
    x = x ∩ sinh(y)

    return y, x
end

function acosh!(X::IntervalBox)
    x, y = X

    y_new = y ∩ Interval(0.0,∞)
    x = x ∩ cosh(y)

    return IntervalBox(x, y_new)
end

doc"""
Reverse function for `acosh`.
"""
function acosh_rev(y::Interval,x::Interval)
    y_new = y ∩ Interval(0.0,∞)
    x = x ∩ cosh(y)

    return y_new, x
end

function atanh!(X::IntervalBox)
    x, y = X

    x = x ∩ tanh(y)

    return IntervalBox(x, y)
end

doc"""
Reverse function for `atanh`.
"""
function atanh_rev(y::Interval,x::Interval)
    x = x ∩ tanh(y)

    return y, x
end
