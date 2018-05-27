BEGIN { RS = ""       # empty string denotes blank line as a separator
        ORS = "\n\n"  # blank line output separator, otherwise records are hard to distinguish
      }
/New York/ # print only records from New York
