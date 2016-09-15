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
# Exit on error.
set -e

# -----------------------------------------------------
# Update the apt sources.

    echo "Updating apt sources"
    apt-get update

# -----------------------------------------------------
# Install R packages from Debian.

    echo "Installing Debian packages"
    apt-get install \
        --assume-yes \
        --no-install-recommends \
        unixodbc \
        r-cran-rodbc

    apt-get install \
        --assume-yes \
        --no-install-recommends \
        odbc-postgresql \
        r-cran-rpostgresql

    apt-get install \
        --assume-yes \
        --no-install-recommends \
        libgdal20 \
        libproj-dev \
        libgdal-dev

    apt-get install \
        --assume-yes \
        --no-install-recommends \
        r-cran-ggplot2 \
        r-cran-mgcv \
        r-cran-randomforest \
        r-cran-sm \
        r-cran-vegan

    rm -rf /var/lib/apt/lists/*

# -----------------------------------------------------
# Install R packages from source.

    echo "Installing source packages"
    rtemp=$(mktemp)

    cat > "${rtemp:?}" << 'EOF'
#!/usr/bin/Rscript

# Use the RStudio repo.
options(repos = c('http://cran.rstudio.com/'))

# https://cran.r-project.org/web/packages/dismo/index.html
install.packages("dismo")

# https://cran.r-project.org/web/packages/googleVis/
install.packages("googleVis")

# https://github.com/Debian/r-cran-knitr
install.packages("knitr")

# https://r-forge.r-project.org/R/?group_id=294
install.packages("raster")

# https://cran.r-project.org/web/packages/rgdal/index.html
install.packages("rgdal")

# https://cran.r-project.org/web/packages/rgeos/index.html
install.packages("rgeos")

EOF

    Rscript --vanilla "${rtemp:?}"




