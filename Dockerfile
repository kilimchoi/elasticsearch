# The official Elasticsearch Docker image
FROM docker.elastic.co/elasticsearch/elasticsearch:8.2.0@sha256:a62498fd75227fa546f8b6d936a75cfa8b1dddba349cb56a44e3677b3cb10855

# Copy our config file over
COPY --chown=1000:0 config/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml

# Allow Elasticsearch to create `elasticsearch.keystore`
# to circumvent https://github.com/elastic/ansible-elasticsearch/issues/430
RUN chmod g+ws /usr/share/elasticsearch/config

USER 1000:0
