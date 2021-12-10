# undiff.sed
# get rid of '+' or '-' or ' ' in the first column.

s/^[ +-]*//g
#s/^+//g
#s/^-//g

# get rid of numbers in the beginning of a line (occuring
# at least once)
s/^[0-9]+//g

# and lines of the form "@@ ... @@"
s/^@@.*@@$//g


