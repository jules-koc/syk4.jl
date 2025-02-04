include("../UsefullFunctions/UsefullFunctions.jl")
include("../Operators/Operators.jl")

function hij(i, j, temp_state, coeff)
   
    for (operation, idx) in [
        (:annihilate, j),
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

function generate_matrix(basis, t, L)

    size_estimate = binomial(L, N) * L^2
    rows = Vector{Int64}(undef, size_estimate)
    cols = Vector{Int64}(undef, size_estimate)
    vals = Vector{Float64}(undef, size_estimate)

    count = 1
       
    for (col, state1) in enumerate(basis) #so in [(1,b1), (2,b2), ...]
         for i in 0:L-1
            for j in 0:L-1
                coeff = 1 
                temp_state = copy(state1)
                row, coeff = hij(i, j, temp_state, coeff)
                
                if row !== nothing
                    rows[count] = row
                    cols[count] = col
                    vals[count] = t[i+1,j+1] * coeff
                    count += 1

                    if col == 3 && row == 1 
                        println(vals)
                    end
                end
            end 
        end 
    end 
 
 
    H_sparse = sparse(rows[1:count-1], cols[1:count-1], vals[1:count-1])
    return H_sparse
end 