#!/bin/bash

echo "Enter path of floder"
read path
echo $path
if [ -f $path ]
then
 sudo -i l-lrt $path
esle
echo "not found"
fi
