"""
Reverse max
"""
function max_rev(a::IntervalType, b::IntervalType, c::IntervalType)  # a = max(b,c)

    B_lo = inf(b);  B_hi = sup(b);
    C_lo = inf(c);  C_hi = sup(c);

    (inf(b) > sup(c)) && (B_lo = max(inf(b),inf(a)))
    (inf(b) < inf(c)) && (C_lo = max(inf(c),inf(a)))
    (sup(b) > sup(c)) && (B_hi = min(sup(b),sup(a)))
    (sup(b) < sup(c)) && (C_hi = min(sup(c),sup(a)))

    if isempty_interval(b)
        isempty_interval(c) && (return a, emptyinterval(), emptyinterval())
        return a, emptyinterval(), interval(C_lo,C_hi)
    else
        isempty_interval(c) && (return a, interval(B_lo,B_hi), emptyinterval())
        return a, interval(B_lo,B_hi), interval(C_lo,C_hi)
    end
end
max_rev(a,b,c) = max_rev(promote(a,b,c)...)

"""
Reverse min
"""
function min_rev(a::IntervalType, b::IntervalType, c::IntervalType)

    B_lo = inf(b);  B_hi = sup(b);
    C_lo = inf(c);  C_hi = sup(c);

    (inf(b) > inf(c)) && (B_lo = max(inf(c),inf(a)))
    (inf(b) < inf(c)) && (C_lo = max(inf(b),inf(a)))
    (sup(b) > sup(c)) && (B_hi = min(sup(c),sup(a)))
    (sup(b) < sup(c)) && (C_hi = min(sup(b),sup(a)))

    if isempty_interval(b)
        isempty_interval(c) && (return a, emptyinterval(), emptyinterval())
        return a, emptyinterval(), interval(C_lo,C_hi)
    else
        isempty_interval(c) && (return a, interval(B_lo,B_hi), emptyinterval())
        return a, interval(B_lo,B_hi), interval(C_lo,C_hi)
    end
end

min_rev(a,b,c) = min_rev(promote(a,b,c)...)
