oldpwd=$PWD
mkdir -p files files/text files/other

cd files/other

wget 'http://textfiles.com/computers/' -O - | tr ' >' '\n\n' | grep -i href | cut -d\" -f2 | while read file; do 
	/bin/false && wget "http://textfiles.com/computers/$file"
done

cat * | tr '\t' ' ' | \
    tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'abcdefghijklmnopqrstuvwxyz' | \
    sed -r \
	-e 's/[^A-Za-z]/ /g' \
	-e 's/(^[^ ] | [^ ]$| [^ ] )/ /g' \
	-e 's/ +/ /g' | \
    tr ' ' '\n' | \
    grep -v '^ *$' | \
    sort | \
    uniq -c | \
    sort -nr | \
    head -25

mv *.txt ../text
cd $oldpwd
