"""
Reverse Functions
Decorated interval extension; the result is decorated as `trv`,
following the IEEE-1788 Standard (see Sect. 11.7.1, pp 47).
""" 
reverse_functions =(
    :sqr_rev , :abs_rev, :sin_rev, :cos_rev, :tan_rev, :cosh_rev)

for f in reverse_functions
    @eval function $(f)(xx::DecoratedInterval{T}) where T
        x = interval_part(xx)
        r = $f(x)[2]
        d = min(decoration(r), decoration(xx), trv)
        DecoratedInterval(r, d)
    end
end


for f in reverse_functions
    @eval function $(f)(xx::DecoratedInterval, yy::DecoratedInterval)
        x = interval_part(xx)
        y = interval_part(yy)
        r = $f(x,y)[2]
        d = min(decoration(x), decoration(y), decoration(r), trv)
        DecoratedInterval(r, d)
    end
end

function mul_rev_IEEE1788(xx::DecoratedInterval, yy::DecoratedInterval)
    x = interval_part(xx)
    y = interval_part(yy)
    r = mul_rev_IEEE1788(x, y)
    d = min(decoration(x), decoration(y), decoration(r), trv)
    DecoratedInterval(r, d)
end


function mul_rev_IEEE1788(xx::DecoratedInterval, yy::DecoratedInterval, zz::DecoratedInterval)
    x = interval_part(xx)
    y = interval_part(yy)
    z = interval_part(zz)
    r = mul_rev_IEEE1788(x, y, z)
    d = min(decoration(x), decoration(y), decoration(z), decoration(r), trv)
    DecoratedInterval(r, d)
end
