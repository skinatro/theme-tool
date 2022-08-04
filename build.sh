#!/usr/bin/env sh

####################
#Help and Arguments#
####################

help()
{
    echo ""
    echo "Usage: $0 -p Palette -o Output -s Source"
    printf "\n-p Name of the palette {frappe, mocha, macchiato, latte}"
    printf "\n-o Output Directory"
    printf "\n-s Source file {relative path}"
    exit 1 # Exit script after printing help  
}

while getopts "p:o:s:" opt
do
   case "$opt" in
      p ) PALETTE="$OPTARG" ;;
      o ) OUT="$OPTARG" ;;
      s ) SOURCE="$OPTARG" ;;
      ? ) help ;; # Print help in case parameter is non-existent
   esac
done

# Print help in case parameters are empty
if [ -z "$PALETTE" ] || [ -z "$OUT" ] || [ -z "$SOURCE" ]
then
   echo "Some or all of the parameters are empty";
    help
fi

##############
#Script begin#
##############

#extract file extension
FILE_EXT="${SOURCE##*.}"

#combine everything to get the output path
OUTPUT="${OUT}/${PALETTE}.${FILE_EXT}"
SCRIPT="${PALETTE}.sed"
SAUCE="${OUT}/${SOURCE}"

echo "$SCRIPT"

#does the actual sed-fu 
cat $SAUCE | sed -i -f $SCRIPT > $OUTPUT
#sed -i -f $SCRIPT "$SAUCE" > $OUTPUT