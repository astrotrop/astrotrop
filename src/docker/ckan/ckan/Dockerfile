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
FROM fedora:22
MAINTAINER Dave Morris <docker-admin@metagrid.co.uk>

#
# Set our target locations.
ENV ckanconf /etc/ckan/default
ENV ckanroot /usr/lib/ckan/default
ENV ckandata /var/lib/ckan

#
# Install Apache.
RUN dnf -y install httpd

#
# Install mod_wsgi.
RUN dnf -y install mod_wsgi

#
# Install postgresql client.
RUN dnf -y install postgresql
RUN dnf -y install postgresql-devel
RUN dnf -y install python-psycopg2

#
# Install the build tools.
RUN dnf -y install gcc
RUN dnf -y install git

#
# Install the Python tools.
RUN dnf -y install python-pip
RUN dnf -y install python-virtualenv

#
# Create our target directories.
RUN mkdir -p ${ckanroot}
RUN mkdir -p ${ckanconf}
RUN mkdir -p ${ckandata}/storage
RUN mkdir -p ${ckandata}/resources
RUN chown -R apache ${ckandata}

#
# Install CKAN and dependencies.
WORKDIR ${ckanroot}
RUN pip install -e 'git+https://github.com/ckan/ckan.git@ckan-2.3#egg=ckan'
RUN pip install -r "${ckanroot}/src/ckan/requirements.txt"

#
# Link our Repoze.who config file.
RUN ln -s ${ckanroot}/src/ckan/who.ini ${ckanconf}/who.ini

#
# Install our CKAN config.
RUN COPY ckan.ini ${ckanconf}/ckan.ini

#
# Install our WSGI config.
RUN COPY wsgi.conf ${ckanconf}/wsgi.conf

#
# Install our Apache config.
RUN COPY ckan.conf /etc/httpd/conf.d/ckan.conf

#
# Install Apache foreground script.
# https://github.com/docker-library/httpd/tree/master/2.4
COPY httpd-foreground /usr/local/bin/
RUN chmod a+x /usr/local/bin/httpd-foreground

EXPOSE 80

#
# Run Apache in the foreground.
CMD ["httpd-foreground"]