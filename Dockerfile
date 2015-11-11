FROM ubuntu:wily
MAINTAINER Christoph Dwertmann <christoph.dwertmann@vaultsystems.com.au>
RUN apt-get update && apt-get install -y apache2 tomcat7 --no-install-recommends && apt-get clean && rm -rf /var/lib/apt/lists/*
ADD *.war /var/lib/tomcat7/webapps/
RUN chown -R tomcat:tomcat /usr/share/tomcat7

#ADD *.sh /
#ENTRYPOINT ["/entrypoint.sh"]
