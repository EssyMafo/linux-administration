#!/bin/bash

# Creates TechCorp users and groups

# Check root permission
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi


echo "================================"
echo " TechCorp User Setup"
echo "================================"


echo "[*] Creating groups..."

groupadd -f engineering
groupadd -f marketing
groupadd -f finance


echo "[OK] Groups created"


echo ""
echo "[*] Creating users..."


# Create Alice
if id alice &>/dev/null; then
    echo "alice already exists"
else
    useradd -m -s /bin/bash -G engineering alice
    echo "Created alice"
fi


# Create Bob
if id bob &>/dev/null; then
    echo "bob already exists"
else
    useradd -m -s /bin/bash -G engineering bob
    echo "Created bob"
fi


# Create Carol
if id carol &>/dev/null; then
    echo "carol already exists"
else
    useradd -m -s /bin/bash -G marketing carol
    echo "Created carol"
fi


# Create Dave
if id dave &>/dev/null; then
    echo "dave already exists"
else
useradd -m -s /bin/bash -G finance dave
    echo "Created dave"
fi


# Create service account

if id techapp &>/dev/null; then
    echo "techapp already exists"
else
    useradd -r -s /usr/sbin/nologin techapp
    echo "Created service account techapp"
fi


echo ""
echo "[*] User verification"

id alice
id bob
id carol
id dave
id techapp


echo ""
echo "================================"
echo " Done"
echo "================================"
