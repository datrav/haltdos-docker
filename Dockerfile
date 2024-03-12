FROM ubuntu:22.04
LABEL description="This is a custom Docker Image for Haltdos WAF"
RUN apt update
RUN apt-get install -y curl iproute2 sudo
RUN curl -s -k -o setup.sh https://binary.haltdos.com/community/waf/setup.sh
RUN chmod +x setup.sh
RUN bash setup.sh
ENV JAVA_OPTS="-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom"
EXPOSE 9000
ENTRYPOINT ["java","-jar","/opt/haltdos/controller/controller.war"]
