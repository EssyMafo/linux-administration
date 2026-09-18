#!/bin/bash
if [ "$EUID" -ne 0 ]; then
    echo "Run as root"
    exit 1

fi

echo "Creating Techcorp structure..."

mkdir -p /opt/techcorp/
{projects,scripts,backups,logs,configs}

mkdir -p /opt/techcorp/projects/
{active,archived,templates}

mkdir -p /opt/techcorp/scripts/
{monitoring,backup,deployment}

mkdir -p /opt/techcorp/logs/ 
{app,system,security}

echo "Done"

find /opt/techcorp -type d | sort

