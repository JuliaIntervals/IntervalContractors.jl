
"""
    integer_contractor(x::Interval)

Return the integers enclosed in the interval `x`.
"""

function integer_contractor(x::Interval)
    a = floor(x.lo)+1
    b = floor(x.hi)

    a > b && return emptyinterval(x)

    return Interval(a, b)
end


### Transformations on IntervalBoxes

"""Reflect in mirror at position x_mirror"""
function reflect_x(x_mirror)
    X -> begin
        x, y = X
        x = 2*x_mirror - x

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




"Periodize the contractor C"
function periodise(C, period)

    X -> begin
        x, y = X

        x2 = -∞..∞
        x2, y = C(IntervalBox(x2, y))

        isempty(IntervalBox(x2, y)) && return(IntervalBox(∅, ∅))

        # periods where the periodization of x intersects with x2:
        periods = integer_contractor((x - x2) / period)

        isempty(periods) && return(IntervalBox(∅, ∅))

        x3 = x2 + periods*period
        x = x ∩ x3

        return IntervalBox(x, y)
    end

end
