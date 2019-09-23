
val=$(xbacklight -ctrl smc::kbd_backlight -get)
newVal=0
if [[ $val -lt 1  ]]; then newVal=1; 
elif [[ $val -lt 10  ]]; then newVal=10; 
elif [[ $val -lt 40  ]]; then newVal=40; 
elif [[ $val -lt 100 ]]; then newVal=100;
else newVal=0
fi
xbacklight -ctrl smc::kbd_backlight -set $newVal



