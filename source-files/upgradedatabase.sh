#!/bin/bash
export DB_SERVER=${DB_PORT_5432_TCP_ADDR:-${DB_SERVER}}
export DB_PORT=${DB_PORT_5432_TCP_PORT:-${DB_PORT}}
cd /usr/share/tomcat6/webapps/brpm/WEB-INF
export BUNDLE_GEMFILE=Gemfile
export GEM_HOME=gems
export RAILS_ENV=production
java -classpath "lib/*" org.jruby.Main -S rake --verbose --trace db:migrate
