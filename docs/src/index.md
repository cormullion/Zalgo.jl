# Zalgo

## z͍͌︡͢aͯͥͫ̂l̥̓g︡͛̽̑͢o̰͛̉︠

Zalgo text is digital text that has been modified by the addition of combining characters, Unicode symbols more usually employed to position diacritics above and below glyphs.

"Zalgo" was named for a 2004 Internet meme that ascribed it to the influence of an eldritch deity. There's no official connection with H. P. Lovecraft's Cthulhu.

Use the `zalgo` function to add diacritics to a string. The options let you control how many diacritics are used. For maximum degeneracy, set `maxmarks` to a large number.

```@example
using Zalgo
  zalgo("Julia is cool")
end
```

Results vary considerably from font to font.

## Utilities

Because this package is useless - and occasionally bad, because it can cause some applicatipns to misbehave (it can crash Atom, for example) - this package also provides some conversions.

The following functions convert the input string to equivalent characters that are to be found in the darkest recesses of the Unicode charts. Of course, the characters aren't always available in all fonts.

```@setup e_xample
using Luxor, Zalgo
svg = @drawsvg begin
  fontface("JuliaMono")
  fontsize(10)
  textexamples = [
    :(blackboard("Hello World") ),
    :(boldfraktur("Hello World")),
    :(bolditalic("Hello World")),
    :(bolditalicsans("Hello World")),
    :(boldroman("Hello World")),
    :(boldsans("Hello World")),
    :(boldscript("Hello World")),
    :(fraktur("Hello World")),
    :(italic("Hello World")),
    :(italicsans("Hello World")),
    :(sans("Hello World")),
    :(script("Hello World")),
    :(teletype("Hello World")),
    :(upsidedown("Hello World")),
    :(circled("HELLO WORLD")),
    :(boxed("hello world")),
    :(segmented("0123456789"))
  ]
  t = Table(length(textexamples), 2, 30, 30)
  background("antiquewhite")
  sethue("black")
  for i in t
      fontsize(10)
      leftcolumn = t[t.currentrow, 1]
      text(string(textexamples[t.currentrow]), leftcolumn, halign=:right)
      fontsize(20)
      rightcolumn = t[t.currentrow, 2]

      text(string(Base.eval(Main, textexamples[t.currentrow])), rightcolumn, halign=:left)
  end
end
```

```@example e_xample
using Luxor, Zalgo # hide
svg # hide
```

```@docs
zalgo
boldroman
upsidedown
boldfraktur
Zalgo
boldscript
teletype
blackboard
fraktur
italicsans
italic
boldsans
sans
bolditalicsans
script
bolditalic
boxed
circled
segmented
```
