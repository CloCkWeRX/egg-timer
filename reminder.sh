#!/bin/bash
counter=0
echo -n "How many minutes would you like the timer to run? "
read limit
echo -n "Summary? "
read summary
echo -n "Start message? "
read startmessage
echo -n "Done message? "
read endmessage
notify-send -u critical -i appointment -t 600 "$summary" "$startmessage"
echo
while [ $counter != $limit ]; do
   echo "$counter minutes so far...";
   sleep 60
   let "counter = $counter + 1"
done
if [ $counter = $limit ]; then
   echo
   notify-send -u critical -i appointment "$summary" "$endmessage"
   echo -e '\a' &gt;&amp;2
   exit 0
fi
