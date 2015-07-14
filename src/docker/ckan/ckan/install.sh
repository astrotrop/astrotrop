#!/bin/bash
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


#
# Install Apache.
dnf -y install httpd

#
# Install mod_wsgi.
dnf -y install mod_wsgi

#
# Install postgresql client.
dnf -y install postgresql
dnf -y install postgresql-devel
dnf -y install python-psycopg2

#
# Install the build tools.
dnf -y install gcc
dnf -y install git

#
# Install the Python tools.
dnf -y install python-pip
dnf -y install python-virtualenv

#
# Create our data directories.
mkdir -p "${ckandata:?}/storage"
mkdir -p "${ckandata:?}/resources"
chown -R apache "${ckandata:?}"

#
# Create our virtualenv.
mkdir -p "${ckanroot:?}"
virtualenv --no-site-packages "${ckanroot:?}"
source "${ckanroot:?}/bin/activate"

    #
    # Install CKAN and dependencies.
    pip install -e 'git+https://github.com/ckan/ckan.git@ckan-2.3#egg=ckan'
    pip install -r "${ckanroot:?}/src/ckan/requirements.txt"

#
# Restart our virtualenv.
deactivate
source "${ckanroot:?}/bin/activate"

#
# Link our Repoze.who config file.
ln -s "${ckanroot:?}/src/ckan/who.ini" "${ckanconf:?}/who.ini"

#
# Create our CKAN config.
#mkdir -p "${ckanconf:?}"
#pushd "${ckanroot:?}/src/ckan"
#    paster make-config ckan "${ckanconf:?}/ckan.ini"
#popd

#
# Create our WSGI config.
cat > "${ckanconf:?}/ckan.wsgi" << EOF
import os
activate_this = os.path.join('${ckanroot:?}/bin/activate_this.py')
execfile(activate_this, dict(__file__=activate_this))

from paste.deploy import loadapp
config_filepath = os.path.join('${ckanconf:?}/ckan.ini')
from paste.script.util.logging_config import fileConfig
fileConfig(config_filepath)
application = loadapp('config:%s' % config_filepath)
EOF

#
# Create our Apache config.
cat > /etc/httpd/conf.d/ckan.conf << EOF
<VirtualHost *:80>
    ServerName ckan.metagrid.co.uk
    WSGIScriptAlias / ${ckanconf:?}/ckan.wsgi

    # Pass authorization info on (needed for rest api).
    WSGIPassAuthorization On

    # Deploy as a daemon (avoids conflicts between CKAN instances).
    WSGIDaemonProcess ckan_default display-name=ckan_default processes=2 threads=15

    WSGIProcessGroup ckan_default

    ErrorLog  /var/log/httpd/ckan.metagrid.co.uk.error.log
    CustomLog /var/log/httpd/ckan.metagrid.co.uk.access.log combined

    <Directory />
        Require all granted
    </Directory>

    <IfModule mod_rpaf.c>
        RPAFenable On
        RPAFsethostname On
        RPAFproxy_ips 127.0.0.1
    </IfModule>
</VirtualHost>
EOF

