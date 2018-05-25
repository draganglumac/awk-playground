BEGIN { FS = "\t" }
      { pop[$4] += $3 }
END   { for (name in pop)
          print "Population in", name, "is", pop[name], "millions."
      }
