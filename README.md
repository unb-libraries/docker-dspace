# unblibraries/dspace [![](https://images.microbadger.com/badges/image/unblibraries/dspace:6.x.svg)](http://microbadger.com/images/unblibraries/dspace:6.x "Get your own image badge on microbadger.com") [![Build Status](https://travis-ci.com/unb-libraries/docker-dspace.svg?branch=6.x)](https://travis-ci.com/unb-libraries/docker-dspace)

A lightweight extensible DSpace docker image, suitable for a development-to-production workflow.

## Quick Start
This image does not contain a database (postgres) server, although the [docker-compose.yml](https://github.com/unb-libraries/docker-dspace/blob/6.x/docker-compose.yml) file provided for convenience will deploy dspace with a MySQL server with no additional configuration required. Looking for a really quick start?

```
git clone -b 6.x git@github.com:unb-libraries/docker-dspace.git docker-dspace
cd docker-dspace
docker-compose up -d; docker-compose logs
```

## How To Use
This image offers little benefit on its own, and shines when serving as the base of an extension. [An example of how we extend this image for a production site](https://github.com/unb-libraries/unbscholar.lib.unb.ca) should provide enough for you to get started.

## Repository Tags

|                    Tag                    | Dspace | JRE   | Tomcat   | Size                                                                                                                                                                                               | Status                                                                                                                                                    |
|:-----------------------------------------:|--------|-------|-------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| unblibraries/dspace:6.x |   6.x  | 8 | 8 | [![](https://images.microbadger.com/badges/image/unblibraries/dspace:6.x.svg)](http://microbadger.com/images/unblibraries/dspace:6.x "Get your own image badge on microbadger.com") | [![Build Status](https://travis-ci.com/unb-libraries/docker-dspace.svg?branch=6.x)](https://travis-ci.com/unb-libraries/docker-dspace) |


## Author / Licensing
- Developed by [![UNB Libraries](https://github.com/unb-libraries/assets/raw/master/unblibbadge.png "UNB Libraries")](https://lib.unb.ca/)
- This work is published through our strong commitment to making as much of our development/workflow as possible freely available.
- Consequently, the contents of this repository [unb-libraries/docker-dspace] are licensed under the [MIT License](http://opensource.org/licenses/mit-license.html). This license explicitly excludes:
   - Any website content, which remains the exclusive property of its author(s).
   - The UNB logo and any of the associated suite of visual identity assets, which remains the exclusive property of the University of New Brunswick.
