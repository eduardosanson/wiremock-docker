FROM openjdk:8-jre

ENV VERSION 2.26.3

RUN mkdir /opt/wiremock
WORKDIR /opt/wiremock
RUN curl -sSL -o wiremock.jar https://repo1.maven.org/maven2/com/github/tomakehurst/wiremock-standalone/$VERSION/wiremock-standalone-$VERSION.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","wiremock.jar","--verbose", "--port", "8080"]