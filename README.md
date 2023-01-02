# What is buine?

`buine` ("binary" + "quine", read as "bwine") is a project I 
decided to start as a challenge on taking handwritten machine 
code to an absurdly pointless level. It serves to help me 
improve my understanding of how our daily devices work and 
how they do what they do.

# How can it help others?

I find understanding binary (seemingly arbitrary) data absolutely
fascinating and I'm sure there are people who would also be interested
in understanding things such as the ELF format more.

The goal of `buine` is to not-only output its original machine code, 
but to also output the comments written within; these comments aim to
explain each byte, so that anyone looking into the file can understand
what the meaning of each byte is.

# Syntax

Despite the `.hex` extension, this file does not follow the Intel Hex
syntax.

* A comment is denoted by a `#`, the Makefile removes all comments before
converting the hexadecimal characters to binary, though the file still outputs
these comments, as I wanted it to be part of the challenge.
* `##` is what I used to denote a "temporary" comment, in other words a comment
which is not intended to be present in the final version of `buine` and therefore
comments that won't be _quined_. Once the project is in its final stage, these
"temporary" comments shouldn't be present, although venturing into older commits,
you may stumble upon a few.
* Everything else in the file (before comment characters) should be a two character
hexadecimal value (decoded to a single byte).

# References and other cool binary stuff!

I can't stress how many times I referenced 
[coder32](http://ref.x86asm.net/coder32.html) as well as
[coder64](http://ref.x86asm.net/coder64.html). This is a wonderful resource
for looking up x86 and x86\_64 opcodes.

The same praise applies to [Félix Cloutier's website](https://www.felixcloutier.com/x86/)
as this bundles opcodes by mnemonic, therefore I could look for the many variations
of a specific instruction really fast.

I further highly recommend checking out the 
[pics](https://github.com/corkami/pics)
repository by [corkami](https://github.com/corkami), it is highly useful
for understanding a slew of binary formats and is definitely a good starting
point to seeing simple small examples of how the data may be organised.
