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
set -e

#
# Load our config properties.
source /ckandata.conf

#
# Create our CKAN role.
gosu postgres postgres --single -jE << EOSQL

    CREATE ROLE ${ckanrole:?} WITH 
        PASSWORD '${ckanpass:?}'
        NOSUPERUSER
        NOCREATEDB
        NOCREATEROLE
        LOGIN
        ;

EOSQL

#
# Create our CKAN database.
gosu postgres postgres --single -jE << EOSQL

    CREATE DATABASE ${ckandata:?} WITH
        OWNER = ${ckanrole:?}
        ;

EOSQL

#
# Create our tables ...

