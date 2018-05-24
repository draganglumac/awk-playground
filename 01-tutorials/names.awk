BEGIN { names = "names:" }
      { names = names " " $1 }
END   { print names }
