using PropertyFiles
using Test

@testset "basic tests" begin
    include("basictests.jl")
end

@testset "overload tests" begin
    include("overloadtests.jl")
end

@testset "load-store tests" begin
    include("storetests.jl")
end
