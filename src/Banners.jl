module Banners

using FIGlet
using StyledStrings
using Colors
using ColorVectorSpace

include("figlet.jl")

function string_to_matrix(s::AbstractString)
    lines = split(s, '\n')
    matrix = [collect(line) for line in lines]
    return matrix
end

function matrix_to_string(matrix::Vector{Vector{<:AbstractChar}})
    return join(map(row -> join(row), matrix), "\n")
end

end