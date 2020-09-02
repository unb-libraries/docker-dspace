#!/usr/bin/env bash

ls $DSPACE_ROOT/webapps/


# Enable Root/UI webapp.
rm -rf "$CATALINA_HOME/webapps/ROOT"
ln -s "$DSPACE_ROOT/webapps/${DSPACE_ROOT_WEBAPP}" "$CATALINA_HOME/webapps/ROOT"

# Enable Additional Resources (symlinks)
for APPNAME in ${DSPACE_WEBAPPS_DEPLOY}; do
  rm -f "${CATALINA_HOME}/webapps/${APPNAME}"
  ln -s "${DSPACE_ROOT}/webapps/${APPNAME}" "${CATALINA_HOME}/webapps/${APPNAME}"
done
