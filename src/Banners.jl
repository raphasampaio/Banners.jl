module Banners

using Colors
using ColorVectorSpace
using StyledStrings

include("fonts.jl")
include("colors.jl")
include("strings.jl")

using .Fonts

export to_string, to_colored_string, FIGlet, AbstractFont

end
