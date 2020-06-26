import os

status = os.popen("light -G 2> /dev/null").read().lower()[:-1]

print(status.split(".")[0])