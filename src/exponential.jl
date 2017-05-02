function exp!(X::IntervalBox)
    x, y = X

    y = y ∩ exp(x)
    x = x ∩ log(y)

    return IntervalBox(x, y)
end

doc"""
Reverse function for `exp`.
"""
function exp_rev(y::Interval, x::Interval)
    y_new = y ∩ (0..∞)
    x_new = x ∩ log(y_new)

    return y, x
end

function log!(X::IntervalBox)  # y = log(x)
    x, y = X

    x = x ∩ exp(y)
    y = y ∩ log(x)

    return IntervalBox(x, y)
end

doc"""
Reverse function for `log`: $y = \log(x)$
"""
function log_rev(y::Interval, x::Interval)
    x_new = x ∩ exp(y)

    return y, x_new
end
