# Linux Filesystem Lab

#Environment
OS: CentOS Stream 9
Shell: Bash
Virtualization: VMware Workstation

## Overview

This project simulates a real-world first-week task for a junior Linux administrator at a fictional company called TechCorp.

The project demonstrates practical Linux administration skills including filesystem management, user and group administration, permissions, Bash scripting, and basic system monitoring.



## Real-World Scenario

I joined TechCorp as a junior Linux administrator.

My first tasks were to:

- Create the company's standard directory structure
- Create department groups and users
- Configure appropriate permissions
- Create a service account
- Develop a system reporting script
- Document the commands and administrative decisions
- Verify the configuration using Linux commands



## Project Structure

linux-filesystem-lab
├── notes
│   └── commands-reference.md
├── README.md
├── screenshots
│   ├── directory-structure.png
│   ├── password-aging.png
│   ├── permissions-verification.png
│   ├── project-tree.png
│   ├── system-report-output.png
│   └── user-verification.png
└── scripts
    ├── 01-company-setup.sh
    ├── 02-user-setup.sh
    ├── 03-permissions-setup.sh
    └── 04-system-report.sh


`Tasks Completed`
# 1. Company Directory Structure

Created the following structure under:

/opt/techcorp

The structure includes:

projects
scripts
backups
logs
configs

Additional subdirectories were created for projects, scripts, and logs.

# 2. User and Group Administration

Created the following department groups:

engineering
marketing
finance

Created the following users:

alice
bob
carol
dave

Created a service account:

techapp

The service account uses a non-login shell.

# 3. Permissions and Ownership

Configured Linux ownership and permissions for important TechCorp directories.

Examples include:

SGID on shared directories
Sticky bit on the system logs directory
Restricted permissions on sensitive configuration files
Group ownership for departmental directories

# 4. System Report

Created a Bash script that generates a system report containing information such as:

Operating system
Kernel
Hostname
CPU information
Memory usage
Disk usage
Company users and groups
Logged-in users
Recent logins
System uptime
CPU-intensive processes
Recent system errors

The report is saved under:

`/opt/techcorp/logs/system/`

##Skills Demonstrated
Linux Filesystem
mkdir
mkdir -p
find
ls
tree
pwd
touch
File and directory organization
User Management
useradd
groupadd
usermod
passwd
chage
id
getent

##Permissions
chmod
chown
Numeric permissions
SGID
Sticky bit
Ownership and groups
Permission verification

##Bash Scripting
Shebang
Variables
$EUID
if statements
Functions
local variables
Arguments
Loops
Command substitution
Exit codes
echo
tee

##System Administration
uname
hostname
nproc
free
df
du
ps
uptime
who
last
journalctl

##Scripts
`Script                  	Purpose`
01-company-setup.sh  	Creates the TechCorp directory structure
02-user-setup.sh	    Creates users, groups, and the service account
03-permissions-setup.sh	Configures ownership and permissions
04-system-report.sh	    Generates a system health report
