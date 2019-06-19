# Look for all files named package.json recursively.
# Remove all dev dependencies from these package.json files.
#   i.e. remove text starting from "devDependencies" till "}"
#   so that this complete section is removed from the file.

files=`find ./ -name package.json`
#echo $files;

for f in $files
do
    input="$f"
    output="$f.out.tmp"
    sed '/devDependencies/,/}\,/d' $input > $output
    cp $output $input
    rm -f $output
done

