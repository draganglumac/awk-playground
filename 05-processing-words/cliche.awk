# cliche - cliche generator from random parts of phrases in phrases.dat

BEGIN { FS = ":" }
      { x[NR] = $1
        y[NR] = $2
      }
END   { for (;;) # infinite loop
          print x[randint(NR)], y[randint(NR)]
      }

function randint(n) {
  return int(n * rand()) + 1
}
