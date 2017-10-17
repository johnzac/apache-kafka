#!/bin/bash
count=0
while true
do
val=`curl consumer:5000 || true`
if [[ `echo $val | grep "test"` ]]
then
echo "test Passed"
exit 0
fi
count=$(( $count + 1 ))
if [[ $count -gt 10 ]]
then
echo "test failed"
exit 1
fi
sleep 5
done
