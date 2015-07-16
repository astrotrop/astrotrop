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
FROM astrotrop/fedora
MAINTAINER Dave Morris <docker-admin@metagrid.co.uk>

#
# Set our target locations.
ENV ckanconf /etc/ckan
ENV ckanroot /usr/lib/ckan
ENV ckandata /var/lib/ckan

#
# Install Apache.
RUN dnf -y install httpd

#
# Install mod_wsgi.
RUN dnf -y install mod_wsgi

#
# Install the Python tools.
RUN dnf -y install python
RUN dnf -y install python-devel
RUN dnf -y install python-pip

#
# Install the build tools.
RUN dnf -y install git
RUN dnf -y install gcc

#
# Install the build dependencies.
RUN dnf -y install libxml2-devel
RUN dnf -y install libxslt-devel

#
# Create our target directories.
RUN mkdir --parent ${ckanroot}
RUN mkdir --parent ${ckanconf}
RUN mkdir --parent ${ckandata}

#RUN mkdir --parent ${pushroot}
#RUN mkdir --parent ${pushroot}/src

#
# Clone the source (always target the stable branch)
WORKDIR ${ckanroot}
RUN git clone -b stable https://github.com/ckan/datapusher.git

#
# Build and install the DataPusher.
WORKDIR ${ckanroot}/datapusher
RUN pip install -r requirements.txt
RUN python setup.py develop

#
# Install our DataPusher config.
COPY datapusher_settings.py ${ckanconf}/datapusher_settings.py

#
# Install our WSGI config.
COPY datapusher.wsgi ${ckanconf}/datapusher.wsgi

#
# Install our Apache config.
COPY datapusher.conf /etc/httpd/conf.d/datapusher.conf

#
# Install Apache foreground script.
# https://github.com/docker-library/httpd/tree/master/2.4
COPY httpd-foreground /usr/local/bin/
RUN chmod a+x /usr/local/bin/httpd-foreground

EXPOSE 80

#
# Run Apache in the foreground.
CMD ["httpd-foreground"]

