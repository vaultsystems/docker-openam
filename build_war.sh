#!/bin/bash

# alternative script to build WAR file from public SVN (which is not being updated anymore)

# use svn 1.7 to clone the source repo
docker run --rm=true -v $PWD:/mnt ubuntu:precise bash -c "apt-get update && apt-get install -y subversion && svn co https://svn.forgerock.org/openam/tags/12.0.0-1/openam && tar czf /mnt/openam-source.tar.gz openam"
# build WAR with latest maven
docker run --rm=true -v $PWD:/mnt ubuntu:wily bash -c "apt-get update && apt-get install -y default-jdk maven && tar xzf /mnt/openam-source.tar.gz && cd openam && MAVEN_OPTS=-Xmx1024m mvn -T 1C -DskipTests=true clean install && cp openam-server/target/*.war /mnt/openam.war"
