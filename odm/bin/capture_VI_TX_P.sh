#!/bin/sh

if [ -z $1 ];
then
  echo "ERROR: Duration NOT provided"
  echo "USAGE: $0 [duration_in_seconds]"
  exit 0
fi

# I2S0 to Capture 2 ENABLE
echo "Enabling VI_TX"
tinymix "UL1_CH1 I2SIN0_CH1" 1
tinymix "UL1_CH2 I2SIN0_CH2" 1

# pcm 14 = Capture 2
echo "Capturing VI_TX for $1 sec"
tinycap /sdcard/VI_TX_record.wav -D 0 -d 14 -c 2 -r 48000 -b 32 -T $1

# I2S0 to Capture 2 DISABLE
echo "Disabling VI_TX"
tinymix "UL1_CH1 I2SIN0_CH1" 0
tinymix "UL1_CH2 I2SIN0_CH2" 0