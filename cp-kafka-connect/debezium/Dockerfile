FROM confluentinc/cp-kafka-connect:7.9.1

USER root

RUN rm -rf /usr/share/confluent-hub-components/debezium-connector-mysql/* \
    && mkdir -p /usr/share/confluent-hub-components/debezium-connector-mysql

# Debezium MySQL Connector 설치
RUN wget -O /tmp/debezium-mysql.tar.gz https://repo1.maven.org/maven2/io/debezium/debezium-connector-mysql/3.1.2.Final/debezium-connector-mysql-3.1.2.Final-plugin.tar.gz \
    && tar -xzf /tmp/debezium-mysql.tar.gz -C /usr/share/confluent-hub-components/debezium-connector-mysql \
    && rm /tmp/debezium-mysql.tar.gz

# Debezium Scripting SMT 아카이브 다운로드 및 압축 해제
WORKDIR /usr/share/confluent-hub-components/debezium-connector-mysql
RUN wget https://repo1.maven.org/maven2/io/debezium/debezium-scripting/3.1.2.Final/debezium-scripting-3.1.2.Final.tar.gz \
    && tar -xzf debezium-scripting-3.1.2.Final.tar.gz \
    && rm debezium-scripting-3.1.2.Final.tar.gz

# Groovy 엔진 JAR 다운로드
RUN wget https://repo1.maven.org/maven2/org/apache/groovy/groovy/4.0.21/groovy-4.0.21.jar \
    && wget https://repo1.maven.org/maven2/org/apache/groovy/groovy-jsr223/4.0.21/groovy-jsr223-4.0.21.jar \
    && wget https://repo1.maven.org/maven2/org/apache/groovy/groovy-json/4.0.21/groovy-json-4.0.21.jar

ENV CONNECT_PLUGIN_PATH=/usr/share/confluent-hub-components/debezium-connector-mysql

USER appuser
