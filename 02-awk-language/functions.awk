
# local variables are defined at the end of parameter list
# if you use a variable in the function that is not declared it is global
function f(arg1, arg2, lv1, lv2) {
  print arg1, arg2, lv1, lv2
  i_am_global_here += 1
}

    { print max($1, max($2, $3)) } # maximum of the first 3 fields
    { print fact($1), fact($2), fact($3) }

function max(x, y) {
  return x > y ? x : y
}

    { f($1, $2, NR, NF) }
END { print "The value of i_am_global_here is", i_am_global_here }

function fact(n) { # AWK supports recursive functions
  if (n <= 0) return 1
  else return n * fact(n - 1)
}
