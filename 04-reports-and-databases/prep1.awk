# prep1 - prepare countries by continent, population density

BEGIN { FS = "\t" }
      { printf("%s:%s:%d:%d:%.1f\n",
               $4, $1, $3, $2, 1000 * $3 / $2) | "sort -t: -k1,1 -k5rn"
      }
