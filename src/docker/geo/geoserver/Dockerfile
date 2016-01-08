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

ENV GEOSERVER_VERSION=2.8.1
ENV GEOSERVER_ZIPFILE=geoserver-${GEOSERVER_VERSION}-war.zip
ENV GEOSERVER_WARFILE=geoserver.war

USER root

#
# Download the zip file(s).
ADD http://netcologne.dl.sourceforge.net/project/geoserver/GeoServer/${GEOSERVER_VERSION}/${GEOSERVER_ZIPFILE} /tmp/

#
# Extract the warfile from the zipfile.
RUN pushd /tmp ; unzip ${GEOSERVER_ZIPFILE} geoserver.war ; popd
RUN rm /tmp/${GEOSERVER_ZIPFILE}

#
# Install the warfile in Tomcat.
RUN mv /tmp/${GEOSERVER_WARFILE} ${TOMCAT_ROOT}/webapps/

#
# Changes to the webapp config ...
# Changing the data directory outside the webapp is recomended.
# If we mapped it onto a volume, then it would need to be populated with data from webapp.
# http://docs.geoserver.org/latest/en/user/datadirectory/data-dir-setting.html#data-dir-setting
# 

#
# Useful to have 'pre' and 'post' scripts in our tomcat container ?
# Fairly easy to add pre scripts.
# Post scripts could be done using docker exec.


USER tomcat
