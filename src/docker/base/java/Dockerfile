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

FROM astrotrop/fedora:1.3
MAINTAINER Dave Morris <docker-admin@metagrid.co.uk>

ENV JAVA_VERSION 1.8.0

#
# Install Java
RUN dnf -y install java-${JAVA_VERSION}-openjdk

#
# Fix for Network Security Services (NSS) issue.
# https://bugzilla.redhat.com/show_bug.cgi?id=1332867
# https://bugzilla.redhat.com/show_bug.cgi?id=1332456
RUN dnf update -y nss
