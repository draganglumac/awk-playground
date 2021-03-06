# asm - assembler and interpreter for simple computer
#   usage: awk -f asm.awk program-file data-files...

BEGIN {
  srcfile = ARGV[1]
  ARGV[1] = ""              # remaining files are data
  tempfile = "asm.temp"
  n = split("const get put ld st add sub jpos jz j halt", x)
  for (i = 1; i <= n; i++)  # create table of op codes
    op[x[i]] = i - 1

# ASSEMBLER PASS 1
  FS = "[ \t]+"
  while (getline <srcfile > 0) {
    sub(/#.*/, "")        # strip comments
    symtab[$1] = nextmem  # remember label location
    if ($2 != "") {       # save op, addr if present
      print $2 "\t" $3 >tempfile
      nextmem++
    }
  }
  close(tempfile)

# ASSEMBLER PASS 2
  nextmem = 0
  while (getline <tempfile > 0) {
    if ($2 !~ /^[0-9]+$/)   # if symbolic address
      $2 = symtab[$2]       # replace by numeric value
    mem[nextmem++] = 1000 * op[$1] + $2 # pack into word
  }

# INTERPRETER
  for (pc = 0; pc >= 0; ) {
    addr = mem[pc] % 1000
    code = int(mem[pc++] / 1000)
    if (code == op["get"]) {
      getline acc
      # print "\tget", "\ttacc = ", acc
    }
    else if (code == op["put"]) {
      # print "\tput", "\tacc = ", acc
      print acc
    }
    else if (code == op["st"]) {
      mem[addr] = acc
      # print "\tst", addr, "\tacc = ", acc
    }
    else if (code == op["ld"]) {
      # print "\tld", addr, "\t(" mem[addr] ")"
      acc = mem[addr]
    }
    else if (code == op["add"]) {
      # print "\tadd", addr, "\tacc = ", acc, "+", "(" mem[addr] ")"
      acc += mem[addr]
    }
    else if (code == op["sub"]) {
      # print "\tsub", addr, "\tacc = ", acc, "-", "(" mem[addr] ")"
      acc -= mem[addr]
    }
    else if (code == op["jpos"]) {
      if (acc > 0) {
        # print "\tjpos", addr
        pc = addr
      }
    }
    else if (code == op["jz"]) {
      if (acc == 0) {
        # print "\tjz", addr
        pc = addr
      }
    }
    else if (code == op["j"]) {
      # print "\tj", addr
      pc = addr
    }
    else if (code == op["halt"]) {
      # print "\thalt"
      pc = -1
    }
    else {
      pc = -1
    }
  }
}
