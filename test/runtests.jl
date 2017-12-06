using Zalgo
using Base.Test

s = "Julia is really cool"

@test length(zalgoize(s)) > length(s)
