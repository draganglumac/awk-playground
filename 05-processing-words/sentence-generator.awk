# sentence-generator
#   random generator of sentences for grammar.dat

BEGIN { # read the grammar rules in
  srand()
  while (getline < ARGV[1] > 0)
    if ($2 == "->") {
      i = ++lhs[$1]             # count left-hand side
      rhscnt[$1, i] = NF-2      # how many in right-hand side
      for (j = 3; j <= NF; j++) # record them
        rhslist[$1, i, j-2] = $j
    }
    else
      print "illegal production: $0"
}

/Sentence/ {
  if ($1 in lhs) { # non-terminal to expand
    gen($1)
    printf("\n")
  }
  else
    print "unknown non-terminal: $0"
}

function gen(sym,   i, j) {
  if (sym in lhs) { # a non-terminal
    i = int(lhs[sym] * rand()) + 1
    for (j = 1; j <= rhscnt[sym, i]; j++) # expand right-hand sides
      gen(rhslist[sym, i, j])
  }
  else
    printf("%s ", sym)
}
