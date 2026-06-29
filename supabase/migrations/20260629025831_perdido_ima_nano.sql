

ALTER TABLE pet_perdida_fotos
    ADD COLUMN id_file_nano uuid ;

ALTER TABLE "pet_perdida_fotos" ADD CONSTRAINT "perdida_perdida_file_nano" FOREIGN KEY ("id_file_nano") REFERENCES "files" ("id") DEFERRABLE INITIALLY IMMEDIATE;
