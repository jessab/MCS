sed -i 's/[.]/.\n/g' $1
cat $1 | grep "idpd"  | $2 -I &

sleep 0.5s

# wmctrl -a MyTerminal
# wmctrl -r idpdraw -e 0,0,0,700,900
## IF YOU have wmcrtrl installed, use the above to set your cursor at the correct position