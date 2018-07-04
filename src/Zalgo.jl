module Zalgo

export zalgo, upsidedown, fraktur, script

const updc = vcat('\u0300':'\u0315', '\u031A', '\u033D',
    '\u034A':'\u034C', '\u0350':'\u0352',
    '\u0357':'\u0358', '\u035B', '\u035D', '\u035E',
    '\u0360':'\u0361', '\u0363':'\u036F',
    '\uFE20':'\uFE22')

const middledc = vcat('\u031B', '\u0334':'\u0338')

const downdc = vcat('\u0316':'\u0319', '\u031C':'\u0333',
    '\u0339':'\u033C', '\u0347':'\u0349',
    '\u034D':'\u034E', '\u0353':'\u0356', '\u0359',
    '\u035A', '\u035C', '\u035F','\u0362')

const upsidedowndict = Dict("a" => "ɐ",
    "b" => "q", "c" => "ɔ", "d" => "p", "e" => "ǝ", "f" => "ɟ", "g" => "ƃ",
    "h" => "ɥ", "i" => "ı", "j" => "ɾ", "k" => "ʞ", "l" => "ן", "m" => "ɯ",
    "n" => "u", "o" => "o", "p" => "d", "q" => "b", "r" => "ɹ", "s" => "s",
    "t" => "ʇ", "u" => "n", "v" => "ʌ", "w" => "ʍ", "x" => "x", "y" => "ʎ",
    "z" => "z", "A" => "∀", "B" => "𐐒", "C" => "Ɔ", "D" => "◖", "E" => "Ǝ",
    "F" => "Ⅎ", "G" => "⅁", "H" => "H", "I" => "I", "J" => "ſ", "K" => "⋊",
    "L" => "˥", "M" => "W", "N" => "N", "O" => "O", "P" => "Ԁ", "Q" => "Ό",
    "R" => "ᴚ", "S" => "S", "T" => "⊥", "U" => "∩", "V" => "Λ", "W" => "M",
    "X" => "X", "Y" => "⅄", "Z" => "Z", "0" => "0", "1" => "Ɩ", "2" => "ᄅ",
    "3" => "Ɛ", "4" => "ㄣ", "5" => "ϛ", "6" => "9", "7" => "ㄥ", "8" => "8",
    "9" => "6")

# build the fraktur dict
frakturdict = Dict{String, Char}()
[frakturdict[string(Char(i + 64))] = vcat('\U1D56C':'\U1D585')[i] for i = 1:26]
[frakturdict[string(Char(i + 96))] = vcat('\U1D586':'\U1D59F')[i] for i = 1:26]

# build the Script dict
scriptdict = Dict{String, Char}()
[scriptdict[string(Char(i + 64))] = vcat('\U1D49C':'\U1D4B5')[i] for i = 1:26]
[scriptdict[string(Char(i + 96))] = vcat('\U1D4EA':'\U1D503')[i] for i = 1:26]

function adddc(letter, dc)
    return string(letter) * string(dc[rand(1:end)])
end

"""
    zalgo(str::String, upmarks = 1:4, middlemarks = 1:4,
        downmarks = 1:4, maxmarks = 6)

Randomly add up to `maxmarks` diacritic marks to each letter of `str`. The `upmarks`,
`middlemarks`, and `downmarks` ranges determine the minimum and maximum number of
diacritic marks added to the letter at that position.
"""
function zalgo(text::String;
        upmarks = 1:4,
        middlemarks = 1:4,
        downmarks = 1:4,
        maxmarks = 6)
    letters = split(text, "")
    zalgostring = String[]
    for letter in letters
        # can't add a diacritic mark to some letters
        if !all(isletter, letter)
            push!(zalgostring, letter)
            continue
        end
        upmarks_added     = rand(upmarks.start:upmarks.stop)
        downmarks_added   = rand(downmarks.start:downmarks.stop)
        middlemarks_added = rand(middlemarks.start:middlemarks.stop)
        newletter = letter
        for i in 1:maxmarks
            randint = rand(1:2)
            if randint == 1
                if upmarks_added > 0
                    newletter = adddc(newletter, updc)
                    upmarks_added -= 1
                end
            elseif randint == 2
                if downmarks_added > 0
                    newletter = adddc(newletter, downdc)
                    downmarks_added -= 1
                end
            else
                if middlemarks_added > 0
                    newletter = adddc(newletter, middledc)
                    middlemarks_added -= 1
                end
            end
        end
        push!(zalgostring, newletter)
    end
    return join(zalgostring)
end

"""
    upsidedown(str)

Return a version of string `str` with upside down letters from the Unicode table.
"""
function upsidedown(str)
    asciistr = filter!(c -> haskey(upsidedowndict, c), split(str, ""))
    return join(map(c -> upsidedowndict[c], asciistr))
end

"""
    fraktur(str)

Return a version of string `str` with Fraktur letters from the Unicode table.
"""
function fraktur(str)
    asciistr = filter!(c -> haskey(frakturdict, c), split(str, ""))
    return join(map(c -> frakturdict[c], asciistr))
end

"""
    upsidedown(str)

Return a version of string `str` with script letters from the Unicode table.
"""
function script(str)
    asciistr = filter!(c -> haskey(scriptdict, c), split(str, ""))
    return join(map(c -> scriptdict[c], asciistr))
end

end # module
