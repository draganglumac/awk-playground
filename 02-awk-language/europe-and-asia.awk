# populations of Asia and Europe, to demonstrate the associative arrays of AWK
/Asia/   { pop["Asia"] += $3 }
/Europe/ { pop["Europe"] += $3 }
END      { print "Population of Asia is", pop["Asia"], "millions."
           print "Population of Europe is", pop["Europe"], "millions."
         }
