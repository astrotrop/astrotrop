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

FROM astrotrop/tomcat:8.30
MAINTAINER Dave Morris <docker-admin@metagrid.co.uk>

ENV GEOEXPLORER_VERSION=2.0
ENV GEOEXPLORER_ZIPFILE=geoexplorer.zip
ENV GEOEXPLORER_CONTEXT=geoexplorer

#
# Swap back to root account.
USER root

#
# Add the geoexplorer webapp (unzipped)
ADD ${GEOEXPLORER_ZIPFILE} ${TOMCAT_ROOT}/webapps/${GEOEXPLORER_CONTEXT}

#
# Create the /data directory.
# Note - VOLUME needs to be done AFTER any chown and chmod
# TODO Move /data and /temp volumes to base image.
RUN mkdir /data
RUN chown tomcat:tomcat /data
RUN chmod u=rwx,g=rwx,o=rx /data
VOLUME /data

#
# Set the data directory.
ENV GEOEXPLORER_DATA=/data

#
# Swap back to the Tomcat user.
USER tomcat

