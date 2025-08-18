module TestCreateGradientBanner

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
        "Hello",
        foreground_colors = foreground_colors,
    )

    @test result.string == " _  _     _ _\n| || |___| | |___\n| __ / -_) | / _ \\\n|_||_\\___|_|_\\___/\n\n\n"
    @test result.annotations[1] == @NamedTuple{region::UnitRange{Int64}, label::Symbol, value}((1:1, :face, Face(foreground=SimpleColor(0xff0000))))
end

end
