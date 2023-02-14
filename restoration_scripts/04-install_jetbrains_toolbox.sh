#!/usr/bin/env bash

set -euo pipefail

source "$DOTLY_PATH/scripts/core/_main.sh"

[ "$(id -u)" != "0" ] && exec sudo "$0" "$@"
output::h1 "Installing Jetbrains Toolbox"

function getLatestUrl() {
	USER_AGENT=('User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36')

	URL=$(curl 'https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release' -H 'Origin: https://www.jetbrains.com' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.8' -H "${USER_AGENT[@]}" -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Referer: https://www.jetbrains.com/toolbox/download/' -H 'Connection: keep-alive' -H 'DNT: 1' --compressed | grep -Po '"linux":.*?[^\\]",' | awk -F ':' '{print $3,":"$4}' | sed 's/[", ]//g')

	output::h2 "$URL"
}
getLatestUrl

FILE=$(basename ${URL})
DEST=$PWD/$FILE

output::h2 "Downloading Toolbox files"
wget -cO ${DEST} ${URL} --read-timeout=5 --tries=0
output::h2 "Download complete!"

DIR="/opt/jetbrains-toolbox"
output::h2 "Installing to $DIR"
if mkdir ${DIR}; then
	tar -xzf ${DEST} -C ${DIR} --strip-components=1
fi

chmod -R +rwx ${DIR}

ln -s ${DIR}/jetbrains-toolbox /usr/local/bin/jetbrains-toolbox
chmod -R +rwx /usr/local/bin/jetbrains-toolbox

rm ${DEST}

output::h1 "Jetbrains Toolbox installed"
