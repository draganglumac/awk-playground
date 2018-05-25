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
| c | ASCII character |
| d | decimal integer |
| e | [-]d.ddddddE[+-]dd |
| f | [-]ddd.dddddd |
| g | e or f conversion,  whichever is shorter, with nonsignificant zeroes suppressed |
| o | unsigned octal number |
| s | string |
| x | unsigned hexadecimal number |
| % | print a % no argument is consumed |

## Examples

| Format | `$1` | `printf(fmt, $1)` | Comment |
|:-------|:-----|:------------------|:--------|
| %c | 97 | a |
| %d | 97.5 | 97 |
| %5d | 97.5 | &nbsp;&nbsp;&nbsp;97 | field 5 characters wide, right aligned, blank padded |
| %e | 97.5 | 97.500000e+01 |
| %f | 97.5 | 97.500000 |
| %7.2f | 97.5 | &nbsp;&nbsp;97.50 | field 7 characters wide, 2 decimal points, blank padded |
| %g | 97.5 | 97.5 |
| %.6g | 97.5 | 97.5 | number with up to 6 significant digits |
| %o | 97 | 141 |
| %06o | 97 | 000141 | 6 characters wide, 0 padded, octal number |
| %x | 97 | 61 |
| &#124;%s&#124; | January | &#124;January&#124; |
| &#124;%10s&#124;| January | &#124;&nbsp;&nbsp;&nbsp;January&#124; |
| &#124;%-10s&#124;| January | &#124;January&nbsp;&nbsp;&nbsp;&#124; |
| &#124;%.3s&#124; | January | &#124;Jan&#124; |
| &#124;%10.3s&#124; | January | &#124;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Jan&#124; |
| &#124;%-10.3s&#124; | January | &#124;Jan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#124; |
| %% | January | % |
