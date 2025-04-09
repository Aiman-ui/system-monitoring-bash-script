# Bash-Based System Monitoring Script

This is a simple and efficient Bash script to monitor key system stats directly from the terminal. No GUI. No bloat. Just fast, readable insights ..and everything gets logged automatically for future reference.

## Features

- CPU model and core count
- Total memory
- Operating system info
- Storage summary
- Network details (IP)
- System uptime and logged-in users
- Top 5 CPU-consuming processes
- Auto-generates a `.log` file with a timestamp

## How to Use

```bash
git clone https://github.com/Aiman-ui/system-monitoring-bash-script.git
cd system-monitoring-bash-script
chmod +x system_info.sh
./system_info.sh

## Output

    You'll see the report in the terminal
    A .log file will be created with full output inside the directory
