module TestAqua

using Aqua
using Template
using Test

@testset "Aqua" begin
    Aqua.test_ambiguities(Template, recursive = false)
    Aqua.test_all(Template, recursive = false)
    return nothing
end

end
