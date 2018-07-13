function exp!(X::IntervalBox)
    x, y = X

    y = y ∩ exp(x)
    x = x ∩ log(y)

    return IntervalBox(x, y)
end

function exp2!(X::IntervalBox)
    x, y = X

    y = y ∩ exp2(x)
    x = x ∩ log2(y)

    return IntervalBox(x, y)
end


function exp10!(X::IntervalBox)
    x, y = X

    y = y ∩ exp10(x)
    x = x ∩ log10(y)

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

doc"""
Reverse function for `exp2`.
"""
function exp2_rev(y::Interval, x::Interval)
    y_new = y ∩ (0..∞)
    x_new = x ∩ log2(y_new)

    return y, x
end

doc"""
Reverse function for `exp10`.
"""
function exp10_rev(y::Interval, x::Interval)
    y_new = y ∩ (0..∞)
    x_new = x ∩ log10(y_new)

    return y, x
end

function log!(X::IntervalBox)  # y = log(x)
    x, y = X

    x = x ∩ exp(y)
    y = y ∩ log(x)

    return IntervalBox(x, y)
end

function log2!(X::IntervalBox)  # y = log2(x)
    x, y = X

    x = x ∩ exp2(y)
    y = y ∩ log2(x)

    return IntervalBox(x, y)
end

function log10!(X::IntervalBox)  # y = log10(x)
    x, y = X

    x = x ∩ exp10(y)
    y = y ∩ log10(x)

    return IntervalBox(x, y)
end

doc"""
Reverse function for `log`: $y = \log(x)$
"""
function log_rev(y::Interval, x::Interval)
    x_new = x ∩ exp(y)

    return y, x_new
end

doc"""
Reverse function for `log2`: $y = \log2(x)$
"""
function log2_rev(y::Interval, x::Interval)
    x_new = x ∩ exp2(y)

    return y, x_new
end


doc"""
Reverse function for `log10`: $y = \log10(x)$
"""
function log10_rev(y::Interval, x::Interval)
    x_new = x ∩ exp10(y)

    return y, x_new
end
