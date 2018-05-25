    { for (i = 1; i <= NF; i++) arry[NR, i] = $i }
END { for (ss in arry) { # we can't use individual subscripts here
        # we must split the index as it's a single string
        split(ss, indices, SUBSEP)
        i = indices[1]
        j = indices[2]
        if ((i,j) in arry) # we can use individual subscripts here
          printf("%d, %d, %s\n", i, j, arry[i,j])
      }
    }
