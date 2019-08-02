@testset "constructor" begin
    p = Properties()
    @test typeof(p.properties) == Dict{String,String}
end

@testset "put string" begin
    p = Properties()
    setprop(p, "k1", "key one")
    @test getprop(p, "k1") == "key one"

    setprop(p, " k 2 ", raw"C:\Users\igor\elefant\.jl")
    @test getprop(p, " k 2 ") == "C:\\Users\\igor\\elefant\\.jl"

    setprop(p, "k1", "another key")
    @test getprop(p, "k1") == "another key"
end

@testset "put !string" begin
    p = Properties()
    setprop(p, "int", 1)
    setprop(p, "float64", 1.0)
    setprop(p, "float32", 1.0f0)

    @test getprop(p, "int") == "1"
    @test getprop(p, "float64") == "1.0"
    @test getprop(p, "float32") == "1.0"
end

@testset "get" begin
    p = Properties()
    setprop(p, "", 15)
    setprop(p, "key1", "")
    #TODO: docs: can't put nothing, because it can't be printed
    @test getprop(p, "") == "15"
    @test getprop(p, "", "0") == "15"
    @test getprop(p, "", nothing) == "15"
    @test getprop(p, "15", "0") == "0"

    @test getprop(p, "nokey") == nothing
    @test getprop(p, "nokey", nothing) == nothing
    @test getprop(p, "nokey", "default") == "default"
end

@testset "get!" begin
    p = Properties()
    setprop(p, "key1", "val1")

    @test getprop!(p, "key1", "def1") == "val1"
    @test getprop(p, "key1") == "val1"
    @test getprop(p, "key2") == nothing

    @test getprop!(p, "key2", "def2") == "def2"
    @test getprop(p, "key2") == "def2"
end
