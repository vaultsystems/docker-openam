FROM ubuntu:wily
MAINTAINER Christoph Dwertmann <christoph.dwertmann@vaultsystems.com.au
RUN apt-get update && apt-get install -y tomcat7 wget --no-install-recommends \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN wget https://github.com/OpenRock/OpenAM/releases/download/12.0.0-1/OpenAM-ServerOnly-12.0.0-1.war -O /var/lib/tomcat7/webapps/openam.war
RUN chown -R tomcat7:tomcat7 /usr/share/tomcat7
CMD /etc/init.d/tomcat7 start && tail -f /var/log/tomcat7/catalina.out
