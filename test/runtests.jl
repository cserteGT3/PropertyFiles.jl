using PropertyFiles
using Test

@testset "dictionary constructor" begin
    @test Properties() == Dict{String, String}()
end

@testset "put tests" begin
    p = Properties()
    putproperty(p, "k1", "key one")
    putproperty(p, "k2", 1)
    @test p["k1"] == "key one"
    @test p["k2"] == "1"
end

# get tests

# file write and load tests
