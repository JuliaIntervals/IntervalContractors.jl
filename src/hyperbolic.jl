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
cosh_main(y::Interval,x::Interval) = x ∩ acosh(y)

function cosh_rev(x::Interval, y::Interval)
    y1 = y ∩ Interval(-Inf,1)
    y2 = y ∩ Interval(1,Inf)

    x_new = x ∩ Interval(1.,∞)
    
    z = -cosh_main(x,-y1) ∪ cosh_main(x,y2)
    return x_new, z
end

cosh_rev(x) = cosh_rev(x, -Inf..Inf) 

"""
Reverse function for `tanh`.
"""
function tanh_rev(y::Interval,x::Interval)
    y_new = y ∩ Interval(-1.,1.)
    x = x ∩ atanh(y)

    return y_new, x
end
