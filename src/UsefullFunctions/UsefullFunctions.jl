#A function to plot a many-body state
function print_state(state, L)
    println(lpad(string(state, base=2), L, '0')) # Binary printing the state as 0 and 1
end

#A function to create random LxL martix 
function create_random_matrix(L, var_diag, var_offdiag)
    matrix = Symmetric(randn(L, L) .* sqrt(var_offdiag))  # Symmetric matrix
    matrix[diagind(matrix)] .= randn(L) .* sqrt(var_diag)  # Set diagonal elements
    return matrix
end

function create_tensor(L)

    U = zeros(Float64, (L, L, L, L))
    #Implementing the symmetries for the tensor
    for i=1:L, j=i+1:L, k=1:L, m=k+1:L

        if U[i,j,k,m] == 0 && U[j,i,k,m] == 0 && U[i,j,m,k] == 0 && U[j, i, m, k] == 0 
            
            u = randn()
            U[i,j,k,m] = 4*u
            U[k,m,i,j] = 4*conj(u) 
        end 

    end 
    return U
end

