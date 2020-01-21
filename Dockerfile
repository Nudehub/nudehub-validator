FROM neo4j
env NEO4J_dbms_security_procedures_unrestricted=apoc.\*
env NEO4J_AUTH=neo4j/password 
COPY ./plugins /plugins
COPY . /app
RUN apt-get update && apt-get install -y curl && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash && bash -c 'source /root/.nvm/nvm.sh && nvm install v10.17.0'
ENTRYPOINT ["/sbin/tini", "-g", "--", "/app/run.sh"]
