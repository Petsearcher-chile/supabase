CREATE TABLE "mapbox_addresses" (
                                    "id" uuid PRIMARY KEY DEFAULT (uuid_generate_v4()),
                                    "full_address" text NOT NULL,
                                    "longitude" decimal NOT NULL,
                                    "latitude" decimal NOT NULL,
                                    "country" varchar,
                                    "region" varchar,
                                    "city" varchar,
                                    "postcode" varchar,
                                    "street" varchar,
                                    "house_number" varchar,
                                    "created_at" timestamp NOT NULL DEFAULT (now()),
                                    "updated_at" timestamp NOT NULL DEFAULT (now())
);

CREATE INDEX "idx_coordenadas" ON "mapbox_addresses" ("longitude", "latitude");


COMMENT ON COLUMN "mapbox_addresses"."full_address" IS 'Corresponde al "place_name" de Mapbox';

COMMENT ON COLUMN "mapbox_addresses"."longitude" IS 'Coordenada X (lng)';

COMMENT ON COLUMN "mapbox_addresses"."latitude" IS 'Coordenada Y (lat)';

COMMENT ON COLUMN "mapbox_addresses"."country" IS 'Ej: Chile';

COMMENT ON COLUMN "mapbox_addresses"."region" IS 'Estado o Región. Ej: Región de Coquimbo';

COMMENT ON COLUMN "mapbox_addresses"."city" IS 'Ciudad o Comuna. Ej: La Serena';

COMMENT ON COLUMN "mapbox_addresses"."street" IS 'Nombre de la calle';

COMMENT ON COLUMN "mapbox_addresses"."house_number" IS 'Numeración';

ALTER TABLE "pet_perdida" ADD CONSTRAINT "mapbox_addresses_pet_perdida" FOREIGN KEY ("id_address") REFERENCES "mapbox_addresses" ("id") DEFERRABLE INITIALLY IMMEDIATE;
