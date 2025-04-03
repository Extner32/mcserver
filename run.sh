#kill all previous screens
pkill screen

#pull the (new) icon and server properties from github
REPO_OWNER="Extner32"
REPO_NAME="mcserver"
BRANCH="main"

RAW_URL="https://raw.githubusercontent.com/$REPO_OWNER/$REPO_NAME/$BRANCH"

# Download the file, overwriting the existing one
curl -o server-icon.png "$RAW_URL/server-icon.png"
curl -o server.properties "$RAW_URL/server.properties"


#start playit in seperate screen and detach immediately:
screen -dmS playit playit
#wait for playit to start the tunnel
sleep 2

#start minecraft in seperate screen:
screen -S minecraft java -Xms6G -Xmx6G -jar server.jar --nogui
