"""
Zalgo.jl does two things.

- It adds pointless diacritics to text: `zalgo("Cthulhu")`

- It converts an input ASCII string to equivalent characters found in the 
darkest recesses of the Unicode charts:

```
blackboard("Hello World")    
boldfraktur("Hello World")   
bolditalic("Hello World")    
bolditalicsans("Hello World")
boldroman("Hello World")     
boldsans("Hello World")      
boldscript("Hello World")    
boxed("hello world")         
circled("HELLO WORLD")       
fraktur("Hello World")       
italic("Hello World")        
italicsans("Hello World")    
sans("Hello World")          
script("Hello World")        
segmented("0123456789")      
teletype("Hello World")      
upsidedown("Hello World")    
```

```large_type("Hello World")``` displays the text using
the Large Text glyphs defined in Unicode 16.
"""
module Zalgo

export zalgo, boldfraktur, bolditalic, bolditalicsans,
boldroman, boldsans, boldscript, fraktur, italic,
italicsans, sans, script, teletype, upsidedown, blackboard,
boxed, circled, segmented, large_type

include("largetype.jl")

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

const upsidedowndict = Dict{String, String}("a" => "ɐ",
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
    "9" => "6", " " => " ")

# These are a shambles, Unicode Consortium!
# build the fraktur dict
frakturdict = Dict{String, Char}()
[frakturdict[string(Char(i + 64))] = vcat(
    '\U1D504',  # A
    '\U1D505',  # B
    '\u212d',   # C !
    '\U1D507',  # D
    '\U1D508',  # E
    '\U1D509',  # F
    '\U1D50a',  # G
    '\u210c',   # H !
    '\u2111',   # I !
    '\U1D50d',  # J
    '\U1D50e',  # K
    '\U1D50f',  # L
    '\U1D510',  # M
    '\U1D511',  # N
    '\U1D512',  # O
    '\U1D513',  # P
    '\U1D514',  # Q
    '\u211c',   # R !
    '\U1D516',  # S
    '\U1D517',  # T
    '\U1D518',  # U
    '\U1D519',  # V
    '\U1D51a',  # W
    '\U1D51b',  # X
    '\U1D51c',  # Y
    '\u2128'    # Z !
    )[i] for i = 1:26]
[frakturdict[string(Char(i + 96))] = vcat('\U1D586':'\U1D59F')[i] for i = 1:26]
frakturdict[" "] = ' '

# build the blackboard (double-struck) dict
blackboarddict = Dict{String, Char}()
[blackboarddict[string(Char(i + 64))] = vcat(
    '\U1D538',  # A
    '\U1D539',  # B
    '\u2102',   # C !
    '\U1D53B',  # D
    '\U1D53c',  # E
    '\U1D53d',  # F
    '\U1D53e',  # G
    '\u210D',   # H !
    '\U1D540',  # I !
    '\U1D541',  # J
    '\U1D542',  # K
    '\U1D543',  # L
    '\U1D544',  # M
    '\u2115',   # N !
    '\U1D546',  # O
    '\u2119',   # P !
    '\u211a',   # Q !
    '\u211d',   # R
    '\U1D54A',  # S
    '\U1D54B',  # T
    '\U1D54C',  # U
    '\U1D54D',  # V
    '\U1D54E',  # W
    '\U1D54f',  # X
    '\U1D550',  # Y
    '\u2124'    # Z !
    )[i] for i = 1:26]
[blackboarddict[string(Char(i + 96))] = vcat('\U1D552':'\U1D56B')[i] for i = 1:26]
# digits
[blackboarddict[string(Char(i + 48))] =  vcat('\U1D7D8':'\U1D7E1')[i + 1] for i in 0:9]

blackboarddict[" "] = ' '

# build the Script dict
scriptdict = Dict{String, Char}()
[scriptdict[string(Char(i + 64))] = vcat('\U1D49C':'\U1D4B5')[i] for i = 1:26]
[scriptdict[string(Char(i + 96))] = vcat('\U1D4b6':'\U1D4cf')[i] for i = 1:26]
scriptdict["B"] = '\u212c'
scriptdict["E"] = '\u2130'
scriptdict["F"] = '\u2131'
scriptdict["H"] = '\u210b'
scriptdict["I"] = '\u2110'
scriptdict["L"] = '\u2112'
scriptdict["M"] = '\u2133'
scriptdict["R"] = '\u211B'
scriptdict["e"] = '\u212f'
scriptdict["g"] = '\u210a'
scriptdict["o"] = '\u2134'
scriptdict[" "] = ' '

# build the boldroman dict
boldromandict = Dict{String, Char}()
[boldromandict[string(Char(i + 64))] = vcat('\U1D400':'\U1D419')[i] for i = 1:26]
[boldromandict[string(Char(i + 96))] = vcat('\U1D41a':'\U1D433')[i] for i = 1:26]
[boldromandict[string(Char(i + 48))] = vcat('\U1D7CE':'\U1D7D7')[i + 1] for i = 0:9]
boldromandict[" "] = ' '

# build the italic dict
italicdict = Dict{String, Char}()
[italicdict[string(Char(i + 64))] = vcat('\U1D434':'\U1D44d')[i] for i = 1:26]
[italicdict[string(Char(i + 96))] = vcat('\U1D44e':'\U1D467')[i] for i = 1:26]
italicdict[" "] = ' '

# build the bolditalic dict
bolditalicdict = Dict{String, Char}()
[bolditalicdict[string(Char(i + 64))] = vcat('\U1D468':'\U1D481')[i] for i = 1:26]
[bolditalicdict[string(Char(i + 96))] = vcat('\U1D482':'\U1D49b')[i] for i = 1:26]
bolditalicdict[" "] = ' '

# build the boldscript dict
boldscriptdict = Dict{String, Char}()
[boldscriptdict[string(Char(i + 64))] = vcat('\U1D4D0':'\U1D4E9')[i] for i = 1:26]
[boldscriptdict[string(Char(i + 96))] = vcat('\U1D4ea':'\U1D503')[i] for i = 1:26]
boldscriptdict[" "] = ' '

# build the boldfraktur dict
boldfrakturdict = Dict{String, Char}()
[boldfrakturdict[string(Char(i + 64))] = vcat('\U1D56c':'\U1D585')[i] for i = 1:26]
[boldfrakturdict[string(Char(i + 96))] = vcat('\U1D586':'\U1D59f')[i] for i = 1:26]
boldfrakturdict[" "] = ' '

# build the sans dict
sansdict = Dict{String, Char}()
[sansdict[string(Char(i + 64))] = vcat('\U1D5A0':'\U1D5B9')[i] for i = 1:26]
[sansdict[string(Char(i + 96))] = vcat('\U1D5ba':'\U1D5d3')[i] for i = 1:26]
[sansdict[string(Char(i + 48))] = vcat('\U1D7E2':'\U1D7EB')[i + 1] for i = 0:9]
sansdict[" "] = ' '

# build the boldsans dict
boldsansdict = Dict{String, Char}()
[boldsansdict[string(Char(i + 64))] = vcat('\U1D5d4':'\U1D5ed')[i] for i = 1:26]
[boldsansdict[string(Char(i + 96))] = vcat('\U1D5ee':'\U1D607')[i] for i = 1:26]
[boldsansdict[string(Char(i + 48))] = vcat('\U1D7EC':'\U1D7F5')[i + 1] for i = 0:9]
boldsansdict[" "] = ' '

# build the italicsans dict
italicsansdict = Dict{String, Char}()
[italicsansdict[string(Char(i + 64))] = vcat('\U1D608':'\U1D621')[i] for i = 1:26]
[italicsansdict[string(Char(i + 96))] = vcat('\U1D622':'\U1D63b')[i] for i = 1:26]
italicsansdict[" "] = ' '

# build the bolditalicsans dict
bolditalicsansdict = Dict{String, Char}()
[bolditalicsansdict[string(Char(i + 64))] = vcat('\U1D63c':'\U1D655')[i] for i = 1:26]
[bolditalicsansdict[string(Char(i + 96))] = vcat('\U1D656':'\U1D66f')[i] for i = 1:26]
bolditalicsansdict[" "] = ' '

# build the teletype dict
ttdict = Dict{String, Char}()
[ttdict[string(Char(i + 64))] = vcat('\U1D670':'\U1D689')[i] for i = 1:26]
[ttdict[string(Char(i + 96))] = vcat('\U1D68a':'\U1D6a3')[i] for i = 1:26]
[ttdict[string(Char(i + 48))] = vcat('\U1D7F6':'\U1D7FF')[i + 1] for i = 0:9]
ttdict[" "] = ' '

# build the boxed dict
boxeddict = Dict{String, Char}()
[boxeddict[string(Char(i + 64))] = vcat('\U1F130':'\U1F14A')[i] for i = 1:26]
[boxeddict[string(Char(i + 96))] = vcat('\U1F170':'\U1F18A')[i] for i = 1:26]
boxeddict[" "] = ' '

# build the circled dict
circleddict = Dict{String, Char}()
[circleddict[string(Char(i + 64))] = vcat('\u24b6':'\u24cf')[i] for i = 1:26]
[circleddict[string(Char(i + 96))] = vcat('\u24d0':'\u24e9')[i] for i = 1:26]
[circleddict[string(Char(i + 0x30))] = vcat('\u2460':'\u2468')[i] for i = 1:9]
# 24EA 0 CIRCLED DIGIT ZERO is separate !!!
circleddict[string(Char(0x30))] = '\u24ea'
circleddict[" "] = ' '

# negativecircled dict
# build the circled dict
negativecircleddict = Dict{String, Char}()
[negativecircleddict[string(Char(i + 64))] = vcat('\U1F150':'\U1F169')[i] for i = 1:26]
[negativecircleddict[string(Char(i + 96))] = vcat('\U1F170':'\U1F189')[i] for i = 1:26]
negativecircleddict[" "] = ' '

# build the segmented dict
segmenteddict = Dict{String, Char}()
[segmenteddict[string(Char(i + 0x2f))] = vcat('\U1FBF0':'\U1FBF9')[i] for i = 1:10]
segmenteddict[" "] = ' '

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
    script(str)

Return a version of string `str` with script letters from the Unicode table.
"""
function script(str)
    asciistr = filter!(c -> haskey(scriptdict, c), split(str, ""))
    return join(map(c -> scriptdict[c], asciistr))
end

"""
    boldroman(str)

Return a version of string `str` with boldroman letters from the Unicode table.
"""
function boldroman(str)
    asciistr = filter!(c -> haskey(boldromandict, c), split(str, ""))
    return join(map(c -> boldromandict[c], asciistr))
end

"""
    italic(str)

Return a version of string `str` with italic letters from the Unicode table.
"""
function italic(str)
    asciistr = filter!(c -> haskey(italicdict, c), split(str, ""))
    return join(map(c -> italicdict[c], asciistr))
end

"""
    bolditalic(str)

Return a version of string `str` with bolditalic letters from the Unicode table.
"""
function bolditalic(str)
    asciistr = filter!(c -> haskey(bolditalicdict, c), split(str, ""))
    return join(map(c -> bolditalicdict[c], asciistr))
end

"""
    boldscript(str)

Return a version of string `str` with boldscript letters from the Unicode table.
"""
function boldscript(str)
    asciistr = filter!(c -> haskey(boldscriptdict, c), split(str, ""))
    return join(map(c -> boldscriptdict[c], asciistr))
end

"""
    boldfraktur(str)

Return a version of string `str` with boldfraktur letters from the Unicode table.
"""
function boldfraktur(str)
    asciistr = filter!(c -> haskey(boldfrakturdict, c), split(str, ""))
    return join(map(c -> boldfrakturdict[c], asciistr))
end

"""
    sans(str)

Return a version of string `str` with sans serif letters from the Unicode table.
"""
function sans(str)
    asciistr = filter!(c -> haskey(sansdict, c), split(str, ""))
    return join(map(c -> sansdict[c], asciistr))
end

"""
    boldsans(str)

Return a version of string `str` with bold sans serif letters from the Unicode table.
"""
function boldsans(str)
    asciistr = filter!(c -> haskey(boldsansdict, c), split(str, ""))
    return join(map(c -> boldsansdict[c], asciistr))
end

"""
    italicsans(str)

Return a version of string `str` with italic sans serif letters from the Unicode table.
"""
function italicsans(str)
    asciistr = filter!(c -> haskey(italicsansdict, c), split(str, ""))
    return join(map(c -> italicsansdict[c], asciistr))
end


"""
    bolditalicsans(str)

Return a version of string `str` with bold italic sans serif letters from the Unicode table.
"""
function bolditalicsans(str)
    asciistr = filter!(c -> haskey(bolditalicsansdict, c), split(str, ""))
    return join(map(c -> bolditalicsansdict[c], asciistr))
end

"""
    teletype(str)

Return a version of string `str` with teletype (monospaced) letters from the Unicode table.
"""
function teletype(str)
    asciistr = filter!(c -> haskey(ttdict, c), split(str, ""))
    return join(map(c -> ttdict[c], asciistr))
end

"""
    blackboard(str)

Return a version of string `str` with blackboard (double-struck) letters from the Unicode table.
"""
function blackboard(str)
    asciistr = filter!(c -> haskey(blackboarddict, c), split(str, ""))
    return join(map(c -> blackboarddict[c], asciistr))
end

"""
    boxed(str)

Return a version of string `str` with boxed letters from the Unicode table.

```
boxed("A") -> "🄰"
boxed("a") -> "🅰"
```
"""
function boxed(str)
    asciistr = filter!(c -> haskey(boxeddict, c), split(str, ""))
    return join(map(c -> boxeddict[c], asciistr))
end

"""
    circled(str)

Return a version of string `str` with circled/boxed letters from the Unicode table.

```
A-Z             \u24b6:\u24cf       "A" -> "Ⓐ"
a-z             \u24d0:\u24e9       "a" -> "ⓐ"
0-9             \u2460:\u2468       "0" -> "⓪"
A-Z negative    \U1F150:\U1F169     "A" -> "🅐"
a-z negative    \U1F170:\U1F189     "a" -> "🅰"
```
"""
function circled(str;
        negative=false)
    if negative
        asciistr = filter!(c -> haskey(negativecircleddict, c), split(str, ""))
        return join(map(c -> negativecircleddict[c], asciistr))
    else
        asciistr = filter!(c -> haskey(circleddict, c), split(str, ""))
        return join(map(c -> circleddict[c], asciistr))
    end
end

"""
    segmented(str)

Return a version of string `str` with LED-style digits from the Unicode table.
"""
function segmented(str)
    asciistr = filter!(c -> haskey(segmenteddict, c), split(str, ""))
    return join(map(c -> segmenteddict[c], asciistr))
end

end # module
