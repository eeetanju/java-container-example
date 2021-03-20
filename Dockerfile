FROM jboss/wildfly
RUN /opt/jboss/wildfly/bin/add-user.sh admin heyAdmin --silent
ADD ./HelloWorld.war /opt/jboss/wildfly/standalone/deployments
USER root
RUN chown jboss:jboss /opt/jboss/wildfly/standalone/deployments/HelloWorld.war
USER jboss
RUN mkdir /opt/jboss/wildfly/standalone/log
CMD ["/opt/jboss/wildfly/bin/standalone.sh","-b","0.0.0.0","-bmanagement","0.0.0.0"]
RUN java -version
