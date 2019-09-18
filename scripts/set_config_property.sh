#!/usr/bin/env bash
# Set a Java properties file config value, overwriting if exists.
#
# Originally from https://github.com/sedici/docker-dspace/
#
# @param 1 (required) Property name to assign
# @param 2 (required) Value to assign
# @param 3 (required) Absolute file name of the java properties file
ASSIGNMENT="${1} = ${2}"
FILE_PATH="${3}"
CONFIG_GETTER_SCRIPT="/scripts/get_config_property.sh"

if [[ ! -f "${FILE_PATH}" ]]; then
  echo "Error, ${FILE_PATH} does not exist."
  exit 1
fi

OLD_VALUE=$($CONFIG_GETTER_SCRIPT "${1}" "${FILE_PATH}")
if [[ -z "${OLD_VALUE}" ]]; then
  echo "${ASSIGNMENT}" >> "${FILE_PATH}"
else
  sed -i "s#^${1}.\?=.*#${ASSIGNMENT}#" "${FILE_PATH}"
fi
