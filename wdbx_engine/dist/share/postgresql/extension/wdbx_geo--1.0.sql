/* wdbx_geo/wdbx_geo--1.0.sql */

-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION wdbx_geo" to load this file. \quit

-- Convert GeoJSON Point to Postgres native point
CREATE OR REPLACE FUNCTION geojson_to_point(geom jsonb)
RETURNS point
LANGUAGE sql IMMUTABLE STRICT PARALLEL SAFE AS $$
  SELECT point(
    (geom->'coordinates'->>0)::float8,
    (geom->'coordinates'->>1)::float8
  ) WHERE geom->>'type' = 'Point';
$$;

-- Convert GeoJSON Polygon to Postgres native polygon
CREATE OR REPLACE FUNCTION geojson_to_polygon(geom jsonb)
RETURNS polygon
LANGUAGE sql IMMUTABLE STRICT PARALLEL SAFE AS $$
  SELECT polygon(
    (
      SELECT string_agg(
        '(' || (coord->>0) || ',' || (coord->>1) || ')', ','
      )
      FROM jsonb_array_elements(geom->'coordinates'->0) AS coord
    )
  ) WHERE geom->>'type' = 'Polygon';
$$;

-- Convert Postgres native point to GeoJSON Point
CREATE OR REPLACE FUNCTION point_to_geojson(p point)
RETURNS jsonb
LANGUAGE sql IMMUTABLE STRICT PARALLEL SAFE AS $$
  SELECT jsonb_build_object(
    'type', 'Point',
    'coordinates', jsonb_build_array(p[0], p[1])
  );
$$;

-- Convert Postgres native polygon to GeoJSON Polygon
CREATE OR REPLACE FUNCTION polygon_to_geojson(p polygon)
RETURNS jsonb
LANGUAGE sql IMMUTABLE STRICT PARALLEL SAFE AS $$
  SELECT jsonb_build_object(
    'type', 'Polygon',
    'coordinates', jsonb_build_array(
      (
        SELECT jsonb_agg(jsonb_build_array(point[0], point[1]))
        FROM (
          SELECT point(p[i]) as point
          FROM generate_series(0, npoints(p) - 1) as i
        ) points
      )
    )
  );
$$;
