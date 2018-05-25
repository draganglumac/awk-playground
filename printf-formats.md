# AWK `printf` Formats

The format of the `printf` formatting expression is as follows:

  `%[-][0]<width>.<prec><character>`

where

* `-` denotes left-alignment, as by default
 output is right-aligned
* `[0]<width>` pad field to this width as needed, leading 0 pads with zeroes otherwise blanks
* `.<prec>` maxiumum string width, or digits to the right of the decimal point
* `<character>` is one from the first colum of the following table

| Character | Print expression as |
|:-:|:-|
| `c` | ASCII character |
| `d` | decimal integer |
| `e` | [-]d.ddddddE[+-]dd |
| `f` | [-]ddd.dddddd |
| `g` | `e` or `f` conversion,  whichever is shorter, with nonsignificant zeroes suppressed |
| `o` | unsigned octal number |
| `s` | string |
| `x` | unsigned hexadecimal number |
| `%` | print a `%` no argument is consumed |

## Examples

| Format | `$1` | `printf(fmt, $1)` | Comment |
|:-------|:-----|:------------------|:--------|
| `%c` | `97` | `a` ||
| `%d` | `97.5` | `97` ||
| `%5d` | `97.5` | &nbsp;&nbsp;&nbsp;`97` | field 5 characters wide, right aligned, blank padded |
| `%e` | `97.5` | `97.500000e+01` |
| `%f` | `97.5` | `97.500000` |
| `%7.2f` | `97.5` | &nbsp;&nbsp;`97.50` | field 7 characters wide, 2 decimal points, blank padded |
