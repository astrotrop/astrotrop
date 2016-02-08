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
        git
        gcc                    \
        wget                   \
        patch                  \
        build-essential        \

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
        libxslt1-dev

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

    #
    # Used to configure the database
    apt-get -y install         \
        postgresql-client

    #
    # From the project Dockerfile
    apt-get -y install         \
        python-bs4             \
        python-pip             \
        python-paver           \
        python-nose            \
        python-gdal            \
        python-lxml            \
        python-pillow          \
        python-httplib2        \
        python-multipartposthandler

    #
    # From the project Dockerfile
    apt-get -y install           \
        python-django            \
        python-django-nose       \
        python-django-taggit     \
        python-django-jsonfield  \
        python-django-pagination \
        python-django-extensions

    #
    # From the project Dockerfile
    apt-get -y install         \
        transifex-client

# -----------------------------------------------------
# Download the GeoNode source code.
#[root@builder]

    mkdir /geonode-new

    tarfile=geonode-2.4.tar.gz
    tarpath=/tmp/${tarfile:?}
    wget \
        --output-document "${tarpath:?}" \
        'https://github.com/GeoNode/geonode/archive/2.4.tar.gz'

    tar --gzip \
        --verbose \
        --extract \
        --directory /geonode-new \
        --strip-components 1 \
        --file "${tarpath:?}"

    rm "${tarpath:?}"

# -----------------------------------------------------
# Install the GeoNode dependencies.
#[root@builder]
    
    pip install -e /geonode





