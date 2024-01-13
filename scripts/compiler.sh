#!/bin/sh

FILE=$(readlink -f "$1")
DIR=${FILE%/*}
BASE="${FILE%.*}"
EXT="${FILE##*.}"

case "$EXT" in
	c) gcc "$FILE" -o "$BASE" && "$BASE" ;;
	# cxx) g++ -std=c++20 -Wall -Wextra -Werror "$FILE" -o "$BASE" && "$BASE" ;;
	cxx) g++ -std=c++20 -Wall -Wextra -Werror -ltbb "$FILE" -o "$BASE" && "$BASE" ;;
	md) pandoc -f markdown "$FILE" --pdf-engine=pdflatex -o "$BASE".pdf ;;
	py) python3 "$FILE" ;;
	tex) xelatex -shell-escape --output-directory="$DIR" "$FILE" ;;
    kt) kotlinc "$FILE" -include-runtime -d "$BASE".jar && java -jar "$BASE".jar ;;
    go) go run "$FILE"
esac
