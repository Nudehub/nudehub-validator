#!/bin/sh
bash /docker-entrypoint.sh neo4j &
sleep 20
bash -c 'source /root/.nvm/nvm.sh && cd /app/bin && node *.js'
