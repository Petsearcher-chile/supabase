CREATE OR REPLACE FUNCTION caducar_pet_encontre_antiguos()
RETURNS integer
LANGUAGE plpgsql
AS $$
DECLARE
updated_rows integer;
BEGIN
UPDATE pet_encontre
SET estado = 'caducada'
WHERE estado = 'encontrada'
  AND date_creacion IS NOT NULL
  AND date_creacion <= NOW() - INTERVAL '14 days';

GET DIAGNOSTICS updated_rows = ROW_COUNT;
RETURN updated_rows;
END;
$$;


select cron.schedule(
               'caducar_pet_encontre_antiguos-cada-5-min',
               '*/5 * * * *',
               $$select public.caducar_pet_encontre_antiguos();$$
);
