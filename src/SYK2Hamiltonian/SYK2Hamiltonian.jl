include("../GenerateMatrix/GenerateMatrix.jl")

function create_syk2(basis, L, N)

    # t = create_random_matrix(L, 2/L, 1/L)
    # jldsave("syk2_matrix.jld2"; t)

    data = load("./syk2_matrix.jld2")  # Load the entire file
    t = data["t"] 
    H = generate_matrix(basis, t, L)
    return H
    # size_estimate = binomial(L, N) * L^2
    # rows = Vector{Int64}(undef, size_estimate)
    # cols = Vector{Int64}(undef, size_estimate)
    # vals = Vector{Float64}(undef, size_estimate)
   
    # count = 1
    # for (col, state1) in enumerate(basis) #so in [(1,b1), (2,b2), ...]
    #      for i in 0:L-1
    #         for j in 0:L-1
    #             coeff = 1 
    #             temp_state = copy(state1)
    #             row, coeff = hij(i, j, temp_state, coeff)
                
    #             if row !== nothing
    #                 rows[count] = row
    #                 cols[count] = col
    #                 vals[count] = t[i+1,j+1] * coeff
    #                 count += 1

    #                 if col == 3 && row == 1 
    #                     println(vals)
    #                 end
    #             end
    #         end 
    #     end 
    # end 

    # count = 1
    # println(length(cols))
    # for (col, state1) in enumerate(basis) #so in [(1,b1), (2,b2), ...]
         
    #     #diagonal elements
    #     for i in 0:L-1
    #         x = state1 & (2^i)
    #         if x == 2^i
    #             cols[count] = col
    #             rows[count] = col
    #             vals[count] = t[i+1,i+1]
    #             count += 1  
    #         end 
    #     end 

    #     #offdiagonal elements
    #     for (row, state2) in enumerate(basis)
    #         if row>col

    #             diff = xor(state1, state2)

    #             if count_ones(diff) == 2

    #                 bit_positions = findall(b -> b == 1, digits(diff, base=2))
    #                 temp_state = state1
    #                 coeff = 1 

    #                 cols[count] = col 
    #                 rows[count] = row 
    #                 vals[count] = t[bit_positions[1],bit_positions[2]]
    #                 count += 1
                    
    #                 cols[count] = row 
    #                 rows[count] = col 
    #                 vals[count] = t[bit_positions[2], bit_positions[1]]  
    #                 count +=1
                    
    #             end
    #         end  
    #     end 
    # end 
 
 
    # H_sparse = sparse(rows[1:count-1], cols[1:count-1], vals[1:count-1])
    # return H_sparse


end 



