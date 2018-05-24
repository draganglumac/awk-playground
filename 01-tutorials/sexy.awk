BEGIN   { print "NAME       RATE  HOURS"; print "" }
        { printf("%-10s£%4.2f %6d\n", $1, $2, $3) }
