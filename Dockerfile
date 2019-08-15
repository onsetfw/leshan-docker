FROM alpine:latest

RUN apk add --no-cache shadow curl runit openjdk8-jre-base nss

# Get Leshan executable jar
RUN mkdir -p /opt/leshan-server-demo && \
    curl -o /opt/leshan-server-demo/leshan-server-demo.jar \
        https://hudson.eclipse.org/leshan/job/leshan/lastSuccessfulBuild/artifact/leshan-server-demo.jar
RUN useradd -r -d /opt/leshan-server-demo -s /sbin/nologin -U leshan

# Copy in the keystore with server key/certificate
COPY server.jks /opt/leshan-server-demo

CMD cd /tmp && \
    chpst -u leshan java -jar /opt/leshan-server-demo/leshan-server-demo.jar \
        -ks server.jks -ksp server -kst pkcs12 -ksa leshan -ksap server

