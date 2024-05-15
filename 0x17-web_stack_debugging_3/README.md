# Web Stack Debugging - Fixing Apache 500 Internal Server Error

In this project, we're focusing on debugging a LAMP (Linux, Apache, MySQL, PHP) stack to fix a 500 Internal Server Error in Apache. The key is using `strace` to identify the problem, then applying Puppet to automate the solution.

This project contains a Puppet manifest that automates the following fixes:
- Ensures Apache is running and enabled to start on boot
- Corrects permissions for the web server's document root
- Checks PHP configuration
- Ensures MySQL is running
- Restarts Apache to apply changes

