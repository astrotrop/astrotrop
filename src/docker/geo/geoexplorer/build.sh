#!/bin/bash
#
# <meta:header>
#   <meta:licence>
#     Copyright (c) 2016, ROE (http://www.roe.ac.uk/)
#
#     This information is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
#
#     This information is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
#  
#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <http://www.gnu.org/licenses/>.
#   </meta:licence>
# </meta:header>
#
#

# -----------------------------------------------------
# Clone the source code.
# TODO this probably lives outside the container
#[root@builder]

    mkdir /opengeo
    pushd /opengeo

        #
        # Clone the top level project.
        git clone git://github.com/opengeo/suite.git

        pushd suite

            #
            # Remove reference to a broken sub-module.
            sed -i '
                /^\[submodule "geoserver\/webapp\/composer"\]/ {
                    N
                    N
                    d
                    }
                ' .gitmodules 

            #
            # Update the sub-modules
            git submodule init
            git submodule update

        popd
    popd

# -----------------------------------------------------
# Build the source code.
#[root@builder]

    pushd /opengeo/suite
        pushd geoexplorer

            mvn clean install

            ant build
                
        popd
    popd

# -----------------------------------------------------
# Transfer the war file to our target directory.
#[root@builder]

    cp -r \
        /opengeo/suite/geoexplorer/target/geoexplorer.war \
        /target/geoexplorer.war

