# Text Adventure Game in Ocaml

## How to use:
You should use the project with the latest version of the ocaml compiler.
You can optain the latest version of ocaml with the use of the [opam switch command](https://opam.ocaml.org/doc/Usage.html#opam-switch).

You only need jbuilder for this project:
```sh
opam install jbuilder
```

Clone:
```sh
git clone https://github.com/StrykerKKD/text-adventure.git
cd text-adventure
```

Build:
```sh
jbuilder build text_adventure.exe
```

Run:
```sh
./_build/default/text_adventure.exe
```

## Project structure:
* text_adventure.ml: Simple text andventure game implementation