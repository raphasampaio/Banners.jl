module TestToString

using Test
using Banners

@testset "to_string" begin
    font = Banners.FIGletFont("small")

    @testset "Basic functionality" begin
        result = to_string(font, "Hi")
        @test isa(result, String)
        @test !isempty(result)
        @test contains(result, "\n")
    end

    @testset "Empty string" begin
        result = to_string(font, "")
        @test isa(result, String)
    end

    @testset "Single character" begin
        result = to_string(font, "A")
        @test isa(result, String)
        @test !isempty(result)
    end

    @testset "Special characters" begin
        result = to_string(font, "123!@#")
        @test isa(result, String)
        @test !isempty(result)
    end

    @testset "Unicode characters" begin
        # FIGlet may not support all Unicode characters
        @test_throws ArgumentError to_string(font, "αβγ")
    end

    @testset "Different fonts" begin
        fonts = ["small", "standard", "big"]
        for font_name in fonts
            try
                test_font = Banners.FIGletFont(font_name)
                result = to_string(test_font, "Test")
                @test isa(result, String)
            catch
                @test_skip "Font $font_name not available"
            end
        end
    end
end

end
