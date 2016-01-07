#
# Copyright (c) 2016, ROE (http://www.roe.ac.uk/)
# All rights reserved.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
FROM postgres:9.4
MAINTAINER Dave Morris <docker-admin@metagrid.co.uk>

#
# Set the PostGIS version
ENV POSTGIS_MAJOR=2.1
ENV POSTGIS_VERSION=2.1.4+dfsg-3

#
# Set the PLR version
ENV PLR_VERSION=1:8.3.0.15-4

#
# Install the PostGIS package
RUN apt-get update \
    && apt-get install -y \
        postgis=$POSTGIS_VERSION \
        postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR=$POSTGIS_VERSION \
    && rm -rf /var/lib/apt/lists/*

#
# Add our PostGIS init script
ADD sql/postgis-init.sql /docker-entrypoint-initdb.d/postgis-init.sql

#
# Install the PLR package
RUN apt-get update \
    && apt-get install -y \
        postgresql-$PG_MAJOR-plr=$PLR_VERSION \
    && rm -rf /var/lib/apt/lists/*

#
# Add our PLR init script
ADD sql/plr-init.sql /docker-entrypoint-initdb.d/plr-init.sql

