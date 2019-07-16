FROM alpine:latest

RUN apk add --no-cache shadow curl runit openjdk8-jre-base nss

RUN mkdir -p /opt/leshan-server-demo && \
    curl -o /opt/leshan-server-demo/leshan-server-demo.jar \
        https://hudson.eclipse.org/leshan/job/leshan/lastSuccessfulBuild/artifact/leshan-server-demo.jar
RUN useradd -r -d /opt/leshan-server-demo -s /sbin/nologin -U leshan

CMD cd /tmp && \
    chpst -u leshan java -jar /opt/leshan-server-demo/leshan-server-demo.jar \
    $LESHAN_ARGS

