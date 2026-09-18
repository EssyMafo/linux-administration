#!/bin/bash

# ======================================
# 04-system-report.sh
# Generates TechCorp system report
#Author : Essy Mafo Franche
# ======================================

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

REPORT="/opt/techcorp/logs/system/report_$(date +%Y%m%d_%H%M%S).txt"

mkdir -p /opt/techcorp/logs/system

generate_report() {

echo "============================================"
echo "        TECHCORP SYSTEM REPORT"
echo "============================================"
echo "Generated: $(date)"
echo "Hostname : $(hostname)"
echo "Admin    : $(whoami)"
echo ""

echo "========== OPERATING SYSTEM =========="
cat /etc/os-release | grep -E "^NAME=|^VERSION="
echo ""

echo "========== KERNEL =========="
uname -r
echo ""

echo "========== CPU =========="
echo "CPU Cores: $(nproc)"
grep "model name" /proc/cpuinfo | head -1 | cut -d: -f2
echo ""

echo "========== MEMORY =========="
free -h
echo ""

echo "========== DISK USAGE =========="
df -h
echo ""

echo "========== TECHCORP DIRECTORY SIZE =========="
du -sh /opt/techcorp/*
echo ""

echo "========== ENGINEERING GROUP =========="
getent group engineering
echo ""

echo "========== MARKETING GROUP =========="
getent group marketing
echo ""

echo "========== FINANCE GROUP =========="
getent group finance
echo ""

echo "========== LOGGED-IN USERS =========="
who
echo ""

echo "========== RECENT LOGINS =========="
last | head -10
echo ""

echo "========== SYSTEM UPTIME =========="
uptime
echo ""

echo "========== TOP 5 CPU PROCESSES =========="
ps aux --sort=-%cpu | head -6
echo ""

echo "========== RECENT SYSTEM ERRORS =========="
journalctl -p err --since "24 hours ago" --no-pager | tail -10

echo ""
echo "============================================"
echo "           END OF REPORT"
echo "============================================"

}

generate_report | tee "$REPORT"

echo ""
echo "Report saved to:"
echo "$REPORT"
