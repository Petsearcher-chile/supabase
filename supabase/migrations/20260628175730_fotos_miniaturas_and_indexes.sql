

ALTER TABLE "pet_perdida_fotos" ADD COLUMN "id_file_miniatura" uuid REFERENCES "files" ("id");

CREATE INDEX ON "pet_perdida" ("nombre_mascota");

CREATE INDEX ON "pet_perdida_fotos" ("id_perdida");

CREATE INDEX ON "pet_perdida_fotos" ("id_file");

CREATE INDEX ON "pet_perdida_fotos" ("id_file_miniatura");

