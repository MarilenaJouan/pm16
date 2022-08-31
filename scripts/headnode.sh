#!/bin/bash

node1_txt="/home/node1/test1/test1.txt"
node2_txt="/home/node1/test2/test2.txt"


# Node1
node1_cpu_context_array=()
while IFS=, read -ra arr;
do
  cpu_context_switch=`echo ${arr[0]} | awk -F':' '{print $2}'`
  node1_cpu_context_array+=($cpu_context_switch)
done < $node1_txt

# Node1 mean
node1_total=${#node1_cpu_context_array[@]}
node1_sum=0
for i in "${node1_cpu_context_array[@]}"
do 
   node1_sum=`expr $node1_sum + $i`
done

node1_mean=`expr $node1_sum / $node1_total`


# Node2
node2_cpu_context_array=()
while IFS=, read -ra arr;
do
  cpu_context_switch=`echo ${arr[0]} | awk -F':' '{print $2}'`
  node2_cpu_context_array+=($cpu_context_switch)
done < $node2_txt

# Node2 mean
node2_total=${#node2_cpu_context_array[@]}
node2_sum=0
for i in "${node2_cpu_context_array[@]}"
do 
   node2_sum=`expr $node2_sum + $i`
done

node2_mean=`expr $node2_sum / $node2_total`

# All nodes mean
all_nodes_array+=( "${node2_cpu_context_array[@]}" "${node2_cpu_context_array[@]}" )

all_nodes_total=${#all_nodes_array[@]}
all_nodes_sum=0

for i in "${all_nodes_array[@]}"
do 
   all_nodes_sum=`expr $all_nodes_sum + $i`
done

all_nodes_mean=`expr $all_nodes_sum / $all_nodes_total`

# Delete files
rm $node1_txt
rm $node2_txt

echo "Node1 mean: $node1_mean, Node2 mean: $node2_mean, All nodes mean: $all_nodes_mean"
