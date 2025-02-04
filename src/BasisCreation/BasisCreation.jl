function create_basis(L, N)
    basis = Vector{Int64}(undef, binomial(L, N))
    count = 1
    for state in 0:2^L-1
        if count_ones(state) == N
            basis[count] = state 
            count += 1
        end
    end
    println(count)
    return basis
end 

