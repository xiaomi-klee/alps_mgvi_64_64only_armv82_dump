name="aw882xx"
function get_smartpa_type
{
    echo "get smartpa type"
    name=$(getprop "persist.vendor.audio.pa.smartpa_type")
    echo $name

}


get_smartpa_type
if [ "$name" == "fs19xx" ]; then
   echo "smartpa_type is fs19xx,run fs19xx test"

   AudioPA_speaker_amp=$(cat /d/asoc/components | egrep frsm)
   echo $AudioPA_speaker_amp

   if [[ "$AudioPA_speaker_amp" == *"frsm_i2c-1"* ]] && [[ "$AudioPA_speaker_amp" == *"frsm_i2c-2"* ]]; then
      echo "success"
   else
      echo "fail"
   fi
else
   echo "smartpa_type is aw882xx,run aw882xx test"

   AudioPA_speaker_amp=$(cat /d/asoc/components | egrep speaker_amp)
   echo $AudioPA_speaker_amp

   if [[ "$AudioPA_speaker_amp" == *"speaker_amp.6-0035"* ]] && [[ "$AudioPA_speaker_amp" == *"speaker_amp.6-0034"* ]]; then
      echo "success"
   else
      echo "fail"
   fi
fi
