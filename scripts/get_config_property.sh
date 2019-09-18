#!/usr/bin/env bash
# Get a Java properties file config value.
#
# Originally from https://github.com/sedici/docker-dspace/
#
# @param 1 (required) Property name to query
# @param 2 (required) Absolute file name of the java properties file
# @returns Property value if found, null otherwise
grep "^${1}\s*\=" "${2}" | cut -d'=' -f2
