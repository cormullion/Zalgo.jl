using Zalgo

using Test

s = "Julia is really cool"

@test length(zalgo(s)) > length(s)

t = "this is text"

@test Int(upsidedown(t)[1]) == 647

@test Int(fraktur(t)[1])    == 120217

@test Int(script(t)[1])     == 120061
