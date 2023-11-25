#!/usr/bin/env bash

function write_image() {
	if [[ -n $1 ]]; then

		NAME=$(basename $1 .svg)
		URL="/$1"


		cat <<- EOF
			<td align="center">
			<img src="${URL}" alt="${NAME}" width="50">
			<br/>
			<a href="${URL}">${NAME}</a>
			</td>
		EOF
	fi
}

cat << EOF
# keepass-icons
Repository of KeepassXC icons in SVG format
EOF

echo ""

echo "<table>"

while IFS= read -r image1; do
	IFS= read -r image2
	IFS= read -r image3
	IFS= read -r image4
	IFS= read -r image5

	cat <<- EOF
		<tr>
			$(write_image $image1)
			$(write_image $image2)
			$(write_image $image3)
			$(write_image $image4)
			$(write_image $image5)
		</tr>

	EOF

done < <(ls icons/*.svg | sort -f)

echo "</table>"
