source ~/scripts/scripts/.bose_config
bluetoothctl disconnect $BOSE
bluetoothctl untrust $BOSE
bluetoothctl remove $BOSE
bluetoothctl scan on & sleep 30s
bluetoothctl trust $BOSE
bluetoothctl pair $BOSE
sleep 10s
bluetoothctl connect $BOSE
bluetoothctl scan off


