module TestToString

using Test
using Banners

@testset "create_banner" begin
    font = Banners.Fonts.FIGlet("small")

    @testset "Basic functionality" begin
        result = create_banner(font, "Hi")
        @test isa(result, String)
        @test !isempty(result)
        @test contains(result, "\n")
    end

    @testset "Empty string" begin
        result = create_banner(font, "")
        @test isa(result, String)
    end

    @testset "Single character" begin
        result = create_banner(font, "A")
        @test isa(result, String)
        @test !isempty(result)
    end

    @testset "Special characters" begin
        result = create_banner(font, "123!@#")
        @test isa(result, String)
        @test !isempty(result)
    end

    @testset "Unicode characters" begin
        # FIGlet may not support all Unicode characters
        @test_throws ArgumentError create_banner(font, "αβγ")
    end

    @testset "Different fonts" begin
        fonts = ["small", "standard", "big"]
        for font_name in fonts
            try
                test_font = Banners.Fonts.FIGlet(font_name)
                result = create_banner(test_font, "Test")
                @test isa(result, String)
            catch
                @test_skip "Font $font_name not available"
            end
        end
    end
end

end
