# A rough approximiation can be done as a Shell pipeline instead of needing code
#
# Convert all Tabs to spaces
# Lowercase all text
# replace any character that isnt a number or letter to a space
# convert any spaces to a newline (sed doesnt do this well)
# only accept words with more than 3 characters
# sort all of the words into a list
# count the instances of each word
# sort the list descending numerically
# show the first 25 entries
#

cat $@ | \
    tr '\t' ' ' | \
    tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'abcdefghijklmnopqrstuvwxyz' | \
    sed -re 's/[^0-9a-z]/ /g' | \
    tr ' ' '\n' | \
    grep '^...' | \
    sort | \
    uniq -c | \
    sort -nr | \
    head -25
