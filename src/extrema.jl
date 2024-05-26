"""
Reverse max
"""
function max_rev(a::Interval, b::Interval, c::Interval)  # a = max(b,c)

    B_lo = inf(b);  B_hi = sup(b);
    C_lo = inf(c);  C_hi = sup(c);

    (inf(b) > sup(c)) && (B_lo = max(inf(b),inf(a)))
    (inf(b) < inf(c)) && (C_lo = max(inf(c),inf(a)))
    (sup(b) > sup(c)) && (B_hi = min(sup(b),sup(a)))
    (sup(b) < sup(c)) && (C_hi = min(sup(c),sup(a)))

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

    B_lo = inf(b);  B_hi = sup(b);
    C_lo = inf(c);  C_hi = sup(c);

    (inf(b) > inf(c)) && (B_lo = max(inf(c),inf(a)))
    (inf(b) < inf(c)) && (C_lo = max(inf(b),inf(a)))
    (sup(b) > sup(c)) && (B_hi = min(sup(c),sup(a)))
    (sup(b) < sup(c)) && (C_hi = min(sup(b),sup(a)))

    if isempty(b)
        isempty(c) && (return a, ∅, ∅)
        return a, ∅, Interval(C_lo,C_hi)
    else
        isempty(c) && (return a, Interval(B_lo,B_hi), ∅)
        return a, Interval(B_lo,B_hi), Interval(C_lo,C_hi)
    end
end

min_rev(a,b,c) = min_rev(promote(a,b,c)...)
