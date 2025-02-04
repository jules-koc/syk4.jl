
include("../Operators/Operators.jl")
include("../UsefullFunctions/UsefullFunctions.jl")


function hijkm(i, j, k, m, temp_state, coeff)
    for (operation, idx) in [
        (:annihilate, m),
        (:annihilate, k),
        (:create, j),
        (:create, i)
    ]
        if temp_state === nothing 
            break
        end

        if operation == :annihilate
            temp_state, coeff = annihilate(idx, temp_state, coeff)
        elseif operation == :create
            temp_state, coeff = create(idx, temp_state, coeff, L)
        end
    end 

   
    if temp_state !== nothing 
        row = findfirst(x -> x == temp_state, basis)
    else 
        row = nothing
    end 

    return row, coeff

end 


function create_syk4(basis, L, N)

    size_estimate = binomial(L, N) * L^4

    rows = Vector{Int64}(undef, size_estimate)
    cols = Vector{Int64}(undef, size_estimate)
    vals = Vector{Float64}(undef, size_estimate)

    Uijkm = create_tensor(L)

    count = 1
    # col = 1
    # state1 = basis[1]
    for (col, state1) in enumerate(basis) #so in [(1,b1), (2,b2), ...]
         for idx in findall(!iszero, Uijkm)
            coeff = 1 
            temp_state = copy(state1)

            row, coeff = hijkm(idx[1]-1, idx[2]-1, idx[3]-1, idx[4]-1, temp_state, coeff)
            
            if row !== nothing
                rows[count] = row
                cols[count] = col
                vals[count] = Uijkm[idx]*coeff
                count += 1
            end
                        
        end 
    end 
 
    H_sparse = sparse(rows[1:count-1], cols[1:count-1], vals[1:count-1])
    return H_sparse
end 

    