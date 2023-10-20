#!/usr/bin/env bash

function write_image() {
	NAME=$(basename $1 .svg)
	URL="/$1"

	echo "<td align=\"center\">"
	echo "<img src=\"${URL}\" alt=\"${NAME}\" width=\"50\">"
	echo "<br/>"
	echo "<a href=\"${URL}\">${NAME}</a>"
	echo "</td>"
}

echo "<table>"

while IFS= read -r image1; do
	IFS= read -r image2
	IFS= read -r image3
	IFS= read -r image4
	IFS= read -r image5

	echo "<tr>"

	[[ -n $image1 ]] && write_image ${image1}
	[[ -n $image2 ]] && write_image ${image2}
	[[ -n $image3 ]] && write_image ${image3}
	[[ -n $image4 ]] && write_image ${image4}
	[[ -n $image5 ]] && write_image ${image5}

	echo "</tr>"
done < <(ls *.svg | sort -f)

echo "</table>"
