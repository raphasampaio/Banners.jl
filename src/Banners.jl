module Banners

using Colors
using ColorVectorSpace
using StyledStrings

include("fonts.jl")
using .Fonts

include("colors.jl")
include("strings.jl")

export to_string, to_colored_string, FIGlet, AbstractFont

end
