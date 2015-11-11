OpenAM docker image

1. run ./build_war.sh to fetch the source code and build a WAR file (can take a long time)
2. run ocker build -t openam .
3. run docker run --cap-add=SYS_PTRACE --security-opt=apparmor:unconfined --name openam -p 8080:8080 -d openam
