# awk-playground
AWK playground as I am working through AWK Programming Language book

# Useful One-Liners

From AWK Programming Language book. Some of them are more than one line but still easy enough to type in single quotes, as you can break the single-quoted directives over multiple lines.

1. Print the total number of input lines:
  ```awk
  END { print NR }
  ```

2. Print the tenth input line:
  ```awk
  NR == 10
  ```

3. Print the last field of every input line:
  ```awk
  { print $NF }
  ```

4. Print the last field of the last input line:
  ```awk
      { field = $NF }
  END { print field }
  ```

5. Print every input line with more than four fields:
  ```awk
  NF > 4
  ```

6. Print every input line in which the last field is more than 4:
  ```awk
  $NF > 4
  ```

7. Print the total number of fields in all input lines:
  ```awk
      { nf = nf + NF }
  END { print nf }
  ```

8. Print the total number of lines that contain `Beth`:
  ```awk
  /Beth/ { nlines = nlines + 1 }
  END    { print nlines }
  ```

9. Print the largest first field at the line that contains it (assume some $1 is positive):
  ```awk
  $1 > max { max = $1; maxline = $0 }
  END      { print max, maxline }
  ```

10. Print every line that has at least one field
  ```awk
  NF > 0
  ```

11. Print every line longer than 80 characters
  ```awk
  length($0) > 80
  ```

12. Print the number of fields in every line followed by the line itself
  ```awk
  { print NF, $0 }
  ```

13. Print the first two fields, in opposite order, of every line
  ```awk
  { print $2, $1 }
  ```

14. Exchange the first two fields of every line and then print the line:
  ```awk
  { temp = $1; $1 = $2; $2 = temp; print }
  ```

15. Print every line with the first field replaced by the line number:
  ```awk
  { $1 = NR; print }
  ```

16. Print every line after erasing the second field:
  ```awk
  { $2 = ""; print }
  ```

17. Print in reverse order the fields of every line:
  ```awk
  { for (i = NR; i > 0; i = i - 1)
      printf("%s ", $i)
    printf("\n")
  }
  ```

18. Print the sums of the fields in every line:
  ```awk
  { sum = 0
    for (i = 1; i <= NF; i = i + 1) sum = sum + $i
    print sum
  }
  ```

19. Add up all fields in all lines and print the sum:
  ```awk
      { for (i = 1; i <= NF; i = i + 1) sum = sum + $i }
  END { print sum }
  ```

20. Print every line after replacing each field by its absolute value:
  ```awk
  { for (i = 1; i <= NF; i = i + 1)
      if ($i < 0)
        $i = -$i
    print
  }
  ```
