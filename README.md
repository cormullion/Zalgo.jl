# Zalgo

| **Documentation**                       | **Build Status**                           | **Code Coverage**               |
|:--------------------------------------- |:-------------------------------------------|:-------------------------------:|
| [![][docs-stable-img]][docs-stable-url] | [![Build Status][ci-img]][ci-url]          | [![][codecov-img]][codecov-url] |
| [![][docs-latest-img]][docs-latest-url] | [![][appveyor-img]][appveyor-url]          |                                 |


```julia
using Zalgo
zalgo("Julia approaches")

"J̳̋ͪ︡ų̔l̲̮̲̏̆͋i͖͈̬̭ͭ̄a̬ͯ a̖̖̝ͬͨ͢p̘͓̣̄̕p̯ͥ̍͘r̯ͧ̄o̘̖̮͌̚ã͔̍ͣc̗ͪh̨͗︢e̚s̡̡︡ͮ͐"
```

```julia
zalgo("""
Zalgo is an Internet legend about an ominous entity believed to
cause insanity, death and destruction of the world, similar to the
creature Cthulhu created by H.P. Lovecraft in the 1920s. Zalgo is
often associated with scrambled text on webpages and photos of
people whose eyes and mouth have been covered in black. Or:
Zalgo is something that's coming. It's coming soon.
It has nothing to do with Lovecraft. -
  https://knowyourmeme.com/memes/zalgo""")

Z̯͗ͮ̃ͣa̖ͬl̢͍͐͞g̣͖ͩó͓͚͒̋ į̜͞s̖̽͊︢ͩ ȧ̝̙̜ͦn͖̤̪̅︡̑ I̞̎n̤̅t̬̆ͬ͑ḛ͕͒͋̉ṟͤͮͫn̢̰̎̓ͥe̝̯̹︢͟t͓̹̤̋ lͯe͎ͮͮ̕g̬̝̬̲͑̐e͖̪͌̄n̢̘̭͒︢ḑ̹͓ͬ̎ͯ a̺̅b̽͜͡ō̰͔̻̮ų̘̜͊̑̒t̃ͮ︢͜ a̰̩̤ͯ̆͠n̢͖̽̆̃ͣ o͚̬͔̹ͪ͑m̝̀ͧȋ̱̺̎̌n͔̖͈͋ͥ̂o̱ͯ̒u̬̰̥̲ͥs̘̄̆̕ e̙̘̙͗n̝͋ͮ͢t͍̭͗ị͋͟ț̜͑̒̑͞ÿ̤̟̹̄̓ b̩ͮe̼̹͘l̼̟̯̊ị͖̼ͤ︠e͙͔̅v̡̰̖̍ē̙̙̎d̙̤͌ t̳̥ͧͩͭ̕o̠ͨ
c͖ͪͨ͞a︡̌̕͢ȗ̝̺̐ͥ͘s̩̅e̺̹̱͛ i̧̺̙͔̔͝n̻︠̀͡s̬̝͋̄a̳̘̻̋͞n̟̏͞i̪̲͗ͣͨͯt̨̖̔̊̑͒y̘̌, d̡̩̪̄͜ě̪̫a̱͙̞͛t͍h̭̥̔ â͇̘̙̑͊n̥̽d̯͐̐͡ ḑ̠̍ͨ̄͝ẽ͙̰̉̚s̙̗̏̚t̻͝r̘ͧͤ̇ͧú͉̪͝c͓̜͓͒̎ͩt̺̑ï̳̼ͣo͙̞͖̪︡ṅ̩̦ ȯ̩͎̬̼f̧̹̠͉̈ t̳̫͊̄͠h̳͇̠̋͋͞e̤̟͌ͭ̚ ẇ͔o̠ͨ̆͊r͖̭͕ͨͯ͘l̫ͣ͜d̙͕ͧͭ, s̼̔i͙̱͋m̪̞i̭͇̐͛̔l̲̩̏̋̉͝ä̢͉ͤr̖̦̽ t͕͚ͧo̦͛̑ t̮ͫ̑h̭ͯe͎̦̹͐̎͊
c̨̪ͮ̎̍r̲͑̀̀ȩ̝̰ͥ̎̈ä̹̖t̥︢̽̏͟u̠͋ͨ̕͢r̨̻̟͛e̥̎︠̐̓ C͖͌ͧţ̠̈ͦ̔̕ḫ̱̄ͣ̇͛ù̬ͭ͝l̯̝̟̐̊͟h̦́͢͟ú̪̳̜ c͕r̜̼̄ͦ̕e̡̕ḁ͐t͚̮̣͚̽e̥̊̒ͯd͙̮͎͑ͪ̄ b̭͘y̫̗͉︡͞ H̹̮̍.P̫̤ͧ. L̞̳͓̍ͭo͖͍ͥ︢v̘͉ͫ͞e̳͙͌͟c̠ͭ̌r̫ͭͤa̼̜͑͝f̪̜͛͟ṫ̪̤̪ i̮̼̺ͨ͝n̺̭̆͋͘ t̨̠̫̦̐h͉̗ͭͯĕ͍̼̟̮̀ 1920s̭͐̽︠. Z̟̩̃͜a͇͍ͮ͒l̰̻̜︠͡g̭̮ͧo̹ͬ͞ i̭͗ͣs̬͓̄ͯ̃
ȍ̧̯͐f̹̟̭ͮͦt̗ͯe̡̥͚ͮn̬̼̖ͫ a̺̤̲͑s͓̦ͪs̪̠̯̋o̲̔c̨͉ͨi͇͛͋͊a̤︢ͪ︢t̹̱͑e͙̜̮͑̚ḏ͓̭ͦ͛ w̟̠̋i̭͝t͉̬̝̀͛h͎ͬ͛͊ s̯̻̽ͧ͘c͇̹͠͡͝r̥̝̐͞ą̰︡̑m̤̒͋͘b̫͍̲︠̍ͥl͇͈̻͋͊͝e͈͈̺͗̍d̥̠̅͡ t̲̄ͥ̍͜ȩ̜̇͗x̤͋̋̒̅t̺̩̚ o͉̻ͩͫn̢̠̒͞ w̼̔̈̎ͪe͎̝̗͒̍͠b̰̏͐̚p̖͕̎︢ͨ̋ã̭g͍̲̽̃̕͝e̙͈̐̅͗̚s̜̙̼̫͞͡ ā̰̍͢n͉̯͒͞ḑ̦̤͝ p͖̚h̭̽͠o̺̅ͮ͢t͈︢̅ͫ̕ô̞̳̩s̮ͭ͛ͨ o͖͑̇ͥ͒f̥̓
p̤͗ê̢̝͈͓̊o͓̟︢̅p̩̣̉̄ͧ̓l̮︠︢̔̚e̺̩̞ͣ͐ͤ w̰̺̙ͯ̊h͙ͩ̔o̗̪͚͘s͔̙̯ͨ̽̕ḙ̢̐ͨ̓͠ ě̞ͩÿ̝̌e̗︡s̲̮̽ a̽͟͜n̗̦̏͐d͇̖ͤ̕ m̳̋o͖͍̩͐ͬ͟u̬͕̯͗t̢͕̪͐̉h̜ͧ̂ͫ h̨͒a̡͚͚͌̚v̺̙͝e͍ͧ͘͟ b̰̕e̙̲ͫ︠e̞̖̟̯ͭ͠n̰̂͊͝ c̗ͧo̺͒͒v̲̙̫̋̐e̻̮͐͡r̯͋͒͝e̞ͯ︠͢d͉̺̈ i̗͔︡ͩ͞n̩̟͎͔͛̎ b͓͉̳̩ͣ̑ļ͔̝̘ͫ͋ä̩̍̒ċ͙́̏k͊͟. O̟̯̕r͕̖͙̤ͣ͘:
Ź͖̹ā̖̩͌l̮̝ͨg̹̎͢õ̠̇̊͜ i̫̪͑ͯş͕̀ͦ̚͟ s̮̯ͩ̐͝͡ǫ̩ͬ͒m̳ͥ̊ͪ︡e̙͙͌ͬ͟t̗͖ͦ̑͝ẖ̪͇ͫ̎i̜͈ͣ̋͋͘ṋ͍ͦ̇͊̕g̼ͯ͞ ť͙͒͟h͇͈̐ͤͤ̕a͖͐̽̈̎t̜͇ͩ̒͝'s̘̃︢̄ c̼̖̉͡o̹͕̭͗̌͜m̘͈͚̎̓︡i̥̭ͧ̓͢n͌͗̑ĝ̘ͦ̆. I̗͋̎t̲͛'s̞̙̺͇̈ͧ ċ̘̐̏͟͝o̧͗͋ͤ͞m̝̜͕̫ͧ͞i͍͎̞︡͢n̺ͮg̨̹ͦ s̻̲̋̏ͪő̢̫ͧ̀o̡̒̔͋̽n̪͍̕.
I̜̙̅͡t͔͎͒ h̨̻͑͛a̺͌͊̕s̻̰ͩ̓̇ ň͓ͣ͌o͉t̝̽ͦh̠̦͕ͫͥi͚̕͢͞n̖g͎ ṯ︡̈̈̚o͙̍ d̫ͨ͌ȍ̟͈̂ w̥̬̝︡i̯͒͗t͇̋ḩ̖︢͝ L̤̇ͮǫ̰ͣ̎̑̀v̞͙̚ě̩̃c̢̋r̳︡ͨ̐͒a̰̗̻͙͋ḟ̤̚͡t̻̪̳ͩ. -
  h͉ͩͭ̚t̊ͨ͡t̳ͮp͉͕͇̂̽s̯͕͇̽̎̕://k̝̤͐̇n̦︠̀͞ȏ̻̭͜ẁ̹̥̗̱y͕ͭ͢o̰͚͟͢u̡͙͖ͨȓ͈︡m͎͊︢̓ę͇︡͑ͤͫm̲͔̟ͫe͉͛͌̚.c̺͉͊͋o̝̲̣̽m̳̳ͣͣͩ/ṃ̬̓͡e͎͍̟̪ͨm̝̻̎̏e͒ͯs̟̮̼̒/z͙̦̝ͤ͒̀a̢͙̓͒l̨̰͉̋g͎̀͐̃͘o̺ͫ͐͠

```

"""

Because this is pretty useless, this package provides some other more useful functions for converting text.

[docs-stable-img]: https://img.shields.io/badge/docs-stable%20release-blue.svg
[docs-stable-url]: https://cormullion.github.io/Zalgo.jl/dev/
[docs-latest-img]: https://img.shields.io/badge/docs-current--master-orange.svg
[docs-latest-url]: https://cormullion.github.io/Zalgo.jl/dev/

[travis-img]: https://travis-ci.com/cormullion/Zalgo.jl.svg?branch=master
[travis-url]: https://travis-ci.com/cormullion/Zalgo.jl

[appveyor-img]: https://ci.appveyor.com/api/projects/status/59hherf65c713iaw/branch/master?svg=true
[appveyor-url]: https://ci.appveyor.com/project/cormullion/zalgo-jl

[codecov-img]: https://codecov.io/gh/cormullion/zalgo.jl/branch/master/graph/badge.svg
[codecov-url]: https://codecov.io/gh/cormullion/zalgo.jl

[ci-img]: https://github.com/cormullion/zalgo.jl/workflows/CI/badge.svg
[ci-url]: https://github.com/cormullion/zalgo.jl/actions?query=workflow%3ACI
