#! /bin/bash

ARGS=1

if [ $# -ne "$ARGS" ]; then 
  echo ""
  echo "-------------------------------------------"
  echo "Description: Start and Stop the TFTP Server"
  echo "Usage: $0 {start|stop}"
  echo "-------------------------------------------"
  echo ""
  exit 1
fi


# Get command line args
state=%1

# test for start or stop string from command line
case "$1" in
  'start')

    echo "-------------------------------------------"
    echo "Starting TFTP Server..."
    echo "-------------------------------------------"
    sudo -u "$(whoami)" launchctl load -F /System/Library/LaunchDaemons/tftp.plist
    sudo -u "$(whoami)" launchctl start com.apple.tftpd
    netstat -atp UDP | grep tftp
    ;;
  'stop')
    
    echo "-------------------------------------------"
    echo "Stopping TFTP Server..."
    echo "-------------------------------------------"
    sudo -u "$(whoami)" launchctl unload -F /System/Library/LaunchDaemons/tftp.plist
    netstat -atp UDP | grep tftp
    ;;
esac
  

