
function constant_contractor(X, y_val)
    x, y = X
    y = y ∩ Interval(y_val)
    return IntervalBox(x, y)
end


"Contractor for y = x^2, x >= 0"
function square_pos(X::IntervalBox)

    x, y = X

    x = x ∩ (0..∞)

    y = y ∩ (x^2)
    x = x ∩ √y

    return IntervalBox(x, y)
end

square_neg = symmetrise(square_pos, reflect_x(0.0))
square!(X::IntervalBox) = square_pos(X) ∪ square_neg(X)


function cube_pos(X::IntervalBox)  # contractor for y=x^3, x>=0

    x, y = X

    x = x ∩ (0..∞)

    y = y ∩ (x ^ 3)
    x = x ∩ Interval(y.lo ^ (1/3), y.hi^(1/3))   # not rigorous!

    return x × y
end

cube_neg = symmetrise(cube_pos, odd)
cube!(X::IntervalBox) = cube_pos(X) ∪ cube_neg(X)
