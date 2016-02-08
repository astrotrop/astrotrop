#!/bin/bash
#
# <meta:header>
#   <meta:licence>
#     Copyright (c) 2016, ROE (http://www.roe.ac.uk/)
#
#     This information is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
#
#     This information is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
#  
#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <http://www.gnu.org/licenses/>.
#   </meta:licence>
# </meta:header>
#
#

# -----------------------------------------------------
# Start our GeoNode service
#[root@goenode]

config()
    {
    echo "DEBUG : Checking local settings"
    if [ -e /geonode/geonode/local_settings.py ]
    then
        echo "INFO  : Found local settings"
    else
        echo "DEBUG : Checking template settings"
        if [ -e /geonode/local_template.py ]
        then
            echo "DEBUG : Found template settings"
            echo "INFO  : Creating local settings"

            sed "
                s|{SITEURL}|${SITEURL}|
                s|{DATABASE_NAME}|${DATABASE_NAME}|
                s|{DATABASE_HOST}|${DATABASE_HOST}|
                s|{DATABASE_PORT}|${DATABASE_PORT}|
                s|{DATABASE_USER}|${DATABASE_USER}|
                s|{DATABASE_PASS}|${DATABASE_PASS}|
                s|{DATASTORE_NAME}|${DATASTORE_NAME}|
                s|{DATASTORE_HOST}|${DATASTORE_HOST}|
                s|{DATASTORE_PORT}|${DATASTORE_PORT}|
                s|{DATASTORE_USER}|${DATASTORE_USER}|
                s|{DATASTORE_PASS}|${DATASTORE_PASS}|
                s|{OGC_SERVER_LOCAL}|${OGC_SERVER_LOCAL}|
                s|{OGC_SERVER_PUBLIC}|${OGC_SERVER_PUBLIC}|
                s|{OGC_SERVER_USER}|${OGC_SERVER_USER}|
                s|{OGC_SERVER_PASS}|${OGC_SERVER_PASS}|
                " /geonode/local_template.py \
                > /geonode/geonode/local_settings.py

        else
            echo "ERROR : Unable to find template settings"
        fi
    fi
    }

server()
    {
    echo "INFO  : Starting GeoNode service"
    pushd /geonode
        python manage.py runserver 0.0.0.0:8000
    popd
    }

case "$1" in 
    start)
        config
        server
        ;;

    config)
        config
        ;;

    server)
        server
        ;;

    *)  echo "INFO  : User command [$@]"
        exec "$@"
        ;;
esac

