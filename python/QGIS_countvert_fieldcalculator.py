# -*- coding: utf-8 -*-
#
#  Basic example using Python inside QGIS Field Calculator
#
#  Script based on an original idea from Ujaval Gandhi,
#  modified by Nathan Woodrow, to count vertices
#  in polygons. I added linestrings support.
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
from qgis.gui import *

@qgsfunction(args='auto', group='Custom')
def num_vertices(values, feature, parent):
    """
        Returns the number of vertices for a features geometry
    """
    count = None
    geom = feature.geometry()

    if geom is None:
        return None

    if geom.type() == QGis.Polygon:
        count = 0
        if geom.isMultipart():
            polygons = geom.asMultiPolygon()
        else:
            polygons = [ geom.asPolygon() ]

        for polygon in polygons:
            for ring in polygon:
                count += len(ring)

    elif geom.type() == QGis.Line:
        count = 0
        if geom.isMultipart():
            polylines = geom.asMultiPolyline()
        else:
            polylines = [ geom.asPolyline() ]
        for polyline in polylines:
            for ln_arc in polyline:
                count += len(ln_arc)

    return count
