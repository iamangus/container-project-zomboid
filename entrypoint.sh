# steamcmd installs pz into ~/Zomboid/pzserver. 
# Running pz from ~/Zomboid/pzserver populates ~/Zomboid with the world and save files. 
# I mount ~/Zomboid to a pvc to persist both the steam server files as well as the world and save files.
mkdir -p ~/Zomboid/pzserver

steamcmd +force_install_dir ~/Zomboid/pzserver +login anonymous +app_update 380870 +quit

export LD_LIBRARY_PATH="~/Zomboid/pzserver/jre64/lib:${LD_LIBRARY_PATH}"

# The server requires an admin password to run. This would normally be read from servertest.ini.
# On first start the file may not be present leading to the pz process terminating.
# Test if servertest.ini exists, if not then we need to start the server with a temp admin pass.
if [ -f /home/steam/Zomboid/Server/servertest.ini ]; then
    echo "servertest.ini exists."
    bash ~/Zomboid/pzserver/start-server.sh -Xmx12g -Xms12g
else
    echo "servertest.ini does not exist."
    bash ~/Zomboid/pzserver/start-server.sh -Xmx12g -Xms12g -adminpassword "temp"
fi