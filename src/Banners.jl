module Banners

using Colors
using ColorVectorSpace
using StyledStrings

include("fonts.jl")
using .Fonts

include("colors.jl")
include("strings.jl")

export create_banner, create_gradient_banner, FIGlet, AbstractFont

end
