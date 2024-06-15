source $stdenv/setup

echo "TMPDIR: $TMPDIR"
echo "out: $out"
echo "src: $src"
echo "destination: $destination"
#mkdir -p $out
#cd $out

#unpackFile "$source"

#chmod 755 $out

genericBuild
