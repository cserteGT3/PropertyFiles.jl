@testset "haskey" begin
    p = Properties()
    @test haskey(p, "key1") == false
    setprop(p, "key1", "value1")
    @test haskey(p, "key1") == true
end

@testset "keys&values" begin
    p = Properties()
    @test length(keys(p)) == 0
    @test length(values(p)) == 0
    setprop(p, "key1", "val1")
    setprop(p, "key2", "val2")
    pkeys = keys(p)
    pvals = values(p)
    @test getprop.(Ref(p), pkeys) == collect(pvals)
    @test length(pkeys) == 2
end

@testset "pairs" begin
    p = Properties()
    @test pairs(p) == Dict{String,String}()
    @test length(pairs(p)) == 0

    setprop(p, "key1", "val1")
    setprop(p, "key2", "val2")
    @test length(pairs(p)) == 2
    @test get.(Ref(pairs(p)), keys(p), "def") == collect(values(p))

    for (k, v) in pairs(p)
        @test haskey(p, k)
    end
end

@testset "others" begin
    # this test only makes sure, that the function can run,
    # functionality is not tested
    p = Properties()
    @test p == sizehint!(p, 15)

    @test keytype(p) == String
    @test valtype(p) == String
end
