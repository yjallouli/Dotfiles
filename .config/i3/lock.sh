#!/bin/bash

notify-send 'L    O    C    K    I    N    G'

BLURTYPE="0x8"
DISPLAY_RE="([0-9]+)x([0-9]+)\\+([0-9]+)\\+([0-9]+)"
IMAGE_RE="([0-9]+)x([0-9]+)"
FOLDER=`dirname "$BASH_SOURCE"`
LOCK="$FOLDER/lock.png"
PARAMS=""
OUTPUT_IMAGE="/tmp/i3lock.png"

#Take screenshot:
scrot -z $OUTPUT_IMAGE

#Get dimensions of the lock image:
LOCK_IMAGE_INFO=`identify $LOCK`
[[ $LOCK_IMAGE_INFO =~ $IMAGE_RE ]]
IMAGE_WIDTH=${BASH_REMATCH[1]}
IMAGE_HEIGHT=${BASH_REMATCH[2]}

#Execute xrandr to get information about the monitors:
while read LINE
do
  #If we are reading the line that contains the position information:
  if [[ $LINE =~ $DISPLAY_RE ]]; then
    #Extract information and append some parameters to the ones that will be given to ImageMagick:
    WIDTH=${BASH_REMATCH[1]}
    HEIGHT=${BASH_REMATCH[2]}
    X=${BASH_REMATCH[3]}
    Y=${BASH_REMATCH[4]}
    POS_X=$(($X+$WIDTH/2-$IMAGE_WIDTH/2))
    POS_Y=$(($Y+$HEIGHT/2-$IMAGE_HEIGHT/2))

    PARAMS="$PARAMS '$LOCK' '-geometry' '+$POS_X+$POS_Y' '-composite'"
  fi
done <<<"`xrandr`"

#Execute ImageMagick:
PARAMS="'$OUTPUT_IMAGE' '-level' '0%,100%,0.6' '-blur' '$BLURTYPE' $PARAMS '$OUTPUT_IMAGE'"
eval convert $PARAMS


#Lock the screen:
i3lock --insidevercolor=ffffff1c --insidewrongcolor=ffffff1c --insidecolor=0000001c --ringvercolor=ffffff00 --ringwrongcolor=ffffff55 --ringcolor=0000003e --textcolor=00000000 --linecolor=00000000 --keyhlcolor=B58800ff --bshlcolor=4AB7F4ff -i $OUTPUT_IMAGE -t --no-composite

#Remove the generated image:
rm $OUTPUT_IMAGE
