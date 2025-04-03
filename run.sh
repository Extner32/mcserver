#kill all previous screens
pkill screen

#start playit in seperate screen and detach immediately:
screen -dmS playit playit
#wait for playit to start the tunnel
sleep 2

#start minecraft in seperate screen:
screen -S minecraft java -Xms6G -Xmx6G -jar server.jar --nogui
