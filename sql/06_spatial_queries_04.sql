--Spatial joins
CREATE TABLE worlddata.rnd_pts_wdpa AS
  SELECT rnd.gid, rnd.geom::geometry(Point, 32629) as geom, wdpa.name, wdpa.desig_eng
  FROM worlddata.rnd_pts AS rnd
  JOIN worlddata."WDPA_July2015_MAR_poly" AS wdpa
  ON ST_Contains(ST_Transform(wdpa.geom,32629), rnd.geom)
  WHERE wdpa.desig_type = 'International';
CREATE INDEX rnd_pts_wdpa_gist
    ON  worlddata.rnd_pts_wdpa USING GIST (geom);

--Distance
CREATE OR REPLACE VIEW worlddata.rnd_pts_wdpa_riv20km AS
SELECT wdpa.gid, wdpa.name, wdpa.geom
FROM worlddata.morocco_rivers AS rv, worlddata.rnd_pts_wdpa AS wdpa
WHERE ST_DWithin(wdpa.geom, rv.geom, 20000);
