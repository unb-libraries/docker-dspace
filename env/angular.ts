/**
 * The contents of this file are subject to the license and copyright
 * detailed in the LICENSE and NOTICE files at the root of the source
 * tree and available online at
 *
 * http://www.dspace.org/license/
 */
// This file is based on environment.template.ts provided by Angular UI
export const environment = {
  // Default to using the local REST API (running in Docker)
  rest: {
    ssl: false,
    host: '127.0.0.1',
    port: 8080,
    nameSpace: '/server'
  }
};
