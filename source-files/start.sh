#!/bin/bash
echo "environment variales:"
env
echo DB_SERVER=${BRPMDBTEST_SERVICE_HOST:-${DB_PORT_5432_TCP_ADDR:-${DB_SERVER}}} >> /etc/tomcat6/tomcat6.conf
echo DB_PORT=${BRPMDBTEST_SERVICE_PORT:-${DB_PORT_5432_TCP_PORT:-${DB_PORT}}} >> /etc/tomcat6/tomcat6.conf
echo JAVA_OPTS=\"\$JAVA_OPTS -Xms512m -Xmx2048m -XX:PermSize=512m\" >> /etc/tomcat6/tomcat6.conf

echo "/etc/tomcat6/tomcat6.conf:"
cat /etc/tomcat6/tomcat6.conf

/etc/init.d/tomcat6 start
tail -F /var/log/tomcat6/catalina.out