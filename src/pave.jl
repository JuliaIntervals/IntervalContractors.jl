"Outer paving with a contractor C"

function outer_pave{N,T}(C, working::Vector{IntervalBox{N,T}}, ϵ)

    outer_list = SubPaving{N,T}()

    while !isempty(working)

        X = pop!(working)

        contracted = C(X)

        if isempty(contracted)
            continue
        end

        if diam(contracted) < ϵ
            push!(outer_list, contracted)

        else
            push!(working, bisect(contracted)...)
        end

    end

    return outer_list

end

outer_pave(C, X, ϵ) = outer_pave(C, [X], ϵ)
