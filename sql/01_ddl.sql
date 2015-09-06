--DDL

--Database
CREATE DATABASE curso2015_gisdb
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'es_ES.UTF-8'
       LC_CTYPE = 'es_ES.UTF-8'
       CONNECTION LIMIT = -1;

--Adding PostGIS
CREATE EXTENSION postgis;

--Schema
CREATE SCHEMA worlddata
    AUTHORIZATION postgres;

--Tables

--Countries boundaries table
CREATE TABLE worlddata.ne_10m_admin_0_countries
(
  id serial NOT NULL,
  geom geometry(MultiPolygon,4326),
  scalerank integer,
  featurecla character varying(30),
  labelrank double precision,
  sovereignt character varying(32),
  sov_a3 character varying(3),
  adm0_dif double precision,
  level double precision,
  type character varying(17),
  admin character varying(40),
  adm0_a3 character varying(3),
  geou_dif double precision,
  geounit character varying(40),
  gu_a3 character varying(3),
  su_dif double precision,
  subunit character varying(40),
  su_a3 character varying(3),
  brk_diff double precision,
  name character varying(36),
  name_long character varying(40),
  brk_a3 character varying(3),
  brk_name character varying(36),
  brk_group character varying(30),
  abbrev character varying(13),
  postal character varying(4),
  formal_en character varying(52),
  formal_fr character varying(35),
  note_adm0 character varying(22),
  note_brk character varying(164),
  name_sort character varying(36),
  name_alt character varying(38),
  mapcolor7 double precision,
  mapcolor8 double precision,
  mapcolor9 double precision,
  mapcolor13 double precision,
  pop_est double precision,
  gdp_md_est double precision,
  pop_year double precision,
  lastcensus double precision,
  gdp_year double precision,
  economy character varying(26),
  income_grp character varying(23),
  wikipedia double precision,
  fips_10_ character varying(3),
  iso_a2 character varying(5),
  iso_a3 character varying(3),
  iso_n3 character varying(3),
  un_a3 character varying(4),
  wb_a2 character varying(3),
  wb_a3 character varying(3),
  woe_id double precision,
  woe_id_eh double precision,
  woe_note character varying(190),
  adm0_a3_is character varying(3),
  adm0_a3_us character varying(3),
  adm0_a3_un double precision,
  adm0_a3_wb double precision,
  continent character varying(23),
  region_un character varying(23),
  subregion character varying(25),
  region_wb character varying(26),
  name_len double precision,
  long_len double precision,
  abbrev_len double precision,
  tiny double precision,
  homepart double precision,
  CONSTRAINT ne_10m_admin_0_countries_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE worlddata.ne_10m_admin_0_countries
  OWNER TO postgres;

CREATE INDEX sidx_ne_10m_admin_0_countries_geom
  ON worlddata.ne_10m_admin_0_countries
  USING gist
  (geom);

--Rivers table
CREATE TABLE worlddata.ne_10m_rivers_lake_centerlines
(
  id serial NOT NULL,
  geom geometry(MultiLineString,4326),
  dissolve character varying(100),
  scalerank double precision,
  featurecla character varying(32),
  name character varying(254),
  name_alt character varying(254),
  rivernum integer,
  note character varying(200),
  CONSTRAINT ne_10m_rivers_lake_centerlines_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE worlddata.ne_10m_rivers_lake_centerlines
  OWNER TO postgres;

CREATE INDEX sidx_ne_10m_rivers_lake_centerlines_geom
  ON worlddata.ne_10m_rivers_lake_centerlines
  USING gist
  (geom);

--WDPA table
CREATE TABLE worlddata."WDPA_July2015_MAR_poly"
(
  id serial NOT NULL,
  geom geometry(MultiPolygon,4326),
  wdpaid integer,
  wdpa_pid integer,
  pa_def character varying(80),
  name character varying(80),
  orig_name character varying(80),
  desig character varying(80),
  desig_eng character varying(80),
  desig_type character varying(80),
  iucn_cat character varying(80),
  int_crit character varying(80),
  marine character varying(80),
  rep_m_area numeric,
  gis_m_area numeric,
  rep_area numeric,
  gis_area numeric,
  no_take character varying(80),
  no_tk_area numeric,
  status character varying(80),
  status_yr integer,
  gov_type character varying(80),
  own_type character varying(80),
  mang_auth character varying(87),
  mang_plan character varying(80),
  verif character varying(80),
  metadataid integer,
  sub_loc character varying(80),
  parent_iso character varying(80),
  iso3 character varying(80),
  CONSTRAINT "WDPA_July2015_MAR_poly_pkey" PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE worlddata."WDPA_July2015_MAR_poly"
  OWNER TO postgres;

CREATE INDEX "sidx_WDPA_July2015_MAR_poly_geom"
  ON worlddata."WDPA_July2015_MAR_poly"
  USING gist
  (geom);
