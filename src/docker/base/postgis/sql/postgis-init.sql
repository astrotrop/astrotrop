-- <meta:header>
--   <meta:licence>
--     Copyright (c) 2015, ROE (http://www.roe.ac.uk/)
--
--     This information is free software: you can redistribute it and/or modify
--     it under the terms of the GNU General Public License as published by
--     the Free Software Foundation, either version 3 of the License, or
--     (at your option) any later version.
--
--     This information is distributed in the hope that it will be useful,
--     but WITHOUT ANY WARRANTY; without even the implied warranty of
--     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--     GNU General Public License for more details.
--  
--     You should have received a copy of the GNU General Public License
--     along with this program.  If not, see <http://www.gnu.org/licenses/>.
--   </meta:licence>
-- </meta:header>
--
-- Based on PostGIS instal instructions.
-- http://postgis.net/install/
--

-- Enable PostGIS (includes raster)
CREATE EXTENSION postgis;
-- Enable Topology
CREATE EXTENSION postgis_topology;
-- Enable PostGIS Advanced 3D 
-- and other geoprocessing algorithms
--CREATE EXTENSION postgis_sfcgal;
-- fuzzy matching needed for Tiger
--CREATE EXTENSION fuzzystrmatch;
-- rule based standardizer
--CREATE EXTENSION address_standardizer;
-- example rule data set
--CREATE EXTENSION address_standardizer_data_us;
-- Enable US Tiger Geocoder
--CREATE EXTENSION postgis_tiger_geocoder;


