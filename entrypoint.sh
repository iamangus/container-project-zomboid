# steamcmd installs pz into ~/Zomboid/pzserver. 
# Running pz from ~/Zomboid/pzserver populates ~/Zomboid with the world and save files. 
# I mount ~/Zomboid to a pvc to persist both the steam server files as well as the world and save files.
mkdir -p ~/Zomboid/pzserver

#test if servertest.ini exists, if not then we need to set a temp admin pass.
#if [ -e /home/steam/Zomboid/Server/servertest1.ini ]; then forcepass="true"; else forcepass="false"; fi

steamcmd +force_install_dir ~/Zomboid/pzserver +login anonymous +app_update 380870 +quit

export LD_LIBRARY_PATH="~/Zomboid/pzserver/jre64/lib:${LD_LIBRARY_PATH}"

#test if servertest.ini exists, if not then we need to set a temp admin pass.
if [ -f /home/steam/Zomboid/Server/servertest1.ini ]; then
    bash ~/Zomboid/pzserver/start-server.sh
else
    bash ~/Zomboid/pzserver/start-server.sh -adminpassword "temp"
fi

#if [ $forcepass == "true" ]; then
#  bash ~/Zomboid/pzserver/start-server.sh -adminpassword "temp"
#else
#  bash ~/Zomboid/pzserver/start-server.sh
#fi