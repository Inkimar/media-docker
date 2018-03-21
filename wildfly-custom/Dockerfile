FROM jboss/wildfly:8.2.1.Final

WORKDIR /opt/jboss/wildfly

ADD modules /opt/jboss/wildfly/modules/
ADD customization /opt/jboss/wildfly/customization/

USER root
RUN chmod +x /opt/jboss/wildfly/customization/execute.sh
RUN /opt/jboss/wildfly/customization/execute.sh

# Fix for Error: Could not rename /opt/jboss/wildfly/standalone/configuration/standalone_xml_history/current 
RUN rm -rf /opt/jboss/wildfly/standalone/configuration/standalone_xml_history
RUN chown -R jboss:jboss /opt/jboss/wildfly/

USER root

# admin-interface
RUN bin/add-user.sh -s -p passw0rd12 -u naturalist -e

# tini, zombie reaper
ENV TINI_VERSION v0.10.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini.asc /tini.asc
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 595E85A6B1B4779EA4DAAEC70B588DFF0527A9B7 \
 && gpg --verify /tini.asc

#adding the artifact . NB: docker-compose.yml - DO NOT MAP a VOLUME TO '/opt/jboss/wildfly/standalone/deployments/'
ADD customization/mediaserver-nf.ear /opt/jboss/wildfly/standalone/deployments/

RUN chmod +x /tini

ENTRYPOINT ["/tini", "--"]

#sparas direkt under root 
COPY wait-for-it.sh /
RUN chmod +x /wait-for-it.sh
CMD /wait-for-it.sh dbmedia:3306 -q --strict -- /opt/jboss/wildfly/bin

#CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]


