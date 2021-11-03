#!/bin/bash
echo "Enter the path of 1st folder"
read filePath
echo "Enter the path of 2nd folder"
read filePath2

file1=$(find $filePath)
file2=$(find $filePath2)
echo $file1
echo $file2
file=$(diff $filePath $filePath2)
#echo $file

 if [[ $file1 != $file2 ]]
   then
       rm -ir $file2
 else
    echo "The File dose not exist or file not exist in that path"
 fi
