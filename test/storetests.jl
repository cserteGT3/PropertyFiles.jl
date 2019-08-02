@testset "basic store-load" begin
    p = Properties()
    setprop(p, "key1", "value1")
    setprop(p, "key2", 157)
    setprop(p, "key3", 157.876341)
    setprop(p, "key4", raw"C:\Users\igor\elefant\.jl")

    fname = "p.jlprop"
    store(p, fname)
    @test isfile(fname)
    pl = load(fname)
    rm(fname)
    @test length(pairs(p)) == length(pairs(pl))
    pkeys = keys(p)
    for pk in pkeys
        @test getprop(p, pk) == getprop(pl, pk)
    end
end

@testset "multiline comment" begin
    p = Properties()
    setprop(p, "key1", "value1")
    setprop(p, "key2", 157)
    setprop(p, "key3", 157.876341)
    setprop(p, "key4", raw"C:\Users\igor\elefant\.jl")

    fname = "p2.jlprop"
    store(p, fname, "this\nis a multiline\ncomment \n and another one")
    @test isfile(fname)

    # test if the comments are written correctly
    lines = readlines(fname)
    commlines = ["#this", "#is a multiline", "#comment ", "# and another one"]
    for i in 1:4
        @test lines[i] == commlines[i]
    end

    pl = load(fname)
    rm(fname)
    @test length(pairs(p)) == length(pairs(pl))
    pkeys = keys(p)
    for pk in pkeys
        @test getprop(p, pk) == getprop(pl, pk)
    end
end
