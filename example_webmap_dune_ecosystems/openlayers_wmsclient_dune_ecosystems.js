/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA 02110-1301, USA.
 * 
 */


var map;

function init() {
    
            //Creating map
            var options = {
                projection: "EPSG:900913",
                units: "m",
                maxResolution: 156543.0339,
                maxExtent: new OpenLayers.Bounds(-20037508, -20037508,
                                                 20037508, 20037508.34)
                };
            map = new OpenLayers.Map('map', options);
            
            //Creating legend items
            var legend_items = {
                                legend_plan_dunas: "REDIAM Plan de conservación de dunas <br><img src='http://www.juntadeandalucia.es/medioambiente/mapwms/REDIAM_plan_conservacion_dunas?version=1.1.1&amp;service=WMS&amp;request=GetLegendGraphic&amp;layer=plan_conservacion_dunas&amp;format=image/png&amp;STYLE=default'/>",
                                legend_ammophila: "REDIAM Dunas móviles con ammophila <br><img src='http://www.juntadeandalucia.es/medioambiente/mapwms/REDIAM_hic_dunas_moviles_blancas_ammophila?version=1.1.1&service=WMS&request=GetLegendGraphic&layer=hic_dunas_moviles_ammophila&format=image/png&STYLE=default'/>",
                                legend_dunasfijas: "REDIAM Dunas costeras fijas con vegetación herbácea <br><img src='http://www.juntadeandalucia.es/medioambiente/mapwms/REDIAM_hic_dunas_fijas_herbaceas?version=1.1.1&amp;service=WMS&amp;request=GetLegendGraphic&amp;layer=hic_dunas_fijas_herbaceas&amp;format=image/png&amp;STYLE=default'/>"
                                };
            
            //Creating layers (open street map is the base layer)
            var osm = new OpenLayers.Layer.OSM();
            
            var wms_plan_dunas = new OpenLayers.Layer.WMS(legend_items.legend_plan_dunas, 
                                    "http://www.juntadeandalucia.es/medioambiente/mapwms/REDIAM_plan_conservacion_dunas?",
                                    {layers:"plan_conservacion_dunas",transparent:true},
                                    {opacity: 0.5, isBaseLayer: false, projection: "EPSG:900913", attribution:"REDIAM. Junta de Andalucía"}
                                  );
            
            var wms_ammophila = new OpenLayers.Layer.WMS(legend_items.legend_ammophila,
                                    "http://www.juntadeandalucia.es/medioambiente/mapwms/REDIAM_hic_dunas_moviles_blancas_ammophila?",
                                    {layers:"hic_dunas_moviles_ammophila",transparent:true},
                                    {visibility: false, opacity: 0.8, isBaseLayer: false, projection: "EPSG:900913", attribution:"REDIAM. Junta de Andalucía"}
                                  );
            
            var wms_dunasfijas = new OpenLayers.Layer.WMS(legend_items.legend_dunasfijas, 
                                    "http://www.juntadeandalucia.es/medioambiente/mapwms/REDIAM_hic_dunas_fijas_herbaceas?",
                                    {layers:"REDIAM",transparent:true},
                                    {visibility: false, opacity: 0.8, isBaseLayer: false, projection: "EPSG:900913", attribution:"REDIAM. Junta de Andalucía"}
                                  );
            
            //Adding layers to map
            map.addLayers([osm, wms_plan_dunas, wms_ammophila, wms_dunasfijas]);
            
            //Creating and adding controls to map
            var legend = new OpenLayers.Control.LayerSwitcher();
            map.addControl(legend);
            
            var latlon = new OpenLayers.Control.MousePosition({ numDigits: 1 });
            map.addControl(latlon);
            
            var scale =new OpenLayers.Control.ScaleLine();
            map.addControl(scale);
            
            //Set map center (Andalusia)
            var center = new OpenLayers.LonLat(-550000, 4500000);
            map.setCenter(center, 8);
            
            var overview = new OpenLayers.Control.OverviewMap();
            map.addControl(overview);
            
            //Uncomment to zoom map to max extent
            //map.zoomToMaxExtent();
            
        }
