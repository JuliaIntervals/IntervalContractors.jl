
"""
    integer_contractor(x::IntervalType)

Return the integers enclosed in the interval `x`.
"""

function integer_contractor(x::IntervalType)
    a = floor(inf(x)) + 1
    b = floor(sup(x))

    a > b && return emptyinterval(x)

    return _build_interval(x, a, b)
end


### Transformations on IntervalBoxes

"""Reflect in mirror at position x_mirror
x_mirror is a function that returns an interval giving the position of the mirror."""
function reflect_x(x_mirror)
    X -> begin
        x, y = X
        x = (exact(2) * x_mirror(x)) - x

        return IntervalBox(x, y)
    end
end


"""
    translate(α)

Returns a function that shifts (translates) a 2D `IntervalBox` in `x` (the first coordinate).
"""
function translate(α)
    X -> begin
        x, y = X
        return IntervalBox(x - α, y)
    end
end

odd(X::IntervalBox) = ( (x,y) = X; IntervalBox(-x, -y) )



## Transformations on Contractors

"""
Translation of a Contractor `C` by `α`.
Uses `inv(op) ∘ C ∘ op`
"""
translate(C, α) = translate(-α) ∘ C ∘ translate(α)


"""
Symmetric part of a Contractor, via an involution `op`
(i.e. such that `inv(op) == op`).
"""
symmetrise(C, op) = op ∘ C ∘ op




"Periodize the contractor C. period is a function that returns an interval giving the period"
function periodise(C, period)

    X -> begin
        x, y = X

        x2 = entireinterval(x)
        x2, y = C(IntervalBox(x2, y))

        isempty(IntervalBox(x2, y)) && return(IntervalBox(emptyinterval(x), emptyinterval(x)))

        # periods where the periodization of x intersects with x2:
        periods = integer_contractor((x - x2) / period(x))

        isempty_interval(periods) && return(IntervalBox(emptyinterval(x), emptyinterval(x)))

        x3 = x2 + periods * period(x)
        x = x ⊓ x3

        return IntervalBox(x, y)
    end

end
