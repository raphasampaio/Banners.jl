@kwdef struct BannerColors
    top_left::RGB
    top_right::RGB
    bottom_left::RGB
    bottom_right::RGB
end

function create_gradient_color_matrix(colors::Optional{BannerColors}, rows::Integer, cols::Integer)
    matrix = fill("", rows, cols)

    if !isnothing(colors)
        for i in 1:rows
            for j in 1:cols
                y_factor = (i - 1) / max(1, rows - 1)
                x_factor = (j - 1) / max(1, cols - 1)

                top_color = (1 - x_factor) * colors.top_left + x_factor * colors.top_right
                bottom_color = (1 - x_factor) * colors.bottom_left + x_factor * colors.bottom_right
                interpolated_color = (1 - y_factor) * top_color + y_factor * bottom_color

                matrix[i, j] = "#" * hex(interpolated_color)
            end
        end
    end

    return matrix
end

function create_gradient_text(
    matrix::Vector{Vector{T}};
    foreground_colors::Optional{BannerColors} = nothing,
    background_colors::Optional{BannerColors} = nothing,
) where {T <: AbstractChar}
    if isempty(matrix) || isempty(matrix[1])
        return matrix
    end

    rows = length(matrix)
    cols = maximum(length(row) for row in matrix)

    foreground_gradient_color_matrix = create_gradient_color_matrix(foreground_colors, rows, cols)
    background_gradient_color_matrix = create_gradient_color_matrix(background_colors, rows, cols)

    colored_matrix = Vector{Vector{AnnotatedString{String}}}()

    for (i, row) in enumerate(matrix)
        colored_row = Vector{AnnotatedString{String}}()

        for j in eachindex(row)
            fg = foreground_gradient_color_matrix[i, j]
            bg = background_gradient_color_matrix[i, j]

            data = if !isnothing(foreground_colors) && !isnothing(background_colors)
                # both present
                styled"{(fg=$fg,bg=$bg):$(row[j])}"
            elseif !isnothing(foreground_colors)
                # only foreground present
                styled"{(fg=$fg):$(row[j])}"
            elseif !isnothing(background_colors)
                # only background present
                styled"{(bg=$bg):$(row[j])}"
            else
                # neither present
                string(row[j])
            end
            push!(colored_row, data)
        end

        push!(colored_matrix, colored_row)
    end

    return colored_matrix
end

function create_gradient_banner(
    font::Fonts.AbstractFont,
    text::AbstractString;
    foreground_colors::Optional{BannerColors} = nothing,
    background_colors::Optional{BannerColors} = nothing,
)
    if isempty(text)
        return ""
    end

    matrix = string_to_matrix(Fonts.create_banner(font, text))
    colored_matrix = create_gradient_text(matrix; foreground_colors, background_colors)
    return matrix_to_string(colored_matrix)
end

# tl_color = parse(RGB, top_left)
# tr_color = parse(RGB, top_right)
# bl_color = parse(RGB, bottom_left)
# br_color = parse(RGB, bottom_right)
