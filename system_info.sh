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

# Format Output
OUTPUT="
System Information Report
==========================
1. My Name:          $MY_NAME
2. System Name:      $SYSTEM_NAME
3. CPU Info	:    $CPU_MODEL
    		      Total CPUs: $CPU_COUNT
4. Memory:           $MEMORY_TOTAL
5. OS:               $OS_NAME $OS_VERSION
6. Storage:          $STORAGE_TOTAL
"

# Print and Save Output
echo "$OUTPUT"
echo "$OUTPUT" > "$LOG_FILE"
