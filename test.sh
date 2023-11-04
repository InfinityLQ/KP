#!/bin/bash

if [ $# -ne 2 ];then
 echo "Usage: $0 <N> <M>"
 exit 1
fi

N=$1
M=$2

generate_numbers() {
 local count=$1
 local output_file=$2
 for ((i=0; i<count; i++)); do
  echo $((RANDOM % 1000)) >> $output_file
 done
}

total_unique_numbers=0

for ((j=0; j<M; j++));do
 output_file="numbers_$j.txt"
 generte_numbers $N $output_file

 unique_numbers=$(sort -u $output_file | wc -l)

 echo "Iteration $((j+1)):$unique_numbers unique numbers"

 total_unqiue_numbers=$((total_unqiue_numtotalbers + unqiue_numbers))
done
echo "Total unquie numbers: $total_unique_numbers"

