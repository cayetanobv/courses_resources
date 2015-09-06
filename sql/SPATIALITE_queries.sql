--SPATIALITE sql spatial queries are lightly different from PostGIS

-- BASIC QUERIES (no spatial)
SELECT name FROM ne_10m_admin_0_countries
WHERE continent = 'Africa';

SELECT continent, SUM(pop_est) AS population
FROM ne_10m_admin_0_countries GROUP BY continent;

SELECT name, pop_est FROM ne_10m_admin_0_countries
WHERE subregion = 'Caribbean' AND pop_est > 1000000;

CREATE VIEW caribe_ct AS
    SELECT name, pop_est FROM ne_10m_admin_0_countries
    WHERE subregion = 'Caribbean' AND pop_est > 1000000;

-- SPATIAL QUERIES
SELECT * FROM geometry_columns;

SELECT name, ST_GeometryType(geom), ST_NDims(geom), ST_SRID(geom)
FROM ne_10m_admin_0_countries;

SELECT ST_AsText(geom)
FROM ne_10m_admin_0_countries
WHERE name = 'Aruba';

SELECT ST_NumGeometries(geom)
FROM ne_10m_admin_0_countries
WHERE name = 'Spain';

--Creating tables from spatial queries
CREATE TABLE morocco_bdr (name TEXT NOT NULL);
SELECT AddGeometryColumn('morocco_bdr','geom', 32629, 'MULTIPOLYGON', 2, 1);
INSERT INTO morocco_bdr(name, geom)
  SELECT name, ST_Transform(geom, 32629) AS geom
  FROM ne_10m_admin_0_countries
  WHERE name = 'Morocco';

--Creating spatial views
CREATE VIEW caribe_ct_geom AS
  SELECT name, pop_est, geom, pk as rowid
  FROM ne_10m_admin_0_countries
  WHERE subregion = 'Caribbean' AND pop_est > 1000000
--registering as a spatial view
INSERT INTO views_geometry_columns (view_name, view_geometry,view_rowid,
  f_table_name, f_geometry_column, read_only)
  VALUES('caribe_ct_geom', 'geom', 'rowid', 'ne_10m_admin_0_countries',
      'geom', 1);
