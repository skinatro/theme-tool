#!/usr/bin/env sh

####################
#Help and Arguments#
####################

help()
{
    echo ""
    echo "Usage: $0 -o Output -s Source"
    printf "\n-o Output Directory"
    printf "\n-s Source file"
    exit 1 # Exit script after printing help  
}

while getopts "o:s:" opt
do
   case "$opt" in
      o ) OUT="$OPTARG" ;;
      s ) SOURCE="$OPTARG" ;;
      ? ) help ;; # Print help in case parameter is non-existent
   esac
done

# Print help in case parameters are empty
if [ -z "$OUT" ] || [ -z "$SOURCE" ]
then
   echo "Some or all of the parameters are empty";
    help
fi

##############
#Script begin#
##############

#extract file extension
FILE_EXT="${SOURCE##*.}"

#function defined to build the file
build(){
#combine everything to get the output path
OUTPUT="${OUT}/${PALETTE}.${FILE_EXT}"
SCRIPT="${PALETTE}.sed"

#does the actual sed-fu 
< "$SOURCE" sed -f "$SCRIPT" > "$OUTPUT"
}

#no arrays due to posix compliancy
PALETTE=frappe
build
PALETTE=mocha
build
PALETTE=macchiato
build
PALETTE=latte
build