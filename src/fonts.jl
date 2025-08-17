abstract type AbstractFont end

struct FIGletFont <: AbstractFont
    label::String
end

function to_string(font::FIGletFont, text::AbstractString)
    if isempty(text)
        return ""
    end
    
    try
        io = IOBuffer()
        FIGlet.render(io, text, font.label)
        return String(take!(io))
    catch e
        if e isa KeyError
            unsupported_char = e.key
            throw(ArgumentError("Character '$unsupported_char' is not supported by FIGlet font '$(font.label)'. FIGlet supports ASCII characters only."))
        else
            rethrow(e)
        end
    end
end