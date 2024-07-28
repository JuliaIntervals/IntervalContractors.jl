function exp!(X::IntervalBox)
    x, y = X

    y = y ⊓ exp(x)
    x = x ⊓ log(y)

    return IntervalBox(x, y)
end

"""
Reverse function for `exp`.
"""
function exp_rev(y::IntervalType, x::IntervalType)
    y_new = y ⊓ (interval(0, Inf))
    x_new = x ⊓ log(y)
    return y_new, x_new
end

"""
Reverse function for `exp2`.
"""
function exp2_rev(y::IntervalType, x::IntervalType)
    y_new = y ⊓ (interval(0, Inf))
    x_new = x ⊓ log2(y)

    return y_new, x_new
end

"""
Reverse function for `exp10`.
"""
function exp10_rev(y::IntervalType, x::IntervalType)
    y_new = y ⊓ (interval(0, Inf))
    x_new = x ⊓ log10(y)

    return y_new, x_new
end

"""
Reverse function for `expm1`.
"""
function expm1_rev(y::IntervalType, x::IntervalType)
    y_new = y ⊓ (interval(-1, Inf))
    x_new = x ⊓ log1p(y)

    return y_new, x_new
end


function log!(X::IntervalBox)  # y = log(x)
    x, y = X

    x = x ⊓ exp(y)
    y = y ⊓ log(x)

    return IntervalBox(x, y)
end

"""
Reverse function for `log`: ``y = \\log(x)``
"""
function log_rev(y::IntervalType, x::IntervalType)
    x_new = x ⊓ exp(y)

    return y, x_new
end

"""
Reverse function for `log2`: ``y = \\log2(x)``
"""
function log2_rev(y::IntervalType, x::IntervalType)
    x_new = x ⊓ exp2(y)

    return y, x_new
end


"""
Reverse function for `log10`: ``y = \\log10(x)``
"""
function log10_rev(y::IntervalType, x::IntervalType)
    x_new = x ⊓ exp10(y)

    return y, x_new
end

"""
Reverse function for `log1p`: ``y = \\log1p(x)``
"""
function log1p_rev(y::IntervalType, x::IntervalType)
    x_new = x ⊓ expm1(y)

    return y, x_new
end
