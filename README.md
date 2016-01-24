OpenAM docker container
-----------------------

To create the SSL keystore from .crt and .key:

    openssl pkcs12 -export -in server.crt -inkey server.key -out server.p12 -name tomcat
    keytool -importkeystore -deststorepass [secret] -destkeypass [secret] -destkeystore server.keystore -srckeystore server.p12 -srcstoretype PKCS12 -srcstorepass [secret] -alias tomcat

Build and run the container:

    docker build -t openam .
    docker run -e KEYSTORE_PASS=secret -v $PWD/server.keystore:/opt/server.keystore -v /dev/urandom:/dev/random --cap-add=SYS_PTRACE --security-opt=apparmor:unconfined --name openam -p 8443:8443 -d openam

Open *https://ipaddress:8443/openam* to see the OpenAM configuration wizard
