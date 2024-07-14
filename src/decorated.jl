entiredecorated(T) = Decoratedinterval(entireinterval(T))

for op in (:sqr_rev, :abs_rev, :sin_rev, :cos_rev, :tan_rev, :cosh_rev, :sinh_rev, :tanh_rev)
    @eval begin 
        function $op(a::DecoratedInterval{T}, x::DecoratedInterval{T}) where T 
            ( isnai(a) || isnai(x) ) && return nai(T)
            bare = $op(interval(a), interval(x))
            return (Decoratedinterval(bare[1], trv), Decoratedinterval(bare[2], trv))
        end
    end 
    @eval $op(a::Interval{T}) where T = $op(a, entireinterval(T))
    @eval $op(a::DecoratedInterval{T}) where T = $op(a, entiredecorated(T)) 
end

function power_rev(a::DecoratedInterval{T}, x::DecoratedInterval{T}, n::Integer) where T
    ( isnai(a) || isnai(x) ) && return nai(T)
    bare = power_rev(interval(a), interval(x), n)
    return (Decoratedinterval(bare[1], trv), Decoratedinterval(bare[2], trv), n)
end

power_rev(a::DecoratedInterval{T}, n::Integer) where T = power_rev(a, entiredecorated(T), n)

for op in (:mul_rev_IEEE1788, :pow_rev1, :pow_rev2)
    @eval begin
        function $op(b::DecoratedInterval{T}, c::DecoratedInterval{T}, x::DecoratedInterval{T}) where T
            (isnai(b) || isnai(c) || isnai(x) ) && return nai(T)
            bare = $op(interval(b), interval(c), interval(x))
            return Decoratedinterval(bare, trv)
        end
    end

    @eval $op(a::Interval{T}, b::Interval{T}) where T = $op(a, b, entireinterval(T))
    @eval $op(a::DecoratedInterval{T}, b::DecoratedInterval{T}) where T = $op(a, b, entiredecorated(T))

end