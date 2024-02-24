"""
A single "LargeType" glyph, using the system of pieces defined in Unicode version 16.
Each glyph is made up of nine pieces, each in the range U1CE1A to U1CE50.
"""
struct LargeTypeChar
    topleft::Char
    topcenter::Char
    topright::Char
    middleleft::Char
    middlecenter::Char
    middleright::Char
    bottomleft::Char
    bottomcenter::Char
    bottomright::Char
end

"""
a sequence of large type glyphs
"""
struct LargeTypeString
    glyphs::Array{LargeTypeChar,1}
end

"""
make a LargeType glyph from a string
"""
function _buildLargeTypeChar(str)
    return LargeTypeChar([Char(e) for e in str]...)
end

"""
    large_type(str)

Return a string of Unicode glyphs that will display the `str` as "Large Type". Each
glyph is made up to 9 small pieces.

Like the other functions, the current font should have these characters 
(at Unicode points range U+1CE1A to U+1CE50) otherwise you probably won't sequence
anything.
"""
function large_type(str)
    res = LargeTypeString([])
    for ch in filter(isascii, str)
        push!(res.glyphs, LTD[string(ch)])
    end
    return res
end

function Base.show(io::IO, ltc::LargeTypeChar)
    println(io)
    print(io, ltc.topleft)
    print(io, ltc.topcenter)
    print(io, ltc.topright)
    println(io)
    print(io, ltc.middleleft)
    print(io, ltc.middlecenter)
    print(io, ltc.middleright)
    println(io)
    print(io, ltc.bottomleft)
    print(io, ltc.bottomcenter)
    print(io, ltc.bottomright)
    println(io)
end

function Base.show(io::IO, ltcs::LargeTypeString)
    # do all the top row glyphs first
    for i in 1:length(ltcs.glyphs)
        print(io, ltcs.glyphs[i].topleft)
        print(io, ltcs.glyphs[i].topcenter)
        print(io, ltcs.glyphs[i].topright)
    end
    println()
    for i in 1:length(ltcs.glyphs)
        print(io, ltcs.glyphs[i].middleleft)
        print(io, ltcs.glyphs[i].middlecenter)
        print(io, ltcs.glyphs[i].middleright)
    end
    println()
    for i in 1:length(ltcs.glyphs)
        print(io, ltcs.glyphs[i].bottomleft)
        print(io, ltcs.glyphs[i].bottomcenter)
        print(io, ltcs.glyphs[i].bottomright)
    end
    println()
end

LTD = Dict(
" " => _buildLargeTypeChar("         "),
"!" => _buildLargeTypeChar(" 𜸜  𜸩  𜹊 "),
"\"" => _buildLargeTypeChar("𜸜𜸜       "),
"#" => _buildLargeTypeChar("   𜸺𜸺 𜸺𜸺 "),
"\$" => _buildLargeTypeChar("𜸚𜸺𜸤𜸾𜸺𜸤𜸾𜸺𜹃"),
"%" => _buildLargeTypeChar("𜹇 𜹇𜸬𜸴𜸻𜹐 𜹐"),
"&" => _buildLargeTypeChar("𜸚𜸤 𜸮𜹀𜸺𜸾𜸟𜹃"),
"'" => _buildLargeTypeChar(" 𜸜       "),
"(" => _buildLargeTypeChar(" 𜸚𜸥 𜸩  𜸾𜸥"),
")" => _buildLargeTypeChar("𜸞𜸤  𜸩 𜸞𜹃 "),
"*" => _buildLargeTypeChar("   𜸪𜸲𜸸   "),
"+" => _buildLargeTypeChar(" 𜸣 𜸞𜸺𜸥 𜸭 "),
"," => _buildLargeTypeChar("       𜹃 "),
"-" => _buildLargeTypeChar("   𜸞𜸟𜸥   "),
"." => _buildLargeTypeChar("       ▘ "),
"/" => _buildLargeTypeChar(" 𜸣 𜸞𜸟𜸥 𜸭 "),

"0" => _buildLargeTypeChar("𜸚𜸟𜸤𜸩 𜸩𜸾𜸟𜹃"),
"1" => _buildLargeTypeChar(" 𜸦  𜸩  𜸼 "),
"2" => _buildLargeTypeChar("𜸚𜸟𜸤𜸚𜸟𜹃𜸽𜸟𜸥"),
"3" => _buildLargeTypeChar("𜸚𜸟𜸤 𜸟𜸷𜸾𜸟𜹃"),
"4" => _buildLargeTypeChar("𜸜 𜸜𜸽𜸟𜸺  𜸼"),
"5" => _buildLargeTypeChar("𜸛𜸟𜸥𜸽𜸟𜸤𜸾𜸟𜹃"),
"6" => _buildLargeTypeChar("𜸚𜸟𜸤𜸨𜸟𜸤𜸾𜸟𜹃"),
"7" => _buildLargeTypeChar("𜸞𜸟𜸧 𜸵𜸻 𜸼 "),
"8" => _buildLargeTypeChar("𜸚𜸟𜸤𜸮𜸟𜸷𜸾𜸟𜹃"),
"9" => _buildLargeTypeChar("𜸚𜸟𜸤𜸾𜸟𜸶𜸾𜸟𜹃"),
":" => _buildLargeTypeChar("    ▘  ▘ "),
";" => _buildLargeTypeChar("    𜹐  𜹃 "),
"<" => _buildLargeTypeChar(" 𜸬  𜸫    "),
"=" => _buildLargeTypeChar("   𜸞𜸟𜸥𜸞𜸟𜸥"),
">" => _buildLargeTypeChar(" 𜸢  𜸻    "),
"?" => _buildLargeTypeChar("𜸚𜸟𜸤 𜸵𜸻 𜹊 "),

"@" => _buildLargeTypeChar("𜸚𜸟𜸤𜸚𜸧𜸩𜸾𜹀𜹃"),
"A" => _buildLargeTypeChar("𜸚𜸟𜸤𜸨𜸟𜸶𜸼 𜸼"),
"B" => _buildLargeTypeChar("𜸛𜸟𜸤𜸨𜸟𜸷𜸽𜸟𜹃"),
"C" => _buildLargeTypeChar("𜸚𜸟𜸤𜸩  𜸾𜸟𜹃"),
"D" => _buildLargeTypeChar("𜸛𜸟𜸤𜸩 𜸩𜸽𜸟𜹃"),
"E" => _buildLargeTypeChar("𜸛𜸟𜸥𜸨𜸟 𜸽𜸟𜸥"),
"F" => _buildLargeTypeChar("𜸛𜸟𜸥𜸨𜸟 𜸼  "),
"G" => _buildLargeTypeChar("𜸚𜸟𜸤𜸩 𜸧𜸾𜸟𜹃"),
"H" => _buildLargeTypeChar("𜸜 𜸜𜸨𜸟𜸶𜸼 𜸼"),
"I" => _buildLargeTypeChar(" 𜸠  𜸩  𜹀 "),
"J" => _buildLargeTypeChar("  𜸜  𜸩𜸾𜸟𜹃"),
"K" => _buildLargeTypeChar("𜸜 𜸜𜸨𜸯𜸸𜸼 𜸼"),
"L" => _buildLargeTypeChar("𜸜  𜸩  𜸽𜸟𜸥"),
"M" => _buildLargeTypeChar("𜸝𜸡𜸦𜸩𜸰𜸩𜸼 𜸼"),
"N" => _buildLargeTypeChar("𜸝𜸢𜸜𜸩𜸫𜸹𜸼 𜸼"),
"O" => _buildLargeTypeChar("𜸛𜸟𜸧𜸩 𜸩𜸽𜸟𜹄"),

"P" => _buildLargeTypeChar("𜸛𜸟𜸤𜸨𜸟𜹃𜸼  "),
"Q" => _buildLargeTypeChar("𜸚𜸟𜸤𜸩 𜸩𜸾𜸟𜹅"),
"R" => _buildLargeTypeChar("𜸛𜸟𜸤𜸨𜸟𜸷𜸼 𜸼"),
"S" => _buildLargeTypeChar("𜸚𜸟𜸤𜸾𜸟𜸤𜸾𜸟𜹃"),
"T" => _buildLargeTypeChar("𜸞𜸠𜸥 𜸩  𜸼 "),
"U" => _buildLargeTypeChar("𜸜 𜸜𜸩 𜸩𜸾𜸟𜹃"),
"V" => _buildLargeTypeChar("𜸜 𜸜𜸩 𜸩𜸫𜹁𜸻"),
"W" => _buildLargeTypeChar("𜸜 𜸜𜸩𜸱𜸩𜸿𜹂𜹆"),
"X" => _buildLargeTypeChar("𜸜 𜸜𜸪𜸲𜸸𜸼 𜸼"),
"Y" => _buildLargeTypeChar("𜸜 𜸜𜸫𜸳𜸻 𜸼 "),
"Z" => _buildLargeTypeChar("𜸛𜸟𜸧𜸬𜸴𜸻𜸽𜸟𜹄"),
"[" => _buildLargeTypeChar(" 𜸛𜸥 𜸩  𜸽𜸥"),
"\\" => _buildLargeTypeChar("𜸜  𜸫𜸲𜸢  𜸼"),
"]" => _buildLargeTypeChar("𜸞𜸧  𜸩 𜸞𜹄 "),
"^" => _buildLargeTypeChar(" 𜸱  𜹂    "),
"_" => _buildLargeTypeChar("      ▀▀▀"),

"`" => _buildLargeTypeChar(" 𜸤       "),
"a" => _buildLargeTypeChar("   𜸚𜸧 𜸾𜹄 "),
"b" => _buildLargeTypeChar("𜸜  𜸨𜸤 𜸽𜹃 "),
"c" => _buildLargeTypeChar("   𜸚𜸥 𜸾𜸥 "),
"d" => _buildLargeTypeChar(" 𜸜 𜸚𜸶 𜸾𜹄 "),
"e" => _buildLargeTypeChar("   𜸚𜸤 𜸾𜸥 "),
"f" => _buildLargeTypeChar("𜸚𜸤 𜸺  𜸼  "),
"g" => _buildLargeTypeChar("   𜸚𜸧 𜸾𜸶 "),
"h" => _buildLargeTypeChar("𜸜  𜸨𜸤 𜸼𜸼 "),
"i" => _buildLargeTypeChar(" 𜸣  𜸜  𜸼 "),
"j" => _buildLargeTypeChar(" 𜸣  𜸜 𜸾𜹃 "),
"k" => _buildLargeTypeChar("𜸜  𜸨𜸷 𜸼𜸼 "),
"l" => _buildLargeTypeChar(" 𜸜  𜸩  𜸼 "),
"m" => _buildLargeTypeChar("   𜸝𜸦 𜸼𜸼 "),
"n" => _buildLargeTypeChar("   𜸛𜸤 𜸼𜸼 "),
"o" => _buildLargeTypeChar("   𜸚𜸤 𜸾𜹃 "),

"p" => _buildLargeTypeChar("   𜸛𜸤 𜸨𜹃 "),
"q" => _buildLargeTypeChar("   𜸚𜸧 𜸾𜸶 "),
"r" => _buildLargeTypeChar("   𜸚𜸥 𜸼  "),
"s" => _buildLargeTypeChar("   𜸚𜸥 𜸞𜹃 "),
"t" => _buildLargeTypeChar("𜸣  𜸺  𜸾𜹃 "),
"u" => _buildLargeTypeChar("   𜸜𜸜 𜸽𜹄 "),
"v" => _buildLargeTypeChar("   𜸜𜸜 𜸾𜹃 "),
"w" => _buildLargeTypeChar("   𜸜𜸜 𜸿𜹆 "),
"x" => _buildLargeTypeChar("   𜸮𜸷 𜸼𜸼 "),
"y" => _buildLargeTypeChar("   𜸜𜸜 𜸾𜸶 "),
"z" => _buildLargeTypeChar("   𜸞𜸧 𜸽𜸥 "),
"{" => _buildLargeTypeChar(" 𜸚𜸥 𜸷  𜸾𜸥"),
"|" => _buildLargeTypeChar(" 𜹈     𜹌 "),
"}" => _buildLargeTypeChar("𜸞𜸤  𜸮 𜸞𜹃 "),
"~" => _buildLargeTypeChar("   𜸚𜸟𜹃   "),
#"" => _buildLargeTypeChar("▚▚▚▚▚▚▚▚▚"), # not sure
)

