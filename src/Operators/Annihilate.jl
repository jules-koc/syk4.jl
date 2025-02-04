# Annihilates a particle on ith site 

@inline function annihilate(i, state, coefficient)

    # print_state(state, L)

    if (state & 2^i) == 2^i
        sum = count_ones(state & (2^(i) - 1))
        # sum = count_ones(state >> i)
        coefficient = coefficient*(-1)^sum
        state = state - 2^i

    else 
        state = nothing
        coefficient = nothing
    end 

    # print_state(state, L)
    # println(coefficient)
    return state, coefficient
end

