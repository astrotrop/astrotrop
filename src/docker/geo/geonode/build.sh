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
# Install our build tools.
#[root@builder]

    apt-get update
    apt-get -y install         \
        build-essential        \
        patch                  \
        gcc                    \
        git

# -----------------------------------------------------
# Install our dependencies.
#[root@builder]

    apt-get update
    apt-get -y install         \
        python                 \
        python-dev             \
        python-gdal            \
        python-pycurl          \
        python-imaging         \
        python-pastescript     \
        python-psycopg2        \
        python-support         \
        python-urlgrabber      \
        python-virtualenv

    apt-get -y install         \
        libxml2-dev            \
        libxslt-dev

    apt-get -y install         \
        gettext

    apt-get -y install         \
        libjpeg-dev            \
        libpng-dev             \
        libpq-dev

    apt-get -y install         \
        libgeos-dev            \
        libproj-dev            \
        gdal-bin

# -----------------------------------------------------
# Clone the GeoNode source code.
#[root@builder]

    mkdir /geonode
    git clone https://github.com/GeoNode/geonode.git /geonode

# -----------------------------------------------------
# Install GeoNode.
#[root@builder]
    
    pip install -e /geonode



