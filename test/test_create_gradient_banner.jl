module TestToColoredString

using Banners
using Colors
using StyledStrings
using Test

const Face = StyledStrings.Face
const SimpleColor = StyledStrings.SimpleColor

@testset "create_gradient_banner" begin
    font = Banners.Fonts.FIGlet("small")
    foreground_colors = BannerColors(
        top_left = colorant"#FF0000",
        top_right = colorant"#00FF00",
        bottom_left = colorant"#0000FF",
        bottom_right = colorant"#FFFF00",
    )
    background_colors = BannerColors(
        top_left = colorant"#FFFF00",
        top_right = colorant"#0000FF",
        bottom_left = colorant"#00FF00",
        bottom_right = colorant"#FFFF00",
    )

    result = create_gradient_banner(
        font,
        "Hello World",
        foreground_colors = foreground_colors,
    )

    @show result
end

end
