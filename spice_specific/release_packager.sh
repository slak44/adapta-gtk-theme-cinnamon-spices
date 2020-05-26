#!/bin/bash
#Description: A script to move adpata theme files to appropriate git directories to be pushed.
echo "";
read -p "Press enter to start the script.";
SPICEDIR="$HOME/Github/other_projects/cinnamon-spices-themes";
SOURCEDIR="$HOME/.themes";
THEMES=("Adapta" "Adapta-Nokto");
for THEMENAME in "${THEMES[@]}"
do
    echo "Copying $SOURCEDIR/$THEMENAME to $SPICEDIR/$THEMENAME/files/$THEMENAME";
    rm -r "$SPICEDIR/$THEMENAME/files/$THEMENAME"
    rsync -a --exclude 'metadata.json' "$SOURCEDIR/$THEMENAME"/ "$SPICEDIR/$THEMENAME/files/$THEMENAME";
    echo "Copying info.json, LICENSE and README.md from $SOURCEDIR/$THEMENAME to $SPICEDIR/$THEMENAME";
    rsync -a  --include 'info.json' --include 'README.md' --include 'COPYING' --include 'LICENSE_CC_BY_SA4' --exclude '*' "$SOURCEDIR/$THEMENAME"/ "$SPICEDIR/$THEMENAME";
done
echo "";
read -p "Press enter to exit the script.";
cd;
exit

