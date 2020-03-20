FROM openjdk:8-alpine


ENV GATLING_VERSION 3.3.1

RUN apk add curl

RUN curl -so /tmp/gatling.zip  https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/$GATLING_VERSION/gatling-charts-highcharts-bundle-$GATLING_VERSION-bundle.zip  \
  && mkdir -p /opt/gatling  \
  && unzip /tmp/gatling.zip -d /opt/gatling \
  && mv /opt/gatling/gatling-charts-highcharts-bundle-$GATLING_VERSION/* /opt/gatling/ \
  && rm -r /opt/gatling/gatling-charts-highcharts-bundle-$GATLING_VERSION/

WORKDIR /opt/gatling

ENV GATLING_HOME /opt/gatling
ENV PATH $GATLING_HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

VOLUME ["/opt/gatling/conf", "/opt/gatling/results", "/opt/gatling/user-files"]

ENTRYPOINT ["gatling.sh"]



