import sys
import os

status = os.popen("playerctl -p spotify status 2> /dev/null").read().lower()[:-1]
LENGTH = 20
output = ' '*(LENGTH//2)
output_cut = ''
play = '契 '
pause = ' '

scroll_file = open("/home/wahid/.config/polybar/scripts/test.txt", "r+")
readIn = scroll_file.readline()
if len(readIn) != 0:
    num = int(readIn)
else:
    num = 0
    scroll_file.write(str(num))
scroll_file.close()

if status in ["playing", "paused"]:
    info = os.popen("playerctl -p spotify metadata 2> /dev/null | grep 'artist\|title' | tr -s ' ' | cut -d' ' -f3- | head -c -1 | sed -z 's/\\n/ - /g' && echo ''").read()[:-1]

    output += info

    if len(output) >= LENGTH:
        num += 1
        if num >= len(output):
            num = 0
        output_cut = output[num:num+LENGTH]
    else:
        num = 0
    scroll_file = open("/home/wahid/.config/polybar/scripts/test.txt", "w")
    scroll_file.write(str(num))
    scroll_file.close()

form = "%%-%ds" % (LENGTH)
if len(output_cut):
    print((play if status == "playing" else (pause if status == "paused" else "")) + form % output_cut)
else:
    print("")
