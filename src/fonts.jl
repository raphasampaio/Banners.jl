module Fonts

import FIGlet as FIGletRenderer

export to_string, AbstractFont, FIGlet

abstract type AbstractFont end

struct FIGlet <: AbstractFont
    label::String
end

function create_banner(font::FIGlet, text::AbstractString)
    if isempty(text)
        return ""
    end

    try
        io = IOBuffer()
        FIGletRenderer.render(io, text, font.label)
        return String(take!(io))
    catch e
        if e isa KeyError
            unsupported_char = e.key
            throw(
                ArgumentError(
                    "Character '$unsupported_char' is not supported by FIGlet font '$(font.label)'. FIGlet supports ASCII characters only.",
                ),
            )
        else
            rethrow(e)
        end
    end
end

end
