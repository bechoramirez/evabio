BEGIN;
--
-- Create model Antropometria
--
CREATE TABLE "principal_antropometria" ("id" serial NOT NULL PRIMARY KEY, "fecha" date NOT NULL, "peso" double precision NOT NULL, "altura" double precision NOT NULL, "bisep" double precision NOT NULL, "trisep" double precision NOT NULL, "cuadrisep" double precision NOT NULL);
--
-- Create model Cheque
--
CREATE TABLE "principal_cheque" ("id" serial NOT NULL PRIMARY KEY, "nom_banco" varchar(200) NOT NULL, "nro_cheque" integer NOT NULL, "fecha_chque" date NOT NULL, "monto_cheque" integer NOT NULL, "estado_cheque" varchar(200) NOT NULL);
--
-- Create model Cliente
--
CREATE TABLE "principal_cliente" ("id" serial NOT NULL PRIMARY KEY, "nombre" varchar(200) NOT NULL, "apellido" varchar(200) NOT NULL, "fec_nac" date NOT NULL, "genero" varchar(1) NOT NULL);
--
-- Create model Evaluacion
--
CREATE TABLE "principal_evaluacion" ("id" serial NOT NULL PRIMARY KEY, "fecha_evaluacion" timestamp with time zone NOT NULL, "cliente_id" integer NOT NULL);
--
-- Create model Genero
--
CREATE TABLE "principal_genero" ("id" serial NOT NULL PRIMARY KEY, "nombre" varchar(200) NOT NULL);
--
-- Create model Test
--
CREATE TABLE "principal_test" ("id" serial NOT NULL PRIMARY KEY, "nombre_test" varchar(200) NOT NULL, "precio_test" varchar(200) NOT NULL);
--
-- Create model TestParametros
--
CREATE TABLE "principal_testparametros" ("id" serial NOT NULL PRIMARY KEY, "descripcion" varchar(100) NOT NULL, "valor" integer NOT NULL, "genero" varchar(1) NOT NULL, "test_id" integer NOT NULL);
--
-- Create model TipoTarjeta
--
CREATE TABLE "principal_tipotarjeta" ("id" serial NOT NULL PRIMARY KEY, "descripcion" varchar(200) NOT NULL);
--
-- Add field test to evaluacion
--
ALTER TABLE "principal_evaluacion" ADD COLUMN "test_id" integer NOT NULL;
--
-- Add field test_parametro to evaluacion
--
ALTER TABLE "principal_evaluacion" ADD COLUMN "test_parametro_id" integer NOT NULL;
--
-- Add field cliente to antropometria
--
ALTER TABLE "principal_antropometria" ADD COLUMN "cliente_id" integer NOT NULL;
ALTER TABLE "principal_evaluacion" ADD CONSTRAINT "principal_evaluacion_cliente_id_68c81ef4_fk_principal" FOREIGN KEY ("cliente_id") REFERENCES "principal_cliente" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "principal_evaluacion_cliente_id_68c81ef4" ON "principal_evaluacion" ("cliente_id");
ALTER TABLE "principal_testparametros" ADD CONSTRAINT "principal_testparametros_test_id_964255c2_fk_principal_test_id" FOREIGN KEY ("test_id") REFERENCES "principal_test" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "principal_testparametros_test_id_964255c2" ON "principal_testparametros" ("test_id");
CREATE INDEX "principal_evaluacion_test_id_cd984421" ON "principal_evaluacion" ("test_id");
ALTER TABLE "principal_evaluacion" ADD CONSTRAINT "principal_evaluacion_test_id_cd984421_fk_principal_test_id" FOREIGN KEY ("test_id") REFERENCES "principal_test" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "principal_evaluacion_test_parametro_id_68205c31" ON "principal_evaluacion" ("test_parametro_id");
ALTER TABLE "principal_evaluacion" ADD CONSTRAINT "principal_evaluacion_test_parametro_id_68205c31_fk_principal" FOREIGN KEY ("test_parametro_id") REFERENCES "principal_testparametros" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "principal_antropometria_cliente_id_d0697dbd" ON "principal_antropometria" ("cliente_id");
ALTER TABLE "principal_antropometria" ADD CONSTRAINT "principal_antropomet_cliente_id_d0697dbd_fk_principal" FOREIGN KEY ("cliente_id") REFERENCES "principal_cliente" ("id") DEFERRABLE INITIALLY DEFERRED;
COMMIT;
