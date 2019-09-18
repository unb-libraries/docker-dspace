#!/usr/bin/env bash
# Check if this is a new deployment. If so, install.
if [[ ! -f /tmp/DSPACE_DB_LIVE ]];
then
  echo "Deploying default database config file..."
  cp "${DSPACE_ROOT}/config/local.cfg.EXAMPLE"  "${DSPACE_ROOT}/config/local.cfg"
fi
