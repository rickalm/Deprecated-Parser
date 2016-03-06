oldpwd=$PWD
mkdir -p files files/text files/other

cd files/other

wget 'http://textfiles.com/computers/' -O - | tr ' >' '\n\n' | grep -i href | cut -d\" -f2 | while read file; do 
	wget "http://textfiles.com/computers/$file"
done

mv *.txt ../text
cd $oldpwd
