# -*- coding: utf-8 -*-
#
#  Basic example using QGIS Python shell
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


# No imports here because we must be inside
# QGIS Python shell (QGIS does this job)
layer = iface.activeLayer()

def printEachFeatBoundingBox():
    #print bounding box for each
    #feature in the layer
    features = layer.getFeatures()
    for ft in features:
        print ft.geometry().boundingBox().toString()

def printSelectedFeatBoundingBox():
    #print bounding box for all the selected features
    #area in the layer
    sel_feature = layer.selectedFeatures()[0]
    ly_sel_bb = sel_feature.geometry().boundingBox().toString()
    return ly_sel_bb

def printLayerExtent():
    #print bounding box and crs of the active layer
    ext = layer.extent().toString()
    crs = layer.crs().authid()
    return ext, crs
