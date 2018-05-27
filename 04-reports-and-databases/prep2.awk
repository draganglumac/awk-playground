# prep2 - prepare countries by continent, inverse population density
#   this avoids arguments to sort and prepares data to be sorted
#   lexicographically, continent (-k1,1) and inverse density (-k2,2)

BEGIN { FS = "\t" }
      { den = 1000 * $3 / $2
        printf("%-15s:%12.8f:%s:%d:%d:%.1f\n",
               $4, 1 / den, $1, $3, $2, den) | "sort"
      }
