#!/bin/bash

echo "Enter the file path"
read file
if [ -f $file ]
then 
 rm -rf $file
else
 echo $file "not found"
fi
