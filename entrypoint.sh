mkdir -p ~/Zomboid/pzserver
steamcmd +force_install_dir ~/Zomboid/pzserver +login anonymous +app_update 380870 +quit
export LD_LIBRARY_PATH="~/Zomboid/pzserver/jre64/lib:${LD_LIBRARY_PATH}"
bash ~/Zomboid/pzserver/start-server.sh -adminpassword "temp"