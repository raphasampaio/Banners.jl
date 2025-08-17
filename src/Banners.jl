module Banners

using Colors
using ColorVectorSpace
using StyledStrings

export to_string, to_colored_string, FIGlet

include("fonts.jl")
include("colors.jl")
include("strings.jl")

end
