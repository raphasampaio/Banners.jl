function string_to_matrix(s::AbstractString)
    lines = split(s, '\n')
    matrix = [collect(line) for line in lines]
    return matrix
end

function matrix_to_string(matrix::Vector{Vector{T}}) where {T <: AbstractChar}
    return join(map(row -> join(row), matrix), "\n")
end