# -*- coding: utf-8 -*-
#
#  Basic example using QGIS proccesing power from Python without GUI
#
#  Author: Cayetano Benavent, 2015.
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#

from qgis.core import *


def crsTransform(lat, lon, epsg_in=4326, epsg_out=25830):
    """
    Transform CRS coordinates
    """
    try:
        epsgcrsid = QgsCoordinateReferenceSystem.EpsgCrsId
        crs_src = QgsCoordinateReferenceSystem(epsg_in, epsgcrsid)
        crs_dst = QgsCoordinateReferenceSystem(epsg_out, epsgcrsid)
        crs_transf = QgsCoordinateTransform(crs_src, crs_dst)

        pt1 = crs_transf.transform(QgsPoint(lon, lat))
        print("Transformed coordinates: x={0}, y={1}\n".format(pt1[0], pt1[1]))

    except Exception as err:
        print("\nTransformation error: {0}\n".format(err))
        raise SystemExit

def floatCoord(coor_str):
    """
    Cast strings coordinates from input to float
    """
    try:
        return float(coor_str)

    except ValueError:
        print("\nInvalid value for coordinates\n")
        raise SystemExit

def main():
    # supply path to where is your qgis installed
    QgsApplication.setPrefixPath("/usr/", True)
    msg = """
          Coordinates translator
          From CRS WGS84 lat/lon (4326)
          to ETRS89/UTMz30 (25830)
          """
    print("\n{0}\n".format(msg))

    # Example: lat = 36.87, lon = -5.67
    lat_str = raw_input("Latitude: ")
    lon_str = raw_input("Longitude: ")
    lat = floatCoord(lat_str)
    lon = floatCoord(lon_str)
    crsTransform(lat, lon)

if __name__ == '__main__':
    main()
