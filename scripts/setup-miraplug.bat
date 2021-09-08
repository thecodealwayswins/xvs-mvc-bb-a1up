adb shell am start -n com.actionsmicro.usbdisplay/com.actionsmicro.usbdisplay.MainActivity
sleep 1
adb shell input keyevent DPAD_DOWN
adb shell input keyevent DPAD_DOWN
adb shell input keyevent DPAD_DOWN
adb shell input keyevent DPAD_DOWN
adb shell input keyevent DPAD_DOWN
adb shell input keyevent DPAD_LEFT
adb shell input keyevent KEYCODE_ENTER
adb shell input tap 1213 287
adb shell input tap 1213 408
adb shell input tap 1213 480
adb shell input tap 1213 600
adb shell input tap 1213 725
adb shell input tap 1213 790
adb shell input keyevent KEYCODE_ESCAPE

sleep 1
adb shell am start -n com.actionsmicro.usbdisplay/com.actionsmicro.usbdisplay.MainActivity
adb shell input keyevent DPAD_DOWN
adb shell input keyevent DPAD_DOWN
adb shell input keyevent DPAD_DOWN
adb shell input keyevent DPAD_DOWN
adb shell input keyevent DPAD_DOWN
adb shell input keyevent DPAD_RIGHT
adb shell input keyevent KEYCODE_ENTER