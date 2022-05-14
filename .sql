--------------------------------------------------------
--  File created - sobota-maja-14-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table KATEGORIE
--------------------------------------------------------

  CREATE TABLE "BANK"."KATEGORIE" 
   (	"KAT_ID" NUMBER, 
	"NAZWA" VARCHAR2(30 CHAR), 
	"OPIS" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "BANK"."KATEGORIE"."KAT_ID" IS 'Klucz g³ówny identyfikuj¹cy kategorie.';
   COMMENT ON COLUMN "BANK"."KATEGORIE"."NAZWA" IS 'Nazwa kategorii.';
   COMMENT ON COLUMN "BANK"."KATEGORIE"."OPIS" IS 'Opis szczegó³owy kategorii.';
--------------------------------------------------------
--  DDL for Table KLIENCI
--------------------------------------------------------

  CREATE TABLE "BANK"."KLIENCI" 
   (	"KLIENT_ID" NUMBER, 
	"IMIE" VARCHAR2(30 BYTE), 
	"NAZWISKO" VARCHAR2(50 BYTE), 
	"PLEC" VARCHAR2(1 CHAR), 
	"LOGIN" VARCHAR2(15 CHAR) GENERATED ALWAYS AS (LOWER(SUBSTR("IMIE",0,3)||'.'||SUBSTR("NAZWISKO",0,3))) VIRTUAL , 
	"EMAIL" VARCHAR2(75 BYTE), 
	"PESEL" NUMBER(11,0), 
	"F_CZY_AKTYWNY" VARCHAR2(1 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "BANK"."KLIENCI"."KLIENT_ID" IS 'Klucz g³ówny identyfikuj¹cy klienta';
   COMMENT ON COLUMN "BANK"."KLIENCI"."IMIE" IS 'Imiê klienta.';
   COMMENT ON COLUMN "BANK"."KLIENCI"."NAZWISKO" IS 'Nazwisko klienta.';
   COMMENT ON COLUMN "BANK"."KLIENCI"."PLEC" IS 'Zadeklarowana p³eæ klienta M - mê¿czyzna, K - kobieta, N - nie chce podawaæ.';
   COMMENT ON COLUMN "BANK"."KLIENCI"."LOGIN" IS 'Login do aplikacji mobilnej danego u¿ytkownika (klienta)';
   COMMENT ON COLUMN "BANK"."KLIENCI"."EMAIL" IS 'Adres e-mail klienta.';
   COMMENT ON COLUMN "BANK"."KLIENCI"."PESEL" IS 'Numer PESEL klienta.';
   COMMENT ON COLUMN "BANK"."KLIENCI"."F_CZY_AKTYWNY" IS 'Flaga czy klient aktywny.';
REM INSERTING into BANK.KATEGORIE
SET DEFINE OFF;
REM INSERTING into BANK.KLIENCI
SET DEFINE OFF;
--------------------------------------------------------
--  Constraints for Table KATEGORIE
--------------------------------------------------------

  ALTER TABLE "BANK"."KATEGORIE" MODIFY ("NAZWA" NOT NULL ENABLE);
  ALTER TABLE "BANK"."KATEGORIE" ADD PRIMARY KEY ("KAT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BANK"."KATEGORIE" ADD UNIQUE ("NAZWA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table KLIENCI
--------------------------------------------------------

  ALTER TABLE "BANK"."KLIENCI" MODIFY ("IMIE" NOT NULL ENABLE);
  ALTER TABLE "BANK"."KLIENCI" MODIFY ("NAZWISKO" NOT NULL ENABLE);
  ALTER TABLE "BANK"."KLIENCI" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "BANK"."KLIENCI" ADD PRIMARY KEY ("KLIENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BANK"."KLIENCI" ADD UNIQUE ("EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BANK"."KLIENCI" ADD UNIQUE ("PESEL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
