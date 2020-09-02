FROM maven:3-jdk-11 as maven

ENV DSPACE_VERSION 7.0-beta3
ENV MAVEN_OPTS "-Djava.awt.headless=true"

RUN curl -LJO https://github.com/DSpace/DSpace/archive/dspace-${DSPACE_VERSION}.tar.gz && \
  tar xvzpf DSpace-dspace-${DSPACE_VERSION}.tar.gz && \
  mv DSpace-dspace-${DSPACE_VERSION} dspace-src && \
  cd dspace-src && \
  mvn $MAVEN_OPTS package


FROM tomcat:jre11 as ant

ARG TARGET_DIR=dspace-installer

COPY --from=maven /dspace-src/dspace/target/dspace-installer /dspace-src
WORKDIR /dspace-src

ENV ANT_VERSION 1.10.7
ENV ANT_HOME /tmp/ant-$ANT_VERSION
ENV PATH $ANT_HOME/bin:$PATH

RUN mkdir $ANT_HOME && \
    wget -qO- "https://archive.apache.org/dist/ant/binaries/apache-ant-$ANT_VERSION-bin.tar.gz" | tar -zx --strip-components=1 -C $ANT_HOME

RUN ant init_installation update_configs update_code update_webapps


FROM tomcat:jre11
MAINTAINER UNB Libraries Systems <libsystems_at_unb.ca>

LABEL ca.unb.lib.generator="xmlui"
LABEL vcs-ref="6.x"
LABEL vcs-url="https://github.com/unb-libraries/docker-dspace"

ENV DSPACE_ADMIN_EMAIL admin@admin.com
ENV DSPACE_ADMIN_LANGUAGE en
ENV DSPACE_ADMIN_NAME_FIRST Admin
ENV DSPACE_ADMIN_NAME_LAST Admin
ENV DSPACE_ADMIN_PASSWORD temporaryonly
ENV DSPACE_ASSETSTORE_DIR /assetstore
ENV DSPACE_CREATE_ADMIN TRUE
ENV DSPACE_ROOT /dspace
ENV DSPACE_ROOT_WEBAPP xmlui
ENV DSPACE_WEBAPPS_DEPLOY solr sword
ENV JAVA_OPTS -Xmx2000m

ENV DSPACE_BIN $DSPACE_ROOT/bin/dspace

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    postgresql-client \
    netcat && \
  apt-get autoremove -y && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

COPY --from=ant /dspace $DSPACE_ROOT
EXPOSE 8080 8009

COPY ./scripts /scripts
ENTRYPOINT ["/scripts/run.sh"]
