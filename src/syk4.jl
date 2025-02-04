module syk4

using Random, SparseArrays, LinearAlgebra, BenchmarkTools, Combinatorics, PyPlot, DelimitedFiles, JLD2


include("BasisCreation/BasisCreation.jl")
include("Operators/Operators.jl")
include("UsefullFunctions/UsefullFunctions.jl")
include("SYK2Hamiltonian/SYK2Hamiltonian.jl")
include("SYK4Hamiltonian/SYK4Hamiltonian.jl")
include("NonGaussianityCheck/NonGaussianityCheck.jl")
include("GenerateMatrix/GenerateMatrix.jl")


   
end 