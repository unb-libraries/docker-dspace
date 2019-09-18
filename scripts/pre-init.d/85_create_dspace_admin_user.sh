#!/usr/bin/env bash
if [[ "$DSPACE_CREATE_ADMIN" == "TRUE" ]]; then
  USER_LIST=$($DSPACE_BIN user -L)
  if [[ "$USER_LIST" == "" ]]; then
    echo "No users found, creating administrator..."
    $DSPACE_BIN create-administrator --email "${DSPACE_ADMIN_EMAIL}" --first "${DSPACE_ADMIN_NAME_FIRST}" --last "${DSPACE_ADMIN_NAME_LAST}" --language "${DSPACE_ADMIN_LANGUAGE}" --password "${DSPACE_ADMIN_PASSWORD}"
  fi
fi
