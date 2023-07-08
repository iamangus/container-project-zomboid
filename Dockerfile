FROM ghcr.io/iamangus/arch-steamcmd/arch-steamcmd

USER 1000
ENV USER=steam
WORKDIR /home/steam

COPY --chown=1000:1000 entrypoint.sh /home/steam/

ENTRYPOINT bash /home/steam/entrypoint.sh