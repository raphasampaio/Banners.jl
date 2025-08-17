module Banners

using Colors
using ColorVectorSpace
using FIGlet
using StyledStrings

export to_string, to_colored_string, FIGletFont

include("fonts.jl")
include("colors.jl")
include("strings.jl")

end