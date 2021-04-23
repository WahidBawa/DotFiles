import sys
import os

status = os.popen("playerctl status 2> /dev/null").read().lower()[:-1]
output = ''
pause = '契 '
play = ' '

file = open("test.txt", "r")
readIn = file.readline()
if len(readIn) != 0:
	num = int(readIn)
else:
	num = 1

file.close()
if status in ["playing", "paused"]:
	title = os.popen("playerctl metadata title 2> /dev/null").read()[:-1]
	artist = os.popen("playerctl metadata artist 2> /dev/null").read()[:-1]
	if len(artist): artist += ' - '

	output += "  " + artist + title
	
	file = open("test.txt", "w+")
	num += (-num if output[num:] == "" else 1)
	file.write(str(num))
	file.close()

print((play if status == "playing" else (pause if status == "paused" else "")) + output[num:])