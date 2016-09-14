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

FROM rocker/rstudio
MAINTAINER Dave Morris <docker-admin@metagrid.co.uk>

#
# Update the whole system.
# https://github.com/rocker-org/rocker/issues/134
RUN apt-get update \ 
 && apt-get dist-upgrade \
 && rm -rf /var/lib/apt/lists/

#
# Add the ODBC and PostgreSQL drivers to connect to PostGIS.
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      unixodbc \
      odbc-postgresql \
      r-cran-rodbc \
      r-cran-rpostgresql \
 && rm -rf /var/lib/apt/lists/

#
# Add the gdal package .
#       r-cran-rgdal \
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      libgdal1i \
      libproj-dev \
      libgdal-dev \
 && rm -rf /var/lib/apt/lists/



