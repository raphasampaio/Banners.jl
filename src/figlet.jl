function render_text_to_string(text::AbstractString, font::AbstractString)
    io = IOBuffer()
    FIGlet.render(io, text, font)
    return String(take!(io))
end