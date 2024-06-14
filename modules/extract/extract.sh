source $stdenv/setup

mkdir $destination
cd $destination

unpackFile $source

chmod 755 $source
