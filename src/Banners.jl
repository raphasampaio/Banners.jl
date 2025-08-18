module Banners

using Colors
using ColorVectorSpace
using StyledStrings

include("fonts.jl")
using .Fonts

include("util.jl")
include("gradient.jl")
include("strings.jl")

export create_banner, create_gradient_banner, BannerColors, FIGlet, AbstractFont

end
