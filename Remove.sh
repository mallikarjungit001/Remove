#!/bin/bash
echo "Enter the path of 1st folder"
read filePath
echo "Enter the path of 2nd folder"
read filePath2
find $filePath $filePath2 -print | sort | uniq
if [[ -f $filePath && -f $filePath2 ]]
then
 while [ $filePath/*.txt != $filePath2/*.txt ]
 do
   rm -rf $filePath2/*.txt
 done
else
 echo "The File dose not exist or file not exist in that path"
fi

