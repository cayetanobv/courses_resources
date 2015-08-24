-- SPATIAL QUERIES 02

-- Creating a view with geometries
CREATE OR REPLACE VIEW worlddata.caribe_ct_geom AS
  SELECT name, pop_est, geom
  FROM worlddata.ne_10m_admin_0_countries
  WHERE subregion = 'Caribbean' AND pop_est > 1000000;

/* Reprojecting layer to UTMz29 projection(same Geodetic Reference System: WGS84)
 Important: explicit cast to register geometry in geometry_columns
and indexing geometries with GIST index
*/
CREATE TABLE worlddata.morocco_bdr AS
  SELECT id, name, ST_Transform(geom, 32629)::geometry(MultiPolygon, 32629) AS geom
  FROM worlddata.ne_10m_admin_0_countries
  WHERE name = 'Morocco';
CREATE INDEX morocco_bdr_gist
    ON  worlddata.morocco_bdr USING GIST (geom);

--Spatial relations
CREATE TABLE worlddata.morocco_rivers AS
  SELECT rv.id, rv.name, ST_Transform(rv.geom, 32629)::geometry(Multilinestring, 32629) AS geom
  FROM worlddata.ne_10m_admin_0_countries AS wc, worlddata.ne_10m_rivers_lake_centerlines AS rv
  WHERE ST_Intersects(rv.geom, wc.geom) AND wc.name = 'Morocco';
CREATE INDEX morocco_rivers_gist
    ON  worlddata.morocco_rivers USING GIST (geom);
