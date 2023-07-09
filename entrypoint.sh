mkdir ~/pzserver
steamcmd +force_install_dir ~/pzserver +login anonymous +app_update 380870 +quit
# Fix to a bug in start-server.sh that causes to no preload a library:
# https://github.com/Danixu/project-zomboid-server-docker/blob/main/scripts/entry.sh
# ERROR: ld.so: object 'libjsig.so' from LD_PRELOAD cannot be preloaded (cannot open shared object file): ignored.
export LD_LIBRARY_PATH="~/pzserver/jre64/lib:${LD_LIBRARY_PATH}"
bash ~/pzserver/start-server.sh -adminpassword "temp"