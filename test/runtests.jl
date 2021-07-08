using Zalgo

using Test

s = "Julia is really cool"
@test length(zalgo(s)) > length(s)

@test (zalgo(s, upmarks=1:2) |> length > length(s)) == true
@test (zalgo(s, middlemarks=1:2) |> length > length(s)) == true
@test (zalgo(s, downmarks=1:2) |> length > length(s)) == true
@test (zalgo(s, maxmarks=2) |> length > length(s)) == true

@test length(zalgo(s, maxmarks=0)) == length(s)

@test boldscript(string('B'))[1] |> Int  ==  120017
@test boldfraktur(string('B'))[1] |> Int  ==  120173
@test bolditalic(string('B'))[1] |> Int  ==  119913
@test bolditalicsans(string('B'))[1] |> Int  ==  120381
@test boldroman(string('B'))[1] |> Int  ==  119809
@test boldsans(string('B'))[1] |> Int  ==  120277
@test italic(string('B'))[1] |> Int  ==  119861
@test italicsans(string('B'))[1] |> Int  ==  120329
@test sans(string('B'))[1] |> Int  ==  120225
@test script(string('B'))[1] |> Int  ==  8492
@test teletype(string('B'))[1] |> Int  ==  120433
@test upsidedown(string('B'))[1] |> Int  ==  66578
@test blackboard(string('B'))[1] |> Int  ==  120121
@test fraktur(string('B'))[1] |> Int  ==  120069
@test boldscript(string('w'))[1] |> Int  ==  120064
@test boldfraktur(string('w'))[1] |> Int  ==  120220
@test bolditalic(string('w'))[1] |> Int  ==  119960
@test bolditalicsans(string('w'))[1] |> Int  ==  120428
@test boldroman(string('w'))[1] |> Int  ==  119856
@test boldsans(string('w'))[1] |> Int  ==  120324
@test italic(string('w'))[1] |> Int  ==  119908
@test italicsans(string('w'))[1] |> Int  ==  120376
@test sans(string('w'))[1] |> Int  ==  120272
@test script(string('w'))[1] |> Int  ==  120012
@test teletype(string('w'))[1] |> Int  ==  120480
@test upsidedown(string('w'))[1] |> Int  ==  653
@test blackboard(string('w'))[1] |> Int  ==  120168
@test fraktur(string('w'))[1] |> Int  ==  120220
@test boxed(string('w'))[1] |> Int == 127366
@test circled(string('w'))[1] |> Int == 9446
@test circled(string('w'), negative=true)[1] |> Int == 127366
@test segmented(string('1'))[1] |> Int == 130032

#=
for f in (boldscript, boldfraktur, bolditalic, bolditalicsans, boldroman, boldsans, italic, italicsans, sans, script, teletype, upsidedown, blackboard, fraktur)
    ch = 'w'
    ff = f(string(ch))
    fch = Int(Char(ff[1]))
    println(" @test ", f, "(string('$(ch)'))[1] |> Int", "  ==  ", fch,)
end
=#
