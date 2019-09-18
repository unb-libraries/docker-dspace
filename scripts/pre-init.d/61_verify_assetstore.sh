#!/usr/bin/env bash
if [[ ! -d "${DSPACE_ASSETSTORE_DIR}" ]];
then
  echo "Assetstore directory at ${DSPACE_ASSETSTORE_DIR} not found, creating it..."
  mkdir -p "${DSPACE_ASSETSTORE_DIR}"
fi
