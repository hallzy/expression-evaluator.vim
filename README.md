# Expression Evaluator

This plugin provides a way to evaluate vim expressions easily from inside of
vim (such as math expressions).

In normal mode, the plugin operates on the current line, but you can also
define your own region by visually selecting a region.

## Installation

Use your favourite Vim plugin manager

### Vim-plug

```vim
Plug 'hallzy/expression-evaluator.vim'
```

## Usage

There is a visual and normal mode mapping you need to provide in your vimrc.

Choose whatever mapping you want. I personally use `<leader>c` and `<leader>C`.

```vim
" Evaluate the current line as an expression and append the answer to the
" expression.
nmap <leader>c <Plug>ExpressionEvaluatorNormal

" Evaluate the current visual selection as an expression and append the answer
" to the expression.
xmap <leader>c <Plug>ExpressionEvaluatorVisual

" Evaluate the current line as an expression and replaces the expression with
" the answer.
nmap <leader>C <Plug>ExpressionEvaluatorAnswerOnlyNormal

" Evaluate the current visual selection as an expression and replaces the
" expression with the answer.
xmap <leader>C <Plug>ExpressionEvaluatorAnswerOnlyVisual
```

### Example

If you have a file like this:

```
5+4*2
```

and your cursor is on that line, if you do the `<leader>c` mapping you will be
left with this:

```
5+4*2=13
```

If you instead use the `<leader>C` mapping you would have:

```
13
```

### Functions That Come With this Plugin

I am open to suggestions for more functions to add.

#### Pi()

This function will return the value of π

```
Pi()=3.141593
```

#### E()

This function will return the value of e

```
E()=2.718282
```

#### Deg()

This function converts radians to degrees

```
Deg(Pi())=180.0
```

#### Rad()

This function converts degrees to radians.

```
Rad(90)=1.570796
```

This works nicely with the built in vim trig functions:

```
sin(Rad(45))=0.707107
```

#### Area_circle()

This function returns the Area of a circle with an input radius:

```
Area_circle(5)=78.539816
```

#### Perim_circle()

This function returns the Perimeter of a circle with an input radius:

```
Perim_circle(5)=31.415927
```
