#! /bin/sh

# Choose the level that suits you, more information found here:
# https://github.com/stamparm/ipsum
# https://github.com/stamparm/ipsum/tree/master/levels
LEVEL=2

# These are the default values, only adjust if it's different for your system
IPLIST_URL="https://raw.githubusercontent.com/stamparm/ipsum/master/levels/${LEVEL}.txt"
#IPLIST_URL="https://iplists.firehol.org/files/firehol_level1.netset"
INSTALL_DIR="/opt/dnscrypt-proxy"
IP_FILE="ip-blacklist.txt"

FILE="${INSTALL_DIR}/${IP_FILE}"

if [ "$(whoami)" != "root" ]; then
        echo "Script doesn't have permission. Run with sudo or as root, please."
else
        if curl -L --output /dev/null --silent --head --fail "$IPLIST_URL"; then
                if [ -f "$FILE" ]; then
                        mv -f "${FILE}" "${FILE}.old"
                fi

                if curl -L "$IPLIST_URL" --output "$FILE" --silent; then
                        rm -f "${FILE}.old"
                        echo "IP blacklist updated."
                        cd "$INSTALL_DIR"
                        ./dnscrypt-proxy -service restart
                        ./dnscrypt-proxy -service start
                else
                        if [ -f "${FILE}.old" ]; then
                                mv -f "${FILE}.old" "${FILE}"
                        fi
                        echo "Failed to update file, possibly due to internet connection."
                        echo "Any changes made by script have been reverted."
                fi
        else
                echo "Unable to grab file from Github. Is your internet connection working?"
        fi
fi
