_safe_interval(x, lo, hi) = lo > hi ? emptyinterval(x) : _build_interval(x, lo, hi)

"""
Reverse max
"""
function max_rev(a::IntervalType, b::IntervalType, c::IntervalType)  # a = max(b,c)

    (isempty_interval(a) || isempty_interval(b) || isempty_interval(c)) &&
        return a, emptyinterval(b), emptyinterval(c)

    B_lo = inf(b);  B_hi = sup(b)
    C_lo = inf(c);  C_hi = sup(c)

    (inf(b) > sup(c)) && (B_lo = max(inf(b), inf(a)))
    (inf(b) < inf(c)) && (C_lo = max(inf(c), inf(a)))
    (sup(b) > sup(c)) && (B_hi = min(sup(b), sup(a)))
    (sup(b) < sup(c)) && (C_hi = min(sup(c), sup(a)))

    return a, _safe_interval(b, B_lo, B_hi), _safe_interval(c, C_lo, C_hi)
end
max_rev(a,b,c) = max_rev(promote(a,b,c)...)

"""
Reverse min
"""
function min_rev(a::IntervalType, b::IntervalType, c::IntervalType)

    (isempty_interval(a) || isempty_interval(b) || isempty_interval(c)) &&
        return a, emptyinterval(b), emptyinterval(c)

    B_lo = inf(b);  B_hi = sup(b)
    C_lo = inf(c);  C_hi = sup(c)

    (inf(b) > inf(c)) && (B_lo = max(inf(c), inf(a)))
    (inf(b) < inf(c)) && (C_lo = max(inf(b), inf(a)))
    (sup(b) > sup(c)) && (B_hi = min(sup(c), sup(a)))
    (sup(b) < sup(c)) && (C_hi = min(sup(b), sup(a)))

    return a, _safe_interval(b, B_lo, B_hi), _safe_interval(c, C_lo, C_hi)
end

min_rev(a,b,c) = min_rev(promote(a,b,c)...)
