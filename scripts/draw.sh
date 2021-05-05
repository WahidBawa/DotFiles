STYLUS_ID=$(xsetwacom --list| grep pad | cut -f 2 | cut -d " " -f 2)
PAD_ID=$(xsetwacom --list| grep pad | cut -f 2 | cut -d " " -f 2)

SCREEN_WIDTH=1920
SCREEN_HEIGHT=1080
TABLET_WIDTH=$(xsetwacom --get "$STYLUS_ID" Area | cut -d " " -f 3)
TABLET_HEIGHT=$(xsetwacom --get "$STYLUS_ID" Area | cut -d " " -f 4)

NEW_TABLET_HEIGHT=$(echo "$SCREEN_HEIGHT * $TABLET_HEIGHT / $SCREEN_WIDTH" | bc)
TABLET_OFFSET_Y=$(echo "$TABLET_OFFSET_Y/2" | bc)

PRIMARY_SCREEN_ID=$(xrandr | grep primary | cut -d " " -f 1)

xsetwacom --set "$STYLUS_ID" ResetArea
xsetwacom --set "$PAD_ID" RawSample 4
xinput map-to-output $STYLUS_ID $PRIMARY_SCREEN_ID
xsetwacom --set $STYLUS_ID Area 0 $TABLET_OFFSET_Y $TABLET_WIDTH $NEW_TABLET_HEIGHT
