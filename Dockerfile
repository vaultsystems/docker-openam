FROM tomcat:8-jre8
MAINTAINER Christoph Dwertmann <christoph.dwertmann@vaultsystems.com.au>
RUN wget https://github.com/OpenRock/OpenAM/releases/download/12.0.0-1/OpenAM-ServerOnly-12.0.0-1.war \
    -O $CATALINA_HOME/webapps/openam.war
ENV CATALINA_OPTS="-Xmx2048m -server"
CMD ["catalina.sh", "run"]
