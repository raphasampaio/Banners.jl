function gradient_text(
    matrix::Vector{Vector{T}};
    top_left::AbstractString,
    top_right::AbstractString,
    bottom_left::AbstractString,
    bottom_right::AbstractString,
) where {T <: AbstractChar}
    if isempty(matrix) || isempty(matrix[1])
        return matrix
    end

    tl_color = parse(RGB, top_left)
    tr_color = parse(RGB, top_right)
    bl_color = parse(RGB, bottom_left)
    br_color = parse(RGB, bottom_right)

    rows = length(matrix)
    cols = maximum(length(row) for row in matrix)

    colored_matrix = Vector{Vector{AnnotatedString{String}}}()

    for (i, row) in enumerate(matrix)
        colored_row = Vector{AnnotatedString{String}}()

        for j in eachindex(row)
            y_factor = (i - 1) / max(1, rows - 1)
            x_factor = (j - 1) / max(1, cols - 1)

            top_color = (1 - x_factor) * tl_color + x_factor * tr_color
            bottom_color = (1 - x_factor) * bl_color + x_factor * br_color
            interpolated_color = (1 - y_factor) * top_color + y_factor * bottom_color

            if row[j] != ' '
                hex_color = "#" * hex(interpolated_color)
                push!(colored_row, styled"{(fg=$hex_color):$(row[j])}")
            else
                push!(colored_row, string(row[j]))
            end
        end

        push!(colored_matrix, colored_row)
    end

    return colored_matrix
end

function to_colored_string(
    font::AbstractFont, 
    text::AbstractString;
    top_left::AbstractString,
    top_right::AbstractString,
    bottom_left::AbstractString,
    bottom_right::AbstractString,
)
    if isempty(text)
        return ""
    end
    
    # Validate color strings
    try
        parse(RGB, top_left)
        parse(RGB, top_right)
        parse(RGB, bottom_left)
        parse(RGB, bottom_right)
    catch e
        if e isa ArgumentError
            throw(ArgumentError("Invalid color format. Use hex format like '#FF0000' or CSS color names like 'red'."))
        else
            rethrow(e)
        end
    end
    
    matrix = string_to_matrix(to_string(font, text))
    colored_matrix = gradient_text(matrix; top_left, top_right, bottom_left, bottom_right)
    return matrix_to_string(colored_matrix)
end
