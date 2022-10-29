FROM amazoncorretto:17-alpine

EXPOSE 25565:25565

ADD ready.sh /root/ready.sh
ADD https://github.com/monun/paper-api/releases/download/0.0.3/paper-api.jar /root/paper-api.jar

CMD sh /root/ready.sh