#
# Copyright (c) 2014, ROE (http://www.roe.ac.uk/)
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

FROM metagrid/notroot-fedora
MAINTAINER Dave Morris <docker-admin@metagrid.co.uk>

#
# Install texlive
RUN yum install -y texlive
RUN yum install -y texlive-latex 
RUN yum install -y texlive-latex-bin

RUN yum install -y texlive-cm
RUN yum install -y texlive-cm-lgc
RUN yum install -y texlive-cm-super
RUN yum install -y texlive-cm-unicode

RUN yum install -y texlive-csquotes

RUN yum install -y texlive-collection-mathextra
RUN yum install -y texlive-collection-fontsextra

RUN yum install -y texlive-bibtex
RUN yum install -y texlive-biblatex

#RUN yum install -y texlive-babel-greek

#RUN yum install -y texlive-cbfonts
#RUN yum install -y texlive-cbfonts-fd

#RUN yum install -y texlive-greek-fontenc
#RUN yum install -y texlive-greek-inputenc

RUN yum install -y texlive-texconfig
RUN texconfig rehash



