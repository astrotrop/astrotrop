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
FROM postgres
MAINTAINER Dave Morris <docker-admin@metagrid.co.uk>

#
# Set the default locale
RUN localedef -i en_GB -c -f UTF-8 -A /usr/share/locale/locale.alias en_GB.UTF-8
ENV LANG en_GB.utf8

#
# Expose our data directory.
# https://github.com/DanielCaldwell/postgres-docker-persistant-data
RUN mkdir --parents /var/lib/postgresql/data
RUN chown postgres:postgres /var/lib/postgresql/data
RUN chown postgres:postgres /var/lib/postgresql

VOLUME /var/lib/postgresql/data


