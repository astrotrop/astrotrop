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
# Start GeoNode Django using paver
#[root@goenode]

case "$1" in 
    start)
        echo "Starting GeoNode Django"
        pushd /geonode
            #paver start_django -b 0.0.0.0:8000
            python manage.py runserver -b 0.0.0.0:8000
        popd
        ;;

    *)  echo "Other command .."
        exec "$@"
        ;;
esac

