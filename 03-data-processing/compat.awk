# compat.awk - check if AWK program uses new built-in names

BEGIN { asplit("close system atan2 sin cos rand srand match sub gsub", functions)
        asplit("ARGC ARGV FNR RSTART RLENGTH SUBSEP", vars)
        asplit("do delete function return", keys)
      } # we could have used ORed regexes here, i.e. /^(close|system|atan...)$/

      { line = $0 }

/"/   { gsub(/"([^])"|\\")*"/, "", line) }    # strip off strings
/\//  { gsub(/\/([^\/]|\\\/)+\//, "", line) } # strip off regular expressions
/#/   { gsub(/#.*/, "", line) }               # strip off comments

      { n = split(line, x, "[^A-Za-z0-9_]+")  # split into words
        for (i = 1; i <= n; i++) {
          if (x[i] in functions)
            warn(x[i] " is now a built-in function")
          if (x[i] in vars)
            warn(x[i] " is now a built-in variable")
          if (x[i] in keys)
            warn(x[i] " is now a keyword")
      }

function asplit(str, arr) { # split the string into an associative array
  n = split(str, temp)
  for (i = 1; i <= n; i++)
    arr[temp[i]]++
  return n
}

function warn(s) {
  sub(/^[ \t]*/, "")
  printf("file %s, line %d: %s\n\t%s\n", FILENAME, FNR, s, $0)
}
