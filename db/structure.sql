CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "active_storage_blobs" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "key" varchar NOT NULL, "filename" varchar NOT NULL, "content_type" varchar, "metadata" text, "service_name" varchar NOT NULL, "byte_size" bigint NOT NULL, "checksum" varchar, "created_at" datetime(6) NOT NULL);
CREATE UNIQUE INDEX "index_active_storage_blobs_on_key" ON "active_storage_blobs" ("key") /*application='Greennavi'*/;
CREATE TABLE IF NOT EXISTS "active_storage_attachments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL, "record_type" varchar NOT NULL, "record_id" bigint NOT NULL, "blob_id" bigint NOT NULL, "created_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_c3b3935057"
FOREIGN KEY ("blob_id")
  REFERENCES "active_storage_blobs" ("id")
);
CREATE INDEX "index_active_storage_attachments_on_blob_id" ON "active_storage_attachments" ("blob_id") /*application='Greennavi'*/;
CREATE UNIQUE INDEX "index_active_storage_attachments_uniqueness" ON "active_storage_attachments" ("record_type", "record_id", "name", "blob_id") /*application='Greennavi'*/;
CREATE TABLE IF NOT EXISTS "prefectures" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "equipment" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "playgrounds" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "parks" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" bigint, "prefecture_id" bigint, "name" varchar, "introduction" text, "address" varchar, "latitude" float, "longitude" float, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_ecabde2ee3"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
, CONSTRAINT "fk_rails_adfb6983de"
FOREIGN KEY ("prefecture_id")
  REFERENCES "prefectures" ("id")
);
CREATE INDEX "index_parks_on_user_id" ON "parks" ("user_id") /*application='Greennavi'*/;
CREATE INDEX "index_parks_on_prefecture_id" ON "parks" ("prefecture_id") /*application='Greennavi'*/;
CREATE TABLE IF NOT EXISTS "park_playgrounds" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "park_id" bigint, "playground_id" bigint, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_dda055afee"
FOREIGN KEY ("park_id")
  REFERENCES "parks" ("id")
, CONSTRAINT "fk_rails_06d1e540f8"
FOREIGN KEY ("playground_id")
  REFERENCES "playgrounds" ("id")
);
CREATE INDEX "index_park_playgrounds_on_park_id" ON "park_playgrounds" ("park_id") /*application='Greennavi'*/;
CREATE INDEX "index_park_playgrounds_on_playground_id" ON "park_playgrounds" ("playground_id") /*application='Greennavi'*/;
CREATE TABLE IF NOT EXISTS "park_equipments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "park_id" bigint, "equipment_id" bigint, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_c405bf7520"
FOREIGN KEY ("equipment_id")
  REFERENCES "equipment" ("id")
, CONSTRAINT "fk_rails_6e5752d5ca"
FOREIGN KEY ("park_id")
  REFERENCES "parks" ("id")
);
CREATE INDEX "index_park_equipments_on_park_id" ON "park_equipments" ("park_id") /*application='Greennavi'*/;
CREATE INDEX "index_park_equipments_on_equipment_id" ON "park_equipments" ("equipment_id") /*application='Greennavi'*/;
CREATE TABLE IF NOT EXISTS "active_storage_variant_records" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "blob_id" bigint NOT NULL, "variation_digest" varchar NOT NULL);
CREATE UNIQUE INDEX "index_active_storage_variant_records_uniqueness" ON "active_storage_variant_records" ("blob_id", "variation_digest") /*application='Greennavi'*/;
CREATE TABLE IF NOT EXISTS "users" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime(6), "remember_created_at" datetime(6), "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "prefecture_id" bigint, "name" varchar, "introduction" text, "is_active" boolean DEFAULT 1);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email") /*application='Greennavi'*/;
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token") /*application='Greennavi'*/;
CREATE TABLE IF NOT EXISTS "park_comments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer NOT NULL, "park_id" integer NOT NULL, "body" text, "is_active" boolean DEFAULT 1 NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_b4c3fdc546"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
, CONSTRAINT "fk_rails_7df0b2d684"
FOREIGN KEY ("park_id")
  REFERENCES "parks" ("id")
);
CREATE INDEX "index_park_comments_on_user_id" ON "park_comments" ("user_id") /*application='Greennavi'*/;
CREATE INDEX "index_park_comments_on_park_id" ON "park_comments" ("park_id") /*application='Greennavi'*/;
CREATE TABLE IF NOT EXISTS "admins" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime(6), "remember_created_at" datetime(6), "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE UNIQUE INDEX "index_admins_on_email" ON "admins" ("email") /*application='Greennavi'*/;
CREATE UNIQUE INDEX "index_admins_on_reset_password_token" ON "admins" ("reset_password_token") /*application='Greennavi'*/;
CREATE TABLE IF NOT EXISTS "favorites" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer NOT NULL, "park_id" integer NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_d15744e438"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
, CONSTRAINT "fk_rails_d1362dad7d"
FOREIGN KEY ("park_id")
  REFERENCES "parks" ("id")
);
CREATE INDEX "index_favorites_on_user_id" ON "favorites" ("user_id") /*application='Greennavi'*/;
CREATE INDEX "index_favorites_on_park_id" ON "favorites" ("park_id") /*application='Greennavi'*/;
CREATE UNIQUE INDEX "index_favorites_on_user_id_and_park_id" ON "favorites" ("user_id", "park_id") /*application='Greennavi'*/;
CREATE TABLE IF NOT EXISTS "communities" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "introduction" text, "is_active" boolean DEFAULT 1 NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "community_memberships" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer NOT NULL, "community_id" integer NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_2acbed9229"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
, CONSTRAINT "fk_rails_5275a2ad88"
FOREIGN KEY ("community_id")
  REFERENCES "communities" ("id")
);
CREATE INDEX "index_community_memberships_on_user_id" ON "community_memberships" ("user_id") /*application='Greennavi'*/;
CREATE INDEX "index_community_memberships_on_community_id" ON "community_memberships" ("community_id") /*application='Greennavi'*/;
CREATE TABLE IF NOT EXISTS "community_comments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer NOT NULL, "community_id" integer NOT NULL, "body" text, "is_active" boolean DEFAULT 1 NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_e2ac5eda46"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
, CONSTRAINT "fk_rails_163ed2dcc6"
FOREIGN KEY ("community_id")
  REFERENCES "communities" ("id")
);
CREATE INDEX "index_community_comments_on_user_id" ON "community_comments" ("user_id") /*application='Greennavi'*/;
CREATE INDEX "index_community_comments_on_community_id" ON "community_comments" ("community_id") /*application='Greennavi'*/;
INSERT INTO "schema_migrations" (version) VALUES
('20261023012553'),
('20261021072638'),
('20261021071434'),
('20261021071200'),
('20261021045213'),
('20261016004730'),
('20261015003507'),
('20261009051811'),
('20261008040504'),
('20261008040101'),
('20261007070710'),
('20261006053644'),
('20261006053553'),
('20261006053512'),
('20261006053329'),
('20261006053131'),
('20261005060532'),
('20261005050712'),
('20261005040111'),
('20261002073429');

