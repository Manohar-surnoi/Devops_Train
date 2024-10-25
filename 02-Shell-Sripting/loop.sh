#!/bin/bash

a=0
while [ $a -le 10 ]

do 
    echo "$a"
    a=`expr $a + 2`
done

# The while loop enables us to execute a set of commands repeatedly while some condition occurs


for var in 0 1 2 3 4 5
do 
 echo $var
done 

# The for loop operates on list of items. It repeats a set of commands for evry item in the list

a=0
until [ ! $a -lt 11 ]
do 
   echo $a
   a=`expr $a + 5`
done

# Until loop operates set of commands repeatedly until condition true

