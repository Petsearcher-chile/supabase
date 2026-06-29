


CREATE OR REPLACE FUNCTION caducar_pets_perdidas_registradas()
RETURNS integer
LANGUAGE plpgsql
AS $$
DECLARE
updated_count integer;
BEGIN
UPDATE "pet_perdida"
SET "estado" = 'caducada'::estado_mascota
WHERE "estado" = 'registrada'::estado_mascota
  AND "date_creacion" < (NOW() - INTERVAL '2 weeks');

GET DIAGNOSTICS updated_count = ROW_COUNT;
RETURN updated_count;
END;
$$;

select cron.schedule(
               'caducar-pets-perdidas-cada-5-min',
               '*/5 * * * *',
               $$select public.caducar_pets_perdidas_registradas();$$
);
