module Banners

using Colors
using ColorVectorSpace
using FIGlet
using StyledStrings

export to_string, to_colored_string

include("colors.jl")
include("fonts.jl")
include("strings.jl")

end