FROM confluentinc/cp-kafka-connect:6.1.0

USER root

RUN wget -O /tmp/debezium-connector-mysql.tar.gz https://repo1.maven.org/maven2/io/debezium/debezium-connector-mysql/1.9.8.Final/debezium-connector-mysql-1.9.8.Final-plugin.tar.gz \
    && mkdir -p /usr/share/confluent-hub-components/debezium-connector-mysql \
    && tar -xzf /tmp/debezium-connector-mysql.tar.gz -C /usr/share/confluent-hub-components/debezium-connector-mysql \
    && rm /tmp/debezium-connector-mysql.tar.gz

USER appuser

