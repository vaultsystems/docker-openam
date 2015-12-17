FROM tomcat:8-jre8
MAINTAINER Christoph Dwertmann <christoph.dwertmann@vaultsystems.com.au>
RUN wget https://github.com/OpenRock/OpenAM/releases/download/12.0.0-1/OpenAM-12.0.0-1.zip && \
    unzip *.zip && \
    mv *.war $CATALINA_HOME/webapps/openam.war && \
    rm *.zip
ENV CATALINA_OPTS="-Xmx2048m -server"
CMD ["catalina.sh", "run"]
