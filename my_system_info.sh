#!/bin/bash

# Get current timestamp for log file
TIMESTAMP=$(date "+%Y%m%d_%H%M%S")
LOG_FILE="system_info_$TIMESTAMP.log"

# 1. Your Name
MY_NAME="Aiman Zafar"  # Replace with your name

# 2. System Name
SYSTEM_NAME=$(hostname)

# 3. CPU Information
CPU_MODEL=$(grep "model name" /proc/cpuinfo | uniq | awk -F: '{print $2}' | xargs)
CPU_COUNT=$(grep -c "processor" /proc/cpuinfo)

# 4. Memory Information
MEMORY_TOTAL=$(grep "MemTotal" /proc/meminfo | awk '{print $2 / 1024 " MB"}')

# 5. OS Information
OS_NAME=$(awk -F= '/^NAME/{print $2}' /etc/os-release | tr -d '"')
OS_VERSION=$(awk -F= '/^VERSION=/{print $2}' /etc/os-release | tr -d '"')

# 6. Storage Information
STORAGE_TOTAL=$(df --total -h | grep "total" | awk '{print $2}')

# 7. Uptime
UPTIME_INFO=$(uptime -p)

# 8. Logged-in Users
LOGGED_IN_USERS=$(who | wc -l)

# 9. Disk Usage (Free space on root partition)
DISK_FREE=$(df -h / | awk 'NR==2 {print $4}')

# 10. Network Information
NETWORK_INFO=$(ip -4 addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -n 1)

# 11. Top 5 CPU-consuming processes
TOP_PROCESSES=$(ps -eo pid,comm,%cpu --sort=-%cpu | head -6)

# Format Output
OUTPUT="
System Information Report
==========================
1. My Name:          $MY_NAME
2. System Name:      $SYSTEM_NAME
3. CPU Info:         $CPU_MODEL
                     Total CPUs: $CPU_COUNT
4. Memory:           $MEMORY_TOTAL
5. OS:               $OS_NAME $OS_VERSION
6. Storage:          $STORAGE_TOTAL
7. Uptime:           $UPTIME_INFO
8. Logged-in Users:  $LOGGED_IN_USERS
9. Disk Usage:       $DISK_FREE free
10. Network:         $NETWORK_INFO
11. Top Processes:
$TOP_PROCESSES
"

# Print and Save Output
echo "$OUTPUT"
echo "$OUTPUT" > "$LOG_FILE"
