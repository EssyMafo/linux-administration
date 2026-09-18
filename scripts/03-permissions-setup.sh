#!/bin/bash

# ======================================
# TechCorp Permissions Setup
# Author : Essy Mafo Franche
# ======================================

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

echo "======================================"
echo " TechCorp Permissions Setup"
echo "======================================"

# Check that the TechCorp directory exists
if [ ! -d /opt/techcorp ]; then
    echo "Error: /opt/techcorp does not exist."
    echo "Run 01-company-setup.sh first."
    exit 1
fi

echo ""
echo "[*] Setting ownership..."

# Set ownership
chown root:engineering /opt/techcorp/projects/active
chown root:marketing /opt/techcorp/logs/app
chown root:root /opt/techcorp/configs
chown -R root:engineering /opt/techcorp/scripts

echo "[OK] Ownership configured."

echo ""
echo "[*] Setting permissions..."

# Engineering shared directory
chmod 2770 /opt/techcorp/projects/active

# Marketing shared directory
chmod 2770 /opt/techcorp/logs/app

# Sensitive configuration directory
chmod 700 /opt/techcorp/configs

# Shared scripts
chmod 750 /opt/techcorp/scripts

# Sticky bit for system logs
chmod 1777 /opt/techcorp/logs/system

echo "[OK] Permissions configured."

echo ""
echo "========== VERIFICATION =========="

echo ""
echo "Projects:"
ls -ld /opt/techcorp/projects/active

echo ""
echo "Application Logs:"
ls -ld /opt/techcorp/logs/app

echo ""
echo "System Logs:"
ls -ld /opt/techcorp/logs/system

echo ""
echo "Configs:"
ls -ld /opt/techcorp/configs

echo ""
echo "Scripts:"
ls -ld /opt/techcorp/scripts

echo ""
echo "======================================"
echo " Permissions setup completed."
echo "======================================"
