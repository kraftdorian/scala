FROM debian:buster-slim

SHELL ["/bin/bash", "-c"]

WORKDIR /scala

RUN apt update &&\
    apt install -y wget apt-transport-https curl zip gnupg &&\
    wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add - &&\
    echo "deb https://adoptopenjdk.jfrog.io/adoptopenjdk/deb buster main" | tee /etc/apt/sources.list.d/adoptopenjdk.list &&\
    mkdir /usr/share/man/man1 &&\
    apt update &&\
    apt install -y adoptopenjdk-11-hotspot &&\
    curl -s "https://get.sdkman.io" | bash &&\
    source "/root/.sdkman/bin/sdkman-init.sh" &&\
    sdk install scala 2.13.5

CMD ["scala"]
