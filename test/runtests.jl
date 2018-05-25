using Zalgo
using Base.Test

s = "Julia is really cool"

@test length(zalgo(s)) > length(s)
