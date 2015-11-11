OpenAM docker container
-----------------------

    docker build -t openam .
    docker run --cap-add=SYS_PTRACE --security-opt=apparmor:unconfined --name openam -p 8080:8080 -d openam
