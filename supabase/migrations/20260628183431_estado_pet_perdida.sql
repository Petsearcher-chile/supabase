
CREATE TYPE "estado_mascota" AS ENUM (
  'registrada',
  'en_proceso',
  'caducada',
  'eliminada'
);


ALTER TABLE pet_perdida
    ADD COLUMN estado estado_mascota NOT NULL DEFAULT 'registrada';