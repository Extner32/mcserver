#!/bin/bash

#set cwd
cd /home/local/mcserver || exit 1

#kill all previous tmux sessions
tmux kill-session -t minecraft
tmux kill-session -t playit

#pull the (new) icon and server properties from github and overwrite the existing files

curl -o server-icon.png "https://raw.githubusercontent.com/Extner32/mcserver/main/server-icon.png"
curl -o server.properties "https://raw.githubusercontent.com/Extner32/mcserver/main/server.properties"

#start playit in seperate tmux session (for bedrock) and detach immediately:
tmux new-session -d -s playit "playit"
#wait for playit to start the tunnel
sleep 2

#start minecraft in seperate tmux session:
#-XX:+UseG1GC sets the garbage collector to have minimal delays with large heap sizes

tmux new-session -s minecraft "java -server -XX:+UseG1GC -Xms1G -Xmx6G -jar purpur.jar --nogui --port 8001"
