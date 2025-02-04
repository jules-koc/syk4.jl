# Creates a particle on ith site


@inline function create(i, state, coefficient, L)

    # print_state(state, L)

    # if (xor(state, 2^(L)-1) & 2^i) == 2^i
    if (state & 2^i) == 0
        sum = count_ones(state & (2^(i) - 1))
        coefficient = coefficient*(-1)^sum
        state = state + 2^i
    else 
        state = nothing
        coefficient = nothing
    end 

    # print_state(state, L)
    # println(coefficient)
    return state, coefficient
end