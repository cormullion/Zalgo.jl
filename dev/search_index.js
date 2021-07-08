var documenterSearchIndex = {"docs":
[{"location":"functionindex/#Index","page":"Index","title":"Index","text":"","category":"section"},{"location":"functionindex/","page":"Index","title":"Index","text":"","category":"page"},{"location":"#Zalgo","page":"Introduction","title":"Zalgo","text":"","category":"section"},{"location":"#zalgo","page":"Introduction","title":"z͍͌︡͢aͯͥͫ̂l̥̓g︡͛̽̑͢o̰͛̉︠","text":"","category":"section"},{"location":"","page":"Introduction","title":"Introduction","text":"Zalgo text is digital text that has been modified by the addition of combining characters, Unicode symbols more usually employed to position diacritics above and below glyphs.","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"\"Zalgo\" was named for a 2004 Internet meme that ascribed it to the influence of an eldritch deity. There's no official connection with H. P. Lovecraft's Cthulhu.","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"Use the zalgo function to add diacritics to a string. The options let you control how many diacritics are used. For maximum degeneracy, set maxmarks to a large number.","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"using Zalgo\n  zalgo(\"Julia is cool\")\nend","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"Results vary considerably from font to font.","category":"page"},{"location":"#Utilities","page":"Introduction","title":"Utilities","text":"","category":"section"},{"location":"","page":"Introduction","title":"Introduction","text":"Because this package is useless - and occasionally bad, because it can cause some applicatipns to misbehave (it can crash Atom, for example) - this package also provides some conversions.","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"The following functions convert the input string to equivalent characters that are to be found in the darkest recesses of the Unicode charts. Of course, the characters aren't always available in all fonts.","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"using Luxor, Zalgo\nsvg = @drawsvg begin\n  fontface(\"JuliaMono\")\n  fontsize(10)\n  textexamples = [\n    :(blackboard(\"Hello World\") ),\n    :(boldfraktur(\"Hello World\")),\n    :(bolditalic(\"Hello World\")),\n    :(bolditalicsans(\"Hello World\")),\n    :(boldroman(\"Hello World\")),\n    :(boldsans(\"Hello World\")),\n    :(boldscript(\"Hello World\")),\n    :(fraktur(\"Hello World\")),\n    :(italic(\"Hello World\")),\n    :(italicsans(\"Hello World\")),\n    :(sans(\"Hello World\")),\n    :(script(\"Hello World\")),\n    :(teletype(\"Hello World\")),\n    :(upsidedown(\"Hello World\")),\n    :(circled(\"HELLO WORLD\")),\n    :(boxed(\"hello world\")),\n    :(segmented(\"0123456789\"))\n  ]\n  t = Table(length(textexamples), 2, 30, 30)\n  background(\"antiquewhite\")\n  sethue(\"black\")\n  for i in t\n      fontsize(10)\n      leftcolumn = t[t.currentrow, 1]\n      text(string(textexamples[t.currentrow]), leftcolumn, halign=:right)\n      fontsize(20)\n      rightcolumn = t[t.currentrow, 2]\n\n      text(string(Base.eval(Main, textexamples[t.currentrow])), rightcolumn, halign=:left)\n  end\nend","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"using Luxor, Zalgo # hide\nsvg # hide","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"zalgo\nboldroman\nupsidedown\nboldfraktur\nZalgo\nboldscript\nteletype\nblackboard\nfraktur\nitalicsans\nitalic\nboldsans\nsans\nbolditalicsans\nscript\nbolditalic\nboxed\ncircled\nsegmented","category":"page"},{"location":"#Zalgo.zalgo","page":"Introduction","title":"Zalgo.zalgo","text":"zalgo(str::String, upmarks = 1:4, middlemarks = 1:4,\n    downmarks = 1:4, maxmarks = 6)\n\nRandomly add up to maxmarks diacritic marks to each letter of str. The upmarks, middlemarks, and downmarks ranges determine the minimum and maximum number of diacritic marks added to the letter at that position.\n\n\n\n\n\n","category":"function"},{"location":"#Zalgo.boldroman","page":"Introduction","title":"Zalgo.boldroman","text":"boldroman(str)\n\nReturn a version of string str with boldroman letters from the Unicode table.\n\n\n\n\n\n","category":"function"},{"location":"#Zalgo.upsidedown","page":"Introduction","title":"Zalgo.upsidedown","text":"upsidedown(str)\n\nReturn a version of string str with upside down letters from the Unicode table.\n\n\n\n\n\n","category":"function"},{"location":"#Zalgo.boldfraktur","page":"Introduction","title":"Zalgo.boldfraktur","text":"boldfraktur(str)\n\nReturn a version of string str with boldfraktur letters from the Unicode table.\n\n\n\n\n\n","category":"function"},{"location":"#Zalgo","page":"Introduction","title":"Zalgo","text":"Zalgo.jl does two things.\n\nIt adds pointless diacritics to text: zalgo(\"Cthulhu\")\nIt converts an input ASCII string to equivalent characters found in the darkest recesses of the Unicode charts:\n\nblackboard(\"Hello World\")              # \"ℍ𝕖𝕝𝕝𝕠 𝕎𝕠𝕣𝕝𝕕\"\nboldfraktur(\"Hello World\")             # \"𝕳𝖊𝖑𝖑𝖔 𝖂𝖔𝖗𝖑𝖉\"\nbolditalic(\"Hello World\")              # \"𝑯𝒆𝒍𝒍𝒐 𝑾𝒐𝒓𝒍𝒅\"\nbolditalicsans(\"Hello World\")          # \"𝙃𝙚𝙡𝙡𝙤 𝙒𝙤𝙧𝙡𝙙\"\nboldroman(\"Hello World\")               # \"𝐇𝐞𝐥𝐥𝐨 𝐖𝐨𝐫𝐥𝐝\"\nboldsans(\"Hello World\")                # \"𝗛𝗲𝗹𝗹𝗼 𝗪𝗼𝗿𝗹𝗱\"\nboldscript(\"Hello World\")              # \"𝓗𝓮𝓵𝓵𝓸 𝓦𝓸𝓻𝓵𝓭\"\nfraktur(\"Hello World\")                 # \"ℌ𝖊𝖑𝖑𝖔 𝔚𝖔𝖗𝖑𝖉\"\nitalic(\"Hello World\")                  # \"𝐻𝑒𝑙𝑙𝑜 𝑊𝑜𝑟𝑙𝑑\"\nitalicsans(\"Hello World\")              # \"𝘏𝘦𝘭𝘭𝘰 𝘞𝘰𝘳𝘭𝘥\"\nsans(\"Hello World\")                    # \"𝖧𝖾𝗅𝗅𝗈 𝖶𝗈𝗋𝗅𝖽\"\nscript(\"Hello World\")                  # \"ℋℯ𝓁𝓁ℴ 𝒲ℴ𝓇𝓁𝒹\"\nteletype(\"Hello World\")                # \"𝙷𝚎𝚕𝚕𝚘 𝚆𝚘𝚛𝚕𝚍\"\nupsidedown(\"Hello World\")              # \"Hǝןןo Moɹןp\"\ncircled(\"HELLO WORLD\")                 # \"ⒽⒺⓁⓁⓄ ⓌⓄⓇⓁⒹ\"\nboxed(\"hello world\")                   # \"🅷🅴🅻🅻🅾 🆆🅾🆁🅻🅳\"\nsegmented(\"0123456789\"                 # \"🯰🯱🯲🯰🯱🯲🯰🯱🯲\"\n\n\n\n\n\n","category":"module"},{"location":"#Zalgo.boldscript","page":"Introduction","title":"Zalgo.boldscript","text":"boldscript(str)\n\nReturn a version of string str with boldscript letters from the Unicode table.\n\n\n\n\n\n","category":"function"},{"location":"#Zalgo.teletype","page":"Introduction","title":"Zalgo.teletype","text":"teletype(str)\n\nReturn a version of string str with teletype (monospaced) letters from the Unicode table.\n\n\n\n\n\n","category":"function"},{"location":"#Zalgo.blackboard","page":"Introduction","title":"Zalgo.blackboard","text":"blackboard(str)\n\nReturn a version of string str with blackboard (double-struck) letters from the Unicode table.\n\n\n\n\n\n","category":"function"},{"location":"#Zalgo.fraktur","page":"Introduction","title":"Zalgo.fraktur","text":"fraktur(str)\n\nReturn a version of string str with Fraktur letters from the Unicode table.\n\n\n\n\n\n","category":"function"},{"location":"#Zalgo.italicsans","page":"Introduction","title":"Zalgo.italicsans","text":"italicsans(str)\n\nReturn a version of string str with italic sans serif letters from the Unicode table.\n\n\n\n\n\n","category":"function"},{"location":"#Zalgo.italic","page":"Introduction","title":"Zalgo.italic","text":"italic(str)\n\nReturn a version of string str with italic letters from the Unicode table.\n\n\n\n\n\n","category":"function"},{"location":"#Zalgo.boldsans","page":"Introduction","title":"Zalgo.boldsans","text":"boldsans(str)\n\nReturn a version of string str with bold sans serif letters from the Unicode table.\n\n\n\n\n\n","category":"function"},{"location":"#Zalgo.sans","page":"Introduction","title":"Zalgo.sans","text":"sans(str)\n\nReturn a version of string str with sans serif letters from the Unicode table.\n\n\n\n\n\n","category":"function"},{"location":"#Zalgo.bolditalicsans","page":"Introduction","title":"Zalgo.bolditalicsans","text":"bolditalicsans(str)\n\nReturn a version of string str with bold italic sans serif letters from the Unicode table.\n\n\n\n\n\n","category":"function"},{"location":"#Zalgo.script","page":"Introduction","title":"Zalgo.script","text":"script(str)\n\nReturn a version of string str with script letters from the Unicode table.\n\n\n\n\n\n","category":"function"},{"location":"#Zalgo.bolditalic","page":"Introduction","title":"Zalgo.bolditalic","text":"bolditalic(str)\n\nReturn a version of string str with bolditalic letters from the Unicode table.\n\n\n\n\n\n","category":"function"},{"location":"#Zalgo.boxed","page":"Introduction","title":"Zalgo.boxed","text":"boxed(str)\n\nReturn a version of string str with boxed letters from the Unicode table.\n\nboxed(\"A\") -> \"🄰\"\nboxed(\"a\") -> \"🅰\"\n\n\n\n\n\n","category":"function"},{"location":"#Zalgo.circled","page":"Introduction","title":"Zalgo.circled","text":"circled(str)\n\nReturn a version of string str with circled/boxed letters from the Unicode table.\n\nA-Z             Ⓐ:Ⓩ       \"A\" -> \"Ⓐ\"\na-z             ⓐ:ⓩ       \"a\" -> \"ⓐ\"\n0-9             ①:⑨       \"0\" -> \"⓪\"\nA-Z negative    🅐:🅩     \"A\" -> \"🅐\"\na-z negative    🅰:🆉     \"a\" -> \"🅰\"\n\n\n\n\n\n","category":"function"},{"location":"#Zalgo.segmented","page":"Introduction","title":"Zalgo.segmented","text":"segmented(str)\n\nReturn a version of string str with LED-style digits from the Unicode table.\n\n\n\n\n\n","category":"function"}]
}
