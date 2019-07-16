
"""
Reverse plus
"""
function plus_rev(a::Interval, b::Interval, c::Interval)  # a = b + c
    # a = a ∩ (b + c)  # add this line for plus contractor (as opposed to reverse function)
    b_new = b ∩ (a - c)
    c_new = c ∩ (a - b)

    return a, b_new, c_new
end

plus_rev(a,b,c) = plus_rev(promote(a,b,c)...)

"""
Reverse minus
"""
function minus_rev(a::Interval, b::Interval, c::Interval)  # a = b - c

    b_new = b ∩ (a + c)
    c_new = c ∩ (b - a)

    return a, b_new, c_new
end

minus_rev(a,b,c) = minus_rev(promote(a,b,c)...)

function minus_rev(a::Interval, b::Interval)  # a = -b
    b_new = b ∩ (-a)
    return (a, b_new)
end


"""
Reverse multiplication
"""
function mul_rev(a::Interval, b::Interval, c::Interval)  # a = b * c

    # ((0.0 ∉ a) || (0.0 ∉ b)) && (c = c ∩ (a / b))
    # ((0.0 ∉ a) || (0.0 ∉ c)) && (b = b ∩ (a / c))

    # a = a ∩ (b * c)  # ?

    if 0 ∈ b
        temp = c .∩ extended_div(a, b)
        c′ = union(temp[1], temp[2])

    else
        c′ = c ∩ (a / b)
    end

    if 0 ∈ c
        temp = b .∩ extended_div(a, c)
        b′ = union(temp[1], temp[2])

    else
        b′ = b ∩ (a / c)
    end

    return a, b′, c′
end

mul_rev(a,b,c) = mul_rev(promote(a,b,c)...)

"""
Reverse division
"""
function div_rev(a::Interval, b::Interval, c::Interval)  # a = b / c

    b = b ∩ (a * c)
    c = c ∩ (b / a)

    return a, b, c
end

div_rev(a,b,c) = div_rev(promote(a,b,c)...)

"""
Reverse inverse
"""
function inv_rev(a::Interval, b::Interval)  # a = inv(b)

    b_new = b ∩ inv(a)

    return a, b_new
end

inv_rev(a,b) = inv_rev(promote(a,b)...)

"""
Reverse power
"""
function power_rev(a::Interval, b::Interval, n::Integer)  # a = b^n,  log(a) = n.log(b),  b = a^(1/n)

    if n == 2  # a = b^2
        root = √a
        b1 = b ∩ root
        b2 = b ∩ (-root)

    elseif iseven(n)
        root = a^(1//n)

        b1 = b ∩ root
        b2 = b ∩ (-root)

    elseif isodd(n)
        pos_root = (a ∩ (0..∞)) ^ (1//n)
        neg_root = -( ( (-a) ∩ (0..∞) ) ^ (1//n) )

        b1 = b ∩ pos_root
        b2 = b ∩ neg_root

    end

    b = hull(b1, b2)

    return (a, b, n)
end


function power_rev(a::Interval, b::Interval, c::Interval)  # a = b^c

    b_new = b ∩ ( a^(inv(c) ))
    c_new = c ∩ (log(a) / log(b))

    return a, b_new, c_new
end

power_rev(a, b, c) = power_rev(promote(a, b, c)...)


"""
Reverse square root
"""
function sqrt_rev(a::Interval, b::Interval)  # a = sqrt(b)

    b_new = b ∩ (a^2)

    return a, b_new
end

sqrt_rev(a,b) = sqrt_rev(promote(a,b)...)


# IEEE-1788 style

"""
Reverse sqr
"""
function sqr_rev(c, x)   # c = x^2;  refine x

    root = sqrt(c)

    x1 = x ∩ root
    x2 = x ∩ (-root)

    return (c, hull(x1, x2))
end

sqr_rev(c) = sqr_rev(c, -∞..∞)

"""
Reverse abs
"""
function abs_rev(y, x)   # y = abs(x); refine x

    y_new = y ∩ (0..∞)

    x1 = y_new ∩ x
    x2 = -(y_new ∩ (-x))

    return (y, hull(x1, x2))
end
#=
"""
Reverse sign
"""
function sign_rev(a::Interval, b::Interval)  # a = sqrt(b)

    (a == 1.0) && b = b ∩ (0..∞)
    (a == 0.0) && b = b ∩ (0.0..0.0)
    (a == -1.0) && b = b ∩ (-∞..0.0)

    return a, b
end
sign_rev(a,b) = sign_rev(promote(a,b)...)
=#
## IEEE-1788 versions:

"""
According to the IEEE-1788 standard:

- `∘_rev1(b, c, x)` is the subset of `x` such that `x ∘ b` is defined and in `c`;
- `∘_rev2(a, c, x)` is the subset of `x` such that `a ∘ x` is defined and in `c`

When `∘` is commutative, these agree and we write `∘_rev(b, c, x)`.
"""

function mul_rev_IEEE1788(b, c, x)   # c = b*x
    return x ∩ (c / b)
end

function pow_rev1(b, c, x)   # c = x^b
    return x ∩ c^(1/b)  # replace by 1//b
end

function pow_rev2(a, c, x)   # c = a^x
    return x ∩ (log(c) / lob(a))
end
