single_input_functions =(
    :sqr_rev , :abs_rev, :sin_rev)

for f in single_input_functions
    @eval function $(f)(xx::DecoratedInterval{T}) where T
        x = interval_part(xx)
        r = $f(x)[2]
        d = min(decoration(r), decoration(xx), trv)
        DecoratedInterval(r, d)
    end
end

two_input_functions =(
    :sqr_rev, :abs_rev, :sin_rev)

for f in two_input_functions
    @eval function $(f)(xx::DecoratedInterval, yy::DecoratedInterval)
        x = interval_part(xx)
        y = interval_part(yy)
        r = $f(x,y)[2]
        d = min(decoration(x), decoration(y), decoration(r), trv)
        DecoratedInterval(r, d)
    end
end
