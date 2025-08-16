abstract type AbstractFont end

struct FIGletFont <: AbstractFont
    label::String
end

function to_string(font::FIGletFont, text::AbstractString)
    io = IOBuffer()
    FIGlet.render(io, text, font.label)
    return String(take!(io))
end