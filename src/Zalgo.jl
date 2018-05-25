module Zalgo

export zalgo

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

function adddc(letter, dc)
    return string(letter) * string(dc[rand(1:end)])
end

"""
    zalgo(str::String, upmarks = 1:4, middlemarks = 1:4,
        downmarks = 1:4, maxmarks = 6)

Add diacritic marks to `str`. `maxmarks` sets the maximum number of
diacritic marks to added to each letter. The `upmarks` range sets the
minimum and maximum number of diacritic marks added above the letter.
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
        if VERSION >= v"0.7.0"
            if !all(isletter, letter)
                push!(zalgostring, letter)
                continue
            end
        else
            if !all(isalpha, letter)
                push!(zalgostring, letter)
                continue
            end
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

end # module
