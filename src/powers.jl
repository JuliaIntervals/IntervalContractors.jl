
function constant_contractor(X, y_val)
    x, y = X
    y = y ∩ Interval(y_val)
    return IntervalBox(x, y)
end


"Contractor for y = x^2, x >= 0"
function square0(X::IntervalBox)

    x, y = X

    x = x ∩ (0..∞)

    y = y ∩ (x^2)
    x = x ∩ √y

    return IntervalBox(x, y)
end

square_neg = symmetrise(square0, reflect_x(0.0))
square = square_neg ∪ square0



function cube0(X::IntervalBox)  # contractor for y=x^3, x>=0

    x, y = X

    x = x ∩ (0..∞)

    y = y ∩ (x ^ 3)
    x = x ∩ Interval(y.lo ^ (1/3), y.hi^(1/3))   # not rigorous!

    return x × y
end


odd(X::IntervalBox) = ( (x,y) = X; IntervalBox(-x, -y) )

cube_neg = symmetrise(cube0, odd)
cube = cube0 ∪ cube_neg
