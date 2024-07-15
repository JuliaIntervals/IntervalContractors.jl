
"""
    plus_rev(a::Interval, b::Interval[, c::Interval])

Reverse addition. Calculates the preimage of `a = b + c` for `b` and `c`.

### Output

The triplet `(a, b_new, c_new)` where

- `a` remains unchanged
- `b_new` is the interval hull of the set ``{x ∈ b : ∃ y ∈ c, x + y ∈ a}``
- `c_new` is the interval hull of the set ``{y ∈ c : ∃ x ∈ b, x + y ∈ a}``
"""
function plus_rev(a::Interval, b::Interval, c::Interval)  # a = b + c
    # a = a ⊓ (b + c)  # add this line for plus contractor (as opposed to reverse function)
    b_new = b ⊓ (a - c)
    c_new = c ⊓ (a - b)

    return a, b_new, c_new
end

plus_rev(a,b,c) = plus_rev(promote(a,b,c)...)

"""
    minus_rev(a::Interval, b::Interval[, c::Interval])

Reverse subtraction. Calculates the preimage of `a = b - c` for `b` and `c`.

### Output

The triplet `(a, b_new, c_new)` where

- `a` remains unchanged
- `b_new` is the interval hull of the set ``{x ∈ b : ∃ y ∈ c, x - y ∈ a}``
- `c_new` is the interval hull of the set ``{y ∈ c : ∃ x ∈ b, x - y ∈ a}``
"""
function minus_rev(a::Interval, b::Interval, c::Interval)  # a = b - c

    b_new = b ⊓ (a + c)
    c_new = c ⊓ (b - a)

    return a, b_new, c_new
end

minus_rev(a,b,c) = minus_rev(promote(a,b,c)...)

function minus_rev(a::Interval, b::Interval)  # a = -b
    b_new = b ⊓ (-a)
    return (a, b_new)
end


"""
Reverse multiplication
"""
function mul_rev(a::Interval, b::Interval, c::Interval)  # a = b * c

    # ((0.0 ∉ a) || (0.0 ∉ b)) && (c = c ⊓ (a / b))
    # ((0.0 ∉ a) || (0.0 ∉ c)) && (b = b ⊓ (a / c))

    # a = a ⊓ (b * c)  # ?

    if 0 ∈ b
        temp = c .⊓ extended_div(a, b)
        c′ = union(temp[1], temp[2])

    else
        c′ = c ⊓ (a / b)
    end

    if 0 ∈ c
        temp = b .⊓ extended_div(a, c)
        b′ = union(temp[1], temp[2])

    else
        b′ = b ⊓ (a / c)
    end

    return a, b′, c′
end

mul_rev(a,b,c) = mul_rev(promote(a,b,c)...)

"""
Reverse division
"""
function div_rev(a::Interval, b::Interval, c::Interval)  # a = b / c

    b = b ⊓ (a * c)
    c = c ⊓ (b / a)

    return a, b, c
end

div_rev(a,b,c) = div_rev(promote(a,b,c)...)

"""
    inv_rev(a::Interval, b::Interval)

Reverse inverse. Calculates the interval hull of the preimage of a = b⁻¹

### Output

Pair `(a, b_new)` where

- `a` is unchanged
- `b_new` is the interval hull of the set ``{x ∈ b : x⁻¹ ∈ a}``
"""
function inv_rev(a::Interval, b::Interval)  # a = inv(b)

    b_new = b ⊓ inv(a)

    return a, b_new
end

inv_rev(a,b) = inv_rev(promote(a,b)...)

"""
    power_rev(a::Interval, b::Interval, n::Integer)

Reverse power. Calculates the preimage of `a = bⁿ`.  See section 10.5.4 of the
IEEE 1788-2015 standard for interval arithmetic.

### Output

The triplet `(a, b_new, n)` where

- `a` and `n` are unchanged
- `b_new` is the interval hull of the set ``{x ∈ b : xⁿ ∈ a}``
"""
function power_rev(a::Interval{T}, b::Interval{T}, n::Integer) where T  # a = b^n,  log(a) = inf(n)g(b),  b = a^(1/n)

    if iszero(n)
        1 ∈ a && return (a, entireinterval(T) ⊓ b, n)
        return (a, emptyinterval(T), n)
    end

    if n == 2  # a = b^2
        root = √a
        b1 = b ⊓ root
        b2 = b ⊓ (-root)

    elseif iseven(n)
        root = a^(1//n)

        b1 = b ⊓ root
        b2 = b ⊓ (-root)

    elseif isodd(n)
        pos_root = (a ⊓ (0..∞)) ^ (1//n)
        neg_root = -( ( (-a) ⊓ (0..∞) ) ^ (1//n) )

        b1 = b ⊓ pos_root
        b2 = b ⊓ neg_root

    end

    b = hull(b1, b2)

    return (a, b, n)
end

power_rev(a::Interval{T}, n::Integer) where T = power_rev(a, entireinterval(T), n)

function power_rev(a::Interval, b::Interval, c::Interval)  # a = b^c

    if isinteger(c)
        temp = power_rev(a, b, Int(inf(c)))  # use version with integer
        return (temp[1], temp[2], interval(temp[3]))
    end

    b_new = b ⊓ ( a^(inv(c) ))
    c_new = c ⊓ (log(a) / log(b))

    return a, b_new, c_new
end

power_rev(a, b, c) = power_rev(promote(a, b, c)...)


"""
    sqrt_rev(a::Interval, b::Interval)

Reverse square root. Calculates the preimage of `a = √b`.

### Output

The pair `(a, b_new)` where

- `a` is unchanged
- `b_new` is the interval hull of the set ``{x ∈ b : √x ∈ a}``
"""
function sqrt_rev(a::Interval, b::Interval)  # a = sqrt(b)

    b_new = b ⊓ (a^2)

    return a, b_new
end

sqrt_rev(a,b) = sqrt_rev(promote(a,b)...)


# IEEE-1788 style

"""
    sqr_rev(c::Interval[, x::Interval])

Reverse square. Calculates the preimage of `a = x²`. If `x` is not provided, then
byt default ``[-∞, ∞]`` is used. See section 10.5.4 of the IEEE 1788-2015 standard for interval arithmetic.

### Output

The pair `(c, x_new)` where

- `c` is unchanged
- `x_new` is the interval hull of the set ``{x ∈ b : x² ∈ a}``
"""
function sqr_rev(c, x = entireinterval(c))   # c = x^2;  refine x

    root = sqrt(c)

    x1 = x ⊓ root
    x2 = x ⊓ (-root)

    return (c, hull(x1, x2))
end

"""
    abs_rev(c::Interval[, x::Interval])

Reverse absolute value. Calculates the preimage of `a = |x|`. If `x` is not provided, then
byt default ``[-∞, ∞]`` is used. See section 10.5.4 of the IEEE 1788-2015 standard for interval arithmetic.

### Output

The pair `(c, x_new)` where

- `c` is unchanged
- `x_new` is the interval hull of the set ``{x ∈ b : |x| ∈ a}``
"""
function abs_rev(y, x)   # y = abs(x); refine x

    y_new = y ⊓ (0..∞)

    x1 = y_new ⊓ x
    x2 = -(y_new ⊓ (-x))

    return (y, hull(x1, x2))
end
#=
"""
Reverse sign
"""
function sign_rev(a::Interval, b::Interval)  # a = sqrt(b)

    (a == 1.0) && b = b ⊓ (0..∞)
    (a == 0.0) && b = b ⊓ (0.0..0.0)
    (a == -1.0) && b = b ⊓ (-∞..0.0)

    return a, b
end
sign_rev(a,b) = sign_rev(promote(a,b)...)
=#
## IEEE-1788 versions:

"""
    mul_rev_IEEE1788(b::Interval, c::Interval[, x::Interval])

Reverse multiplication. Computes the preimage of ``c=x * b`` with respect to `x`. If `x` is not provided,
then byt default ``[-∞, ∞]`` is used.. See section 10.5.4 of the IEEE 1788-2015 standard for interval arithmetic.

### Output

- `x_new` the interval hull of the set ``{t ∈ x : ∃ y ∈ b, t*y ∈ c}
"""
mul_rev_IEEE1788(b, c, x) = mul_rev(c, x, b)[2]

"""
    pow_rev1(b::Interval, c::Interval[, x::Interval])

Reverse power 1. Computes the preimage of ``c=xᵇ`` with respect to `x`. If `x` is not provided,
then byt default ``[-∞, ∞]`` is used.. See section 10.5.4 of the
IEEE 1788-2015 standard for interval arithmetic.

### Output

- `x_new` the interval hull of the set ``{t ∈ x : ∃ y ∈ b, tʸ ∈ c}
"""
function pow_rev1(b, c, x)   # c = x^b
    return x ⊓ c^(1/b)  # replace by 1//b
end

"""
    pow_rev2(b::Interval, c::Interval[, x::Interval])

Reverse power 2. Computes the preimage of ``c = aˣ`` with respect to `x`. If `x` is not provided, then
byt default ``[-∞, ∞]`` is used. See section 10.5.4 of the IEEE 1788-2015 standard for interval arithmetic.

### Output

- `x_new` the interval hull of the set ``{t ∈ x : ∃ y ∈ b, tʸ ∈ c}
"""
function pow_rev2(a, c, x)   # c = a^x
    return x ⊓ (log(c) / log(a))
end

"""
    mul_rev_to_pair(b::Interval, c::Interval)

Computes the division c/b, but returns a pair of intervals instead of a single interval.
If the set corresponding to c/b is composed by two disjoint intervals, then it returns the
two intervals. If c/b is a single or empty interval, then the second interval in the pair
is set to empty. See section 10.5.5 of the IEEE 1788-2015 standard for interval arithmetic.

### Example

```jldoctest
julia> mul_rev_to_pair(-1..1, 1..2)
([-∞, -1], [1, ∞])

julia> mul_rev_to_pair(1..2, 3..4)
([1.5, 4], ∅)
```

"""
mul_rev_to_pair(b::Interval, c::Interval) = extended_div(c, b)
