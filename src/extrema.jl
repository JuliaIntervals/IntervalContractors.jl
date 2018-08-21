"""
Reverse max
"""
function max_rev(a::Interval, b::Interval, c::Interval)  # a = max(b,c)

    B_lo = b.lo;  B_hi = b.hi;
    C_lo = c.lo;  C_hi = c.hi;

    (b.lo > c.lo) && (B_lo = max(b.lo,a.lo))
    (b.lo < c.lo) && (C_lo = max(c.lo,a.lo))
    (b.hi > c.hi) && (B_hi = min(b.hi,a.hi))
    (b.hi < c.hi) && (C_hi = min(c.hi,a.hi))

    if isempty(b)
        isempty(c) && (return a, ∅, ∅)
        return a, ∅, Interval(C_lo,C_hi)
    else
        isempty(c) && (return a, Interval(B_lo,B_hi), ∅)
        return a, Interval(B_lo,B_hi), Interval(C_lo,C_hi)
    end
end
max_rev(a,b,c) = max_rev(promote(a,b,c)...)

"""
Reverse min
"""
function min_rev(a::Interval, b::Interval, c::Interval)

    B_lo = b.lo;  B_hi = b.hi;
    C_lo = c.lo;  C_hi = c.hi;

    (b.lo > c.lo) && (B_lo = max(c.lo,a.lo))
    (b.lo < c.lo) && (C_lo = max(b.lo,a.lo))
    (b.hi > c.hi) && (B_hi = min(c.hi,a.hi))
    (b.hi < c.hi) && (C_hi = min(b.hi,a.hi))

    if isempty(b)
        isempty(c) && (return a, ∅, ∅)
        return a, ∅, Interval(C_lo,C_hi)
    else
        isempty(c) && (return a, Interval(B_lo,B_hi), ∅)
        return a, Interval(B_lo,B_hi), Interval(C_lo,C_hi)
    end
end

min_rev(a,b,c) = min_rev(promote(a,b,c)...)
