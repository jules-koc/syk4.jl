
include("../Operators/Operators.jl")
include("../UsefullFunctions/UsefullFunctions.jl")
include("..//GenerateMatrix/GenerateMatrix.jl")

function non_gaussianity_check(state)
    
    t = ones(L, L)
    matrix = generate_matrix(basis, t, L) #creates a matrix of ci^dagger cj, just like the syk, but without the random numbers
    display(Matrix(matrix))
    C = state' * Matrix(matrix) * state
    C_diag = eigen(C)
    display(C)
    ν = C_diag.values
   
    ν .= ifelse.(isapprox.(ν, 0.0; atol=1e-10), 0.0, ifelse.(isapprox.(ν, 1.0), 1.0, ν))
    non_0_or_1_ν = ν[(ν .!= 0) .& (ν .!= 1)]
    NG = isempty(non_0_or_1_ν) ? 0.0 : sum(-non_0_or_1_ν .* log2.(non_0_or_1_ν) .- (1 .- non_0_or_1_ν) .* log2.(1 .- non_0_or_1_ν))
    return NG / (V * log2(2))
end 