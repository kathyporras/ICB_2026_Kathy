#!/bin/bash

#script to save all the ID's and number of samples per ID in a new document

cut -f1 "$1" | tail -n +2 | sort -n | uniq -c > tmp
echo -e "maleID\tNum_samples" > Num_samples.csv
while read count id
do
    echo -e "$id\t$count" >> Num_samples.csv
done < tmp
rm tmp
