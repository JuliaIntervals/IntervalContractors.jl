function sinh!(X::IntervalBox)
    x, y = X

    x = x ∩ asinh(y)

    return IntervalBox(x, y)
end

doc"""
Reverse function for `sinh`.
"""
function sinh_rev(y::Interval, x::Interval)
    x = x ∩ asinh(y)

    return y, x
end

function cosh!(X::IntervalBox)
    x, y = X

    y_new = y ∩ Interval(1.,∞)
    x = x ∩ acosh(y)

    return IntervalBox(x, y_new)
end

doc"""
Reverse function for `cosh`.
"""
function cosh_rev(y::Interval,x::Interval)
    y_new = y ∩ Interval(1.,∞)
    x = x ∩ acosh(y)

    return y_new, x
end

function tanh!(X::IntervalBox)
    x, y = X

    y_new = y ∩ Interval(-1.,1.)
    x = x ∩ atanh(y)

    return IntervalBox(x, y_new)
end

doc"""
Reverse function for `tanh`.
"""
function tanh_rev(y::Interval,x::Interval)
    y_new = y ∩ Interval(-1.,1.)
    x = x ∩ atanh(y)

    return y_new, x
end
