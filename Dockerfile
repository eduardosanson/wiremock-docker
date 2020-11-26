FROM openjdk:8-jre

ENV VERSION 2.26.3

RUN mkdir /opt/wiremock
WORKDIR /opt/wiremock
RUN curl -sSL -o wiremock.jar https://repo1.maven.org/maven2/com/github/tomakehurst/wiremock-standalone/$VERSION/wiremock-standalone-$VERSION.jar
RUN curl -sSL -o body-transformer.jar https://github.com/opentable/wiremock-body-transformer/releases/download/wiremock-body-transformer-1.1.6/wiremock-body-transformer-1.1.6.jar

EXPOSE 8080
# ENTRYPOINT ["java","-jar","wiremock.jar","--verbose", "--port", "8080"]
ENTRYPOINT ["java","-cp","wiremock.jar:body-transformer.jar","com.github.tomakehurst.wiremock.standalone.WireMockServerRunner","--verbose", "--port", "8080", "--extensions", "com.opentable.extension.BodyTransformer"]