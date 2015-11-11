FROM ubuntu:wily
MAINTAINER Christoph Dwertmann <christoph.dwertmann@vaultsystems.com.au>
RUN apt-get update && apt-get install -y tomcat7 libtomcat7-java --no-install-recommends && apt-get clean && rm -rf /var/lib/apt/lists/*
ADD *.war /var/lib/tomcat7/webapps/
RUN chown -R tomcat7:tomcat7 /usr/share/tomcat7
CMD /etc/init.d/tomcat7 start && tail -f /var/log/tomcat7/catalina.out
