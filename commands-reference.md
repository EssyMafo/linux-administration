# Linux Commands Reference

This document contains the main Linux commands practiced during the TechCorp Linux Filesystem Lab.


# 1. Navigation Commands

## pwd

Displays the current working directory.

##cd

Changes the current directory.

cd /opt/techcorp


##ls

Lists files and directories.



# 2. Directory Management

##mkdir

Creates a directory.

##mkdir -p

Creates a directory and any required parent directories.

mkdir -p /opt/techcorp/projects/active

##tree

Displays directories and files in a tree structure.

tree /opt/techcorp

# 3. File Management

##touch

Creates an empty file.

##find

Searches for files and directories.


# 4. User Management

##useradd

Creates a user.

useradd -m -s /bin/bash username

-m creates a home directory.

-s specifies the user's login shell.

##groupadd

Creates a group.

groupadd engineering

##usermod

Modifies an existing user.

Add a user to a group without removing existing supplementary groups:

usermod -aG engineering alice

-a means append.

-G specifies supplementary groups.

##id

Displays a user's UID, GID, and group memberships.

id alice
passwd

Changes a user's password.

sudo passwd alice

##chage

Manages password aging.

Set a maximum password age:

sudo chage -M 90 alice

Set a warning period:

sudo chage -W 7 alice

View password aging information:

sudo chage -l alice

#5. Ownership

##chown

Changes file or directory ownership.

sudo chown root:engineering /opt/techcorp/projects/active

chown -R

Changes ownership recursively.

-R means recursive.

# 6. Permissions

##chmod

Changes permissions.

Example:

chmod 750 scripts

Permission numbers:

4 = read
2 = write
1 = execute

Therefore:

7 = read + write + execute
5 = read + execute
0 = no permissions

Means:

Owner  = read/write/execute
Group  = no permissions
Others = no permissions

The leading 2 sets SGID.

2 = SGID
7 = owner permissions
7 = group permissions
0 = others
chmod 1777

The leading 1 sets the sticky bit.

This is commonly used for shared writable directories.

#7. System Information

##uname

Displays system information.

uname -a

##hostname

Displays the system hostname.

hostname

##nproc

Displays the number of available CPU processing units.

nproc
free

Displays memory usage.

free -h

-h means human-readable.

##df

Displays filesystem disk usage.

df -h
du

Displays directory/file space usage.

du -sh /opt/techcorp/*

##uptime

Displays how long the system has been running.

#8. Processes

##ps

Displays running processes.

##ps aux

Sort processes by CPU usage:

ps aux --sort=-%cpu

#9. Logged-in Users

##who

Shows currently logged-in users.

last

Displays previous login sessions.


# 10. Groups

##getent

Retrieves information from system databases.

Example:

getent group engineering

# 11. Bash Scripting

##Shebang

`!/bin/bash`

Tells Linux to use Bash to interpret the script.
