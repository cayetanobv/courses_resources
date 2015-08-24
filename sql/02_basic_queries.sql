-- BASIC QUERIES
SELECT name FROM worlddata.ne_10m_admin_0_countries
WHERE continent = 'Africa';

SELECT continent, SUM(pop_est) AS population
FROM worlddata.ne_10m_admin_0_countries GROUP BY continent;

SELECT name, pop_est FROM worlddata.ne_10m_admin_0_countries
WHERE subregion = 'Caribbean' AND pop_est > 1000000;

CREATE OR REPLACE VIEW worlddata.caribe_ct AS
  SELECT name, pop_est FROM worlddata.ne_10m_admin_0_countries
  WHERE subregion = 'Caribbean' AND pop_est > 1000000;
