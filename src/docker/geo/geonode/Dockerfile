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

FROM ubuntu:14.04
MAINTAINER Dave Morris <docker-admin@metagrid.co.uk>

#
# Add and run our build script.
ADD build.sh /
RUN chmod a+x,a-w build.sh
RUN /build.sh

#
# Add our run script.
ADD run.sh /
RUN chmod a+x /run.sh

#
# Add our template settings.
ADD local_template.py /geonode

EXPOSE 8000

ENTRYPOINT ["/run.sh"]
CMD ["start"]







