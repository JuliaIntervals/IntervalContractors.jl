
"""
Reverse plus
"""
function plus_rev(a::Interval, b::Interval, c::Interval)  # a = b + c
    # a = a ∩ (b + c)  # add this line for plus contractor (as opposed to reverse function)
    b = b ∩ (a - c)
    c = c ∩ (a - b)

    return a, b, c
end

plus_rev(a,b,c) = plus_rev(promote(a,b,c)...)

"""
Reverse minus
"""
function minus_rev(a::Interval, b::Interval, c::Interval)  # a = b - c

    b = b ∩ (a + c)
    c = c ∩ (b - a)

    return a, b, c
end

minus_rev(a,b,c) = minus_rev(promote(a,b,c)...)

minus_rev(a::Interval, b::Interval) = (b = -a; return (a, b))     # a = -b


"""
Reverse multiplication
"""
function mul_rev(a::Interval, b::Interval, c::Interval)  # a = b * c

    b = b ∩ (a / c)
    c = c ∩ (a / b)

    return a, b, c
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
Reverse power
"""
function power_rev(a::Interval, b::Interval, c::Integer)  # a = b^c,  log(a) = c.log(b),  b = a^(1/c)

    if c == 2  # a = b^2
        b1 = b ∩ √a
        b2 = b ∩ (-√a)

        b = hull(b1, b2)

    elseif iseven(c)
        b1 = b ∩ ( a^(inv(c) ))
        b2 = b ∩ ( -( a^(inv(c)) ) )

        b = hull(b1, b2)

    elseif isodd(c)
        b1 = b ∩ ( (a ∩ (0..∞)) ^(inv(c) ))   # positive part
        b2 = b ∩ (- ( (-(a ∩ (-∞..0)))^(inv(c)) ) )  # negative part

        b = hull(b1, b2)
    end

    return (a, b, c)
end


function power_rev(a::Interval, b::Interval, c::Interval)  # a = b^c

    b = b ∩ ( a^(inv(c) ))
    c = c ∩ (log(a) / log(b))

    return a, b, c
end

power_rev(a, b, c) = power_rev(promote(a, b, c)...)


"""
Reverse square root
"""
function sqrt_rev(a::Interval, b::Interval)  # a = sqrt(b)

    b = b ∩ (a^2)

    return a, b
end

sqrt_rev(a,b) = sqrt_rev(promote(a,b)...)


# IEEE-1788 style

"""
Reverse sqr
"""
function sqr_rev(c, x)   # c = x^2;  refine x
    x1 = sqrt(c) ∩ x
    x2 = -(sqrt(c)) ∩ x

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


## IEEE-1788 versions:

"""
According to the IEEE-1788 standard:

- `∘_rev1(b, c, x)` is the subset of `x` such that `x ∘ b` is defined and in `c`;
- `∘_rev2(a, c, x)` is the subset of `x` such that `a ∘ x` is defined and in `c`

When `∘` is commutative, these agree and we write `∘_rev(b, c, x)`.
"""

function mul_rev_IEEE1788(b, c, x)   # c = b*x
    if b == c == (0..0)
        return x
    end
    return x ∩ (c / b)
end

function pow_rev1(b, c, x)   # c = x^b
    return x ∩ c^(1/b)
end

function pow_rev2(a, c, x)   # c = a^x
    return x ∩ (log(c) / lob(a))
end
