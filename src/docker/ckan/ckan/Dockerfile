#
# Copyright (c) 2015, ROE (http://www.roe.ac.uk/)
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
FROM astrotrop/apache-wsgi:1.3
MAINTAINER Dave Morris <docker-admin@metagrid.co.uk>

#
# Set our target locations.
ENV ckanconf /etc/ckan
ENV ckanroot /usr/lib/ckan
ENV ckandata /var/lib/ckan

#
# Add and run our build script.
ADD build.sh /
RUN chmod a+x,a-w build.sh
RUN /build.sh

#
# Install our CKAN config.
COPY ckan.ini ${ckanconf}/ckan.ini

#
# Install our WSGI config.
COPY ckan.wsgi ${ckanconf}/ckan.wsgi

#
# Install our Apache config.
COPY ckan.conf /etc/httpd/conf.d/ckan.conf


