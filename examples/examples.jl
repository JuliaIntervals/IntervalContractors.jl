

"Example of a more complicated periodic contractor"
function sawtooth(X::IntervalBox)

    x, y = X

    x = x ∩ (-1..1)
    y = y ∩ (-2..2)

    y = y ∩ (2x)
    x = x ∩ (y/2)

    return IntervalBox(x, y)
end


function constant_contractor(X, y_val)
    x, y = X
    y = y ∩ Interval(y_val)
    return IntervalBox(x, y)
end



function add_one(X)  # y = x + 1
    x, y = X

    y = y ∩ (x + 1)
    x = x ∩ (y - 1)

    return IntervalBox(x, y)
end



function cube0(X::IntervalBox)  # contractor for y=x^3, x>=0

    x, y = X

    x = x ∩ (0..∞)

    y = y ∩ (x ^ 3)
    x = x ∩ Interval(y.lo ^ (1/3), y.hi^(1/3))   # not rigorous!

    return x × y
end


"""
Make the "odd" version of a box
odd(X::IntervalBox) = ( (x,y) = X; IntervalBox(-x, -y) )
"""

cube_neg = symmetrise(cube0, odd)
cube = cube0 ∪ cube_neg

ff(x) = x^2 - x^3

function ff(X::IntervalBox)
    x, y = X

    a = x^2
    b = x^3

    y = y ∩ (a - b)  # y = a - b

    a = a ∩ (y + b)
    b = b ∩ (a - y)

    x, a = square(IntervalBox(x, a))
    x, b = cube(IntervalBox(x, b))

    return IntervalBox(x, y)

end
