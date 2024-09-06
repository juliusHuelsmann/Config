source ~/scripts/scripts/.bose_config
bluetoothctl disconnect $BOSE
bluetoothctl untrust $BOSE
bluetoothctl remove $BOSE
bluetoothctl scan on & sleep 10s
bluetoothctl trust $BOSE
bluetoothctl pair $BOSE
sleep 10s
bluetoothctl connect $BOSE
sleep 5s
killall bluetoothctl
bluetoothctl scan off


