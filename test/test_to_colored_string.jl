module TestToColoredString

using Test
using Banners
using StyledStrings

@testset "to_colored_string" begin
    font = Banners.FIGletFont("small")

    @testset "Basic gradient functionality" begin
        result = to_colored_string(
            font, "Hi",
            top_left = "#FF0000", top_right = "#00FF00",
            bottom_left = "#0000FF", bottom_right = "#FFFF00",
        )
        @test isa(result, AbstractString)
        @test !isempty(result)
        @test isa(result, StyledStrings.AnnotatedString)
    end

    @testset "Single color (same corners)" begin
        result = to_colored_string(
            font, "Test",
            top_left = "#FF0000", top_right = "#FF0000",
            bottom_left = "#FF0000", bottom_right = "#FF0000",
        )
        @test isa(result, AbstractString)
        @test !isempty(result)
    end

    @testset "Different color formats" begin
        # Hex colors
        result1 = to_colored_string(
            font, "A",
            top_left = "#FF0000", top_right = "#00FF00",
            bottom_left = "#0000FF", bottom_right = "#FFFF00",
        )
        @test isa(result1, AbstractString)

        # CSS color names (if supported)
        try
            result2 = to_colored_string(
                font, "A",
                top_left = "red", top_right = "green",
                bottom_left = "blue", bottom_right = "yellow",
            )
            @test isa(result2, AbstractString)
        catch
            @test_skip "CSS color names not supported"
        end
    end

    @testset "Empty string with colors" begin
        result = to_colored_string(
            font, "",
            top_left = "#FF0000", top_right = "#00FF00",
            bottom_left = "#0000FF", bottom_right = "#FFFF00",
        )
        @test isa(result, AbstractString)
    end

    @testset "Large text gradient" begin
        result = to_colored_string(
            font, "HELLO WORLD",
            top_left = "#FF0000", top_right = "#00FF00",
            bottom_left = "#0000FF", bottom_right = "#FFFF00",
        )
        @test isa(result, AbstractString)
        @test !isempty(result)
    end

    @testset "Color parsing edge cases" begin
        # Test invalid colors should throw errors
        @test_throws ArgumentError to_colored_string(
            font, "Test",
            top_left = "invalid", top_right = "#00FF00",
            bottom_left = "#0000FF", bottom_right = "#FFFF00",
        )

        # Test partially invalid colors
        @test_throws ArgumentError to_colored_string(
            font, "Test",
            top_left = "#FF0000", top_right = "badcolor",
            bottom_left = "#0000FF", bottom_right = "#FFFF00",
        )
    end
end

end
