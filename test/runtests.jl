using PropertyFiles
using Test

@testset "dictionary constructor" begin
    @test Properties() == Dict{String, String}()
end

@testset "put string" begin
    p = Properties()
    putproperty(p, "k1", "key one")
    @test p["k1"] == "key one"

    putproperty(p, " k 2 ", raw"C:\Users\igor\elefant\.jl")
    @test p[" k 2 "] == "C:\\Users\\igor\\elefant\\.jl"

    putproperty(p, "k1", "another key")
    @test p["k1"] == "another key"
end

@testset "put !string" begin
    p = Properties()
    putproperty(p, "int", 1)
    putproperty(p, "float64", 1.0)
    putproperty(p, "float32", 1.0f0)

    @test p["int"] == "1"
    @test p["float64"] == "1.0"
    @test p["float32"] == "1.0"
end

@testset "get" begin
    p = Properties()
    putproperty(p, "", 15)
    #TODO: docs: can't put nothing, because it cant be printed
    putproperty(p, "key1", "")
    @test get(p, "", 0) == "15"
    @test get(p, "15", 0) == 0
    #TODO: docs you should use strings as default values
    @test get(p, "15", "0") == "0"
    @test get(p, "key1", nothing) == ""
end

@testset "get!" begin
    p = Properties()
    try
        get!(p, "15", 15)
    catch e
        @test typeof(e) == MethodError
    end
    @test get!(p, "15", "15") == "15"
    @test get(p, "15", "") == "15"
end

# file write and load tests
