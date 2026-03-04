FROM eclipse-temurin:17-jre

WORKDIR /opt/Lavalink

RUN apt-get update && \
    apt-get install -y wget && \
    wget -O Lavalink.jar https://github.com/lavalink-devs/Lavalink/releases/download/3.7.12/Lavalink.jar && \
    ls -lh Lavalink.jar && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY application.yml application.yml

CMD ["java", "-Djdk.tls.client.protocols=TLSv1.2", "-Xmx256M", "-jar", "Lavalink.jar"]
