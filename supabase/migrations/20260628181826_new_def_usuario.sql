

ALTER TABLE files
    ALTER COLUMN id_user SET NOT NULL;


drop table "user" cascade ;

CREATE TABLE "user" (
                        "id" uuid PRIMARY KEY NOT NULL,
                        "name" varchar(100),
                        "last_name" varchar(100),
                        "email" varchar(300) NOT NULL
);

ALTER TABLE "files" ADD CONSTRAINT "user_files" FOREIGN KEY ("id_user") REFERENCES "user" ("id") DEFERRABLE INITIALLY IMMEDIATE;
