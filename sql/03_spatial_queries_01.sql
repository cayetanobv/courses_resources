-- SPATIAL QUERIES 01

SELECT postgis_full_version();

SELECT * FROM geometry_columns;

SELECT name, ST_GeometryType(geom), ST_NDims(geom), ST_SRID(geom)
FROM worlddata.ne_10m_admin_0_countries;

SELECT ST_AsText(geom)
FROM worlddata.ne_10m_admin_0_countries
WHERE name = 'Aruba';

SELECT ST_NumGeometries(geom)
FROM worlddata.ne_10m_admin_0_countries
WHERE name = 'Spain';
