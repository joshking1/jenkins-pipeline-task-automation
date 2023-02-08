#!/bin/bash

# Get the number of Jenkins containers
container_count=$(docker ps -f name=jenkins --format "{{.Names}}" | wc -l)
echo "Number of Jenkins containers: $container_count"

# Get the port open on Jenkins container
container_id=$(docker ps -f name=jenkins --format "{{.ID}}")
container_port=$(docker port $container_id | awk -F: '{print $2}')
echo "Jenkins container port: $container_port"

# Get the name of the container
container_name=$(docker ps -f name=jenkins --format "{{.Names}}")
echo "Jenkins container name: $container_name"

# Get the CPU percentage utilization
cpu_utilization=$(top -bn1 | awk '/Cpu\(s\)/ {printf "%0.2f\n", $(NF-2)}')
echo "CPU utilization: $cpu_utilization%"

# Get the memory usage
memory_usage=$(free -m | awk '/Mem:/ {printf "%0.2f\n", $3/$2 * 100.0}')
echo "Memory usage: $memory_usage%"

# Get the number of CPUs
cpu_count=$(nproc)
echo "Number of CPUs: $cpu_count"

# Get the heap size of the Jenkins logs
container_log_size=$(docker logs $container_id | awk '{sum+=$1} END {print sum}')
echo "Jenkins container log heap size: $container_log_size"

# Get the disk usage of the server
disk_usage=$(df -h | awk '/\/$/ {printf "%0.2f\n", $5}')
echo "Disk usage of the server: $disk_usage"
