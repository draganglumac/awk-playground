BEGIN { RS = ""
        FS = "\n" # !!! see comments below
      }
$1 ~ /Smith$/ { print $1, $4 }

# !!!
# Newline is always a field separator for multiline records, regardless of the value of FS.
# When RS is set to "", the field separator by default is any sequence of blanks and tabs, or
# a newline. When FS is set to "\n" explicitly, it makes newline the only field separator.
