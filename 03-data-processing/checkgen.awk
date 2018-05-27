# checkgen
#   generator of data validation AWK script, e.g. of the format in /etc/passwd
#
#   $> awk -f checkgen.awk NF != 7 <tab> does not have 7 fields
#   $> awk -f checkgen.awk $1 ~ /[^A-Za-z0-9] <tab> "non-alphanumeric user id"
#   $> awk -f checkgen.awk $2 != "" <tab> no password
BEGIN { FS = "\t+" }
      { printf("%s {\n\tprintf(\"line %%d, %s: %%s\\n\", NR, $0) }\n", $1, $2) }

# example of generated AWK script for the above runs:
#
# NF != 7 {
# 	printf("line %d, does not have 7 fields: %s\n", NR, $0) }
# $1 ~ /[^A-Za-z0-9]/ {
# 	printf("line %d, non-alphanumeric user id: %s\n", NR, $0) }
# $2 == "" {
# 	printf("line %d, no password: %s\n", NR, $0) }
