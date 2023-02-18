--------------------------------------------------------
-- All insert rows with personal data are fake - only for db working and perfomance testing 
-- File created - saturday-18-02-2023
-- Full current state of the database    
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Type R_TRANSACTION_TOP
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "BANK"."R_TRANSACTION_TOP" as object(trns_id number, trns_kwota number(38), trns_kiedy timestamp(6));

/
--------------------------------------------------------
--  DDL for Type T_TRANSACTIONS_TOP
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "BANK"."T_TRANSACTIONS_TOP" as table of r_transaction_top;

/
--------------------------------------------------------
--  DDL for Sequence ADR_HIST_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BANK"."ADR_HIST_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence AUTO_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BANK"."AUTO_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence LOG_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BANK"."LOG_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1055 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence TRNS_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BANK"."TRNS_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 38 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table ADRESY
--------------------------------------------------------

  CREATE TABLE "BANK"."ADRESY" 
   (	"ADRES_ID" NUMBER, 
	"KRAJ" VARCHAR2(50 CHAR), 
	"MIASTO" VARCHAR2(60 CHAR), 
	"ULICA" VARCHAR2(50 CHAR) DEFAULT NULL, 
	"NR_BUD" VARCHAR2(10 CHAR), 
	"NR_MIESZ" NUMBER(4,0) DEFAULT NULL, 
	"KOD_POCZTOWY" VARCHAR2(10 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "BANK"."ADRESY"."ADRES_ID" IS 'Klucz g≥Ûwny identyfikujπcy adres.';
   COMMENT ON COLUMN "BANK"."ADRESY"."KRAJ" IS 'Kraj.';
   COMMENT ON COLUMN "BANK"."ADRESY"."MIASTO" IS 'MiejscowoúÊ.';
   COMMENT ON COLUMN "BANK"."ADRESY"."ULICA" IS 'Ulica.';
   COMMENT ON COLUMN "BANK"."ADRESY"."NR_BUD" IS 'Numer budynku.';
   COMMENT ON COLUMN "BANK"."ADRESY"."NR_MIESZ" IS 'Numer mieszkania lub apartamentu.';
   COMMENT ON COLUMN "BANK"."ADRESY"."KOD_POCZTOWY" IS 'Kod pocztowy.';
   COMMENT ON TABLE "BANK"."ADRESY"  IS 'Tabela zawierajπca adresy klientÛw podane przy rejestracji konta.';
--------------------------------------------------------
--  DDL for Table ADRESY_HIST
--------------------------------------------------------

  CREATE TABLE "BANK"."ADRESY_HIST" 
   (	"ADR_HIST_ID" NUMBER, 
	"DATA_OPERACJI" TIMESTAMP (6) DEFAULT SYSDATE, 
	"KRAJ" VARCHAR2(50 CHAR), 
	"MIASTO" VARCHAR2(60 CHAR), 
	"ULICA" VARCHAR2(50 CHAR) DEFAULT NULL, 
	"NR_BUD" VARCHAR2(10 CHAR), 
	"NR_MIESZ" NUMBER(4,0) DEFAULT NULL, 
	"KOD_POCZTOWY" VARCHAR2(10 CHAR), 
	"KRAJ_NEW" VARCHAR2(50 CHAR), 
	"MIASTO_NEW" VARCHAR2(60 CHAR), 
	"ULICA_NEW" VARCHAR2(50 CHAR), 
	"NR_BUD_NEW" VARCHAR2(10 CHAR), 
	"NR_MIESZ_NEW" NUMBER(4,0), 
	"KOD_POCZTOWY_NEW" VARCHAR2(10 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "BANK"."ADRESY_HIST"."ADR_HIST_ID" IS 'Klucz g≥Ûwny identyfikujπcy adres.';
   COMMENT ON COLUMN "BANK"."ADRESY_HIST"."DATA_OPERACJI" IS 'Kiedy zmodyfikowano dane.';
   COMMENT ON COLUMN "BANK"."ADRESY_HIST"."KRAJ" IS 'Kraj.';
   COMMENT ON COLUMN "BANK"."ADRESY_HIST"."MIASTO" IS 'MiejscowoúÊ.';
   COMMENT ON COLUMN "BANK"."ADRESY_HIST"."ULICA" IS 'Ulica.';
   COMMENT ON COLUMN "BANK"."ADRESY_HIST"."NR_BUD" IS 'Numer budynku.';
   COMMENT ON COLUMN "BANK"."ADRESY_HIST"."NR_MIESZ" IS 'Numer mieszkania lub apartamentu.';
   COMMENT ON COLUMN "BANK"."ADRESY_HIST"."KOD_POCZTOWY" IS 'Kod pocztowy.';
   COMMENT ON COLUMN "BANK"."ADRESY_HIST"."KRAJ_NEW" IS 'Kraj - nowa wartoúÊ.';
   COMMENT ON COLUMN "BANK"."ADRESY_HIST"."MIASTO_NEW" IS 'MiejscowoúÊ - nowa wartoúÊ.';
   COMMENT ON COLUMN "BANK"."ADRESY_HIST"."ULICA_NEW" IS 'Ulica - nowa wartoúÊ.';
   COMMENT ON COLUMN "BANK"."ADRESY_HIST"."NR_BUD_NEW" IS 'Numer budynku - nowa wartoúÊ.';
   COMMENT ON COLUMN "BANK"."ADRESY_HIST"."NR_MIESZ_NEW" IS 'Numer mieszkania lub apartamentu - nowa wartoúÊ.';
   COMMENT ON COLUMN "BANK"."ADRESY_HIST"."KOD_POCZTOWY_NEW" IS 'Kod pocztowy - nowa wartoúÊ.';
   COMMENT ON TABLE "BANK"."ADRESY_HIST"  IS 'Tabela zawierajπca historyczne zmiany adresÛw klientÛw.';
--------------------------------------------------------
--  DDL for Table KATEGORIE
--------------------------------------------------------

  CREATE TABLE "BANK"."KATEGORIE" 
   (	"KAT_ID" NUMBER, 
	"NAZWA" VARCHAR2(30 CHAR), 
	"OPIS" VARCHAR2(250 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "BANK"."KATEGORIE"."KAT_ID" IS 'Klucz g≥Ûwny identyfikujπcy kategorie.';
   COMMENT ON COLUMN "BANK"."KATEGORIE"."NAZWA" IS 'Nazwa kategorii.';
   COMMENT ON COLUMN "BANK"."KATEGORIE"."OPIS" IS 'Opis szczegÛ≥owy kategorii.';
   COMMENT ON TABLE "BANK"."KATEGORIE"  IS 'Tabela przechowujπca informacje o kategoriach transakcji.';
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
	"PESEL" VARCHAR2(11 CHAR), 
	"F_CZY_AKTYWNY" VARCHAR2(1 CHAR) DEFAULT 'T', 
	"KL_ADRES_ID" NUMBER, 
	"PESEL_VALID" VARCHAR2(4000 CHAR) GENERATED ALWAYS AS ("BANK"."BANK_PCKG_UTILITIES"."F_VALIDATE_PESEL"("KLIENT_ID")) VIRTUAL 
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "BANK"."KLIENCI"."KLIENT_ID" IS 'Klucz g≥Ûwny identyfikujπcy klienta.';
   COMMENT ON COLUMN "BANK"."KLIENCI"."IMIE" IS 'ImiÍ klienta.';
   COMMENT ON COLUMN "BANK"."KLIENCI"."NAZWISKO" IS 'Nazwisko klienta.';
   COMMENT ON COLUMN "BANK"."KLIENCI"."PLEC" IS 'Zadeklarowana p≥eÊ klienta M - mÍøczyzna, K - kobieta, N - nie chce podawaÊ.';
   COMMENT ON COLUMN "BANK"."KLIENCI"."LOGIN" IS 'Login do aplikacji mobilnej danego uøytkownika (klienta).';
   COMMENT ON COLUMN "BANK"."KLIENCI"."EMAIL" IS 'Adres e-mail klienta.';
   COMMENT ON COLUMN "BANK"."KLIENCI"."PESEL" IS 'Numer PESEL klienta.';
   COMMENT ON COLUMN "BANK"."KLIENCI"."F_CZY_AKTYWNY" IS 'Flaga czy klient aktywny.';
   COMMENT ON COLUMN "BANK"."KLIENCI"."KL_ADRES_ID" IS 'Referencja do tabeli adresy.';
   COMMENT ON TABLE "BANK"."KLIENCI"  IS 'Tabela przechowujπca informacje o klientach.';
--------------------------------------------------------
--  DDL for Table KLIENCI2
--------------------------------------------------------

  CREATE TABLE "BANK"."KLIENCI2" 
   (	"KLIENT_ID" NUMBER, 
	"IMIE" VARCHAR2(30 BYTE), 
	"NAZWISKO" VARCHAR2(50 BYTE), 
	"PLEC" VARCHAR2(1 CHAR), 
	"LOGIN" VARCHAR2(15 CHAR) GENERATED ALWAYS AS (LOWER(SUBSTR("BANK"."BANK_PCKG_UTILITIES"."PARSER"("IMIE"),0,3)||'.'||SUBSTR("BANK"."BANK_PCKG_UTILITIES"."PARSER"("NAZWISKO"),0,3))) VIRTUAL , 
	"EMAIL" VARCHAR2(75 BYTE), 
	"PESEL" VARCHAR2(11 CHAR), 
	"F_CZY_AKTYWNY" VARCHAR2(1 CHAR) DEFAULT 'T'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table KLIENCI_HIST
--------------------------------------------------------

  CREATE TABLE "BANK"."KLIENCI_HIST" 
   (	"KLIENT_ID" NUMBER, 
	"LOGIN" VARCHAR2(15 CHAR), 
	"EMAIL_OLD" VARCHAR2(75 BYTE), 
	"EMAIL_NEW" VARCHAR2(75 BYTE), 
	"KTO_MODYFIKOWAL" VARCHAR2(50 CHAR) DEFAULT user, 
	"KIEDY_MODYFIKOWANO" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table KODY_UE
--------------------------------------------------------

  CREATE TABLE "BANK"."KODY_UE" 
   (	"KRAJ_ID" NUMBER, 
	"KRAJ_NAZWA" VARCHAR2(50 CHAR), 
	"KRAJ_KOD" VARCHAR2(2 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "BANK"."KODY_UE"."KRAJ_ID" IS 'Identyfikator kraju.';
   COMMENT ON COLUMN "BANK"."KODY_UE"."KRAJ_NAZWA" IS 'PaÒstwo.';
   COMMENT ON COLUMN "BANK"."KODY_UE"."KRAJ_KOD" IS 'Kod kraju.';
   COMMENT ON TABLE "BANK"."KODY_UE"  IS 'Kody krajÛw Unii Europejskiej stosowane w numerze rachunku w formacie IBAN.';
  GRANT SELECT ON "BANK"."KODY_UE" TO "HR";
  GRANT DELETE ON "BANK"."KODY_UE" TO "HR";
--------------------------------------------------------
--  DDL for Table KONTA
--------------------------------------------------------

  CREATE TABLE "BANK"."KONTA" 
   (	"KONTO_ID" NUMBER, 
	"KONTO_NR" NUMBER(26,0), 
	"KONTO_OSZCZ_ID" NUMBER DEFAULT NULL, 
	"KONTO_F_CZY_AKTYWNE" VARCHAR2(1 CHAR) DEFAULT 'T', 
	"KONTO_KR_ID" NUMBER, 
	"KONTO_WLASC_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "BANK"."KONTA"."KONTO_ID" IS 'Klucz g≥Ûwny identyfikujπcy konto.';
   COMMENT ON COLUMN "BANK"."KONTA"."KONTO_NR" IS 'Numer konta bankowego.';
   COMMENT ON COLUMN "BANK"."KONTA"."KONTO_OSZCZ_ID" IS 'ID konta g≥Ûwnego dla konta oszczÍdnoúciowego.';
   COMMENT ON COLUMN "BANK"."KONTA"."KONTO_F_CZY_AKTYWNE" IS 'Flaga czy konto jest aktywne. T - aktywne, N - nieaktywne.';
   COMMENT ON COLUMN "BANK"."KONTA"."KONTO_KR_ID" IS 'Referencja do tabeli kody_ue. Oznaczenie kraju w rachunku IBAN.';
   COMMENT ON COLUMN "BANK"."KONTA"."KONTO_WLASC_ID" IS 'Referencja do tabeli klienci. Oznaczenie posiadacza konta.';
   COMMENT ON TABLE "BANK"."KONTA"  IS 'Tabela zawierajπca dane o kontach bankowych.';
--------------------------------------------------------
--  DDL for Table KONTA_HIST
--------------------------------------------------------

  CREATE TABLE "BANK"."KONTA_HIST" 
   (	"KONTO_ID" NUMBER, 
	"KONTO_NR" NUMBER(26,0), 
	"KONTO_OSZCZ_ID" NUMBER, 
	"KONTO_F_CZY_AKTYWNE" VARCHAR2(1 CHAR), 
	"KONTO_KR_ID" NUMBER, 
	"KONTO_WLASC_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table LOGS_TABLE
--------------------------------------------------------

  CREATE TABLE "BANK"."LOGS_TABLE" 
   (	"LOG_ID" NUMBER(10,0), 
	"LOG_TIME" TIMESTAMP (6) DEFAULT sysdate, 
	"LOG_SOURCE" VARCHAR2(400 CHAR), 
	"LOG_DETAILS" CLOB, 
	"LOG_ADD_INFO" VARCHAR2(400 CHAR) DEFAULT null, 
	"LOG_USER" VARCHAR2(30 CHAR) DEFAULT user
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("LOG_DETAILS") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW 4000 CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 262144 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "BANK"."LOGS_TABLE"."LOG_ID" IS 'LOG ID';
   COMMENT ON COLUMN "BANK"."LOGS_TABLE"."LOG_TIME" IS 'Data i czas zalogowania.';
   COMMENT ON COLUMN "BANK"."LOGS_TABLE"."LOG_SOURCE" IS 'èrÛd≥o logu';
   COMMENT ON COLUMN "BANK"."LOGS_TABLE"."LOG_DETAILS" IS 'LOG MESSAGE';
   COMMENT ON COLUMN "BANK"."LOGS_TABLE"."LOG_ADD_INFO" IS 'ADDITIONAL MSG';
   COMMENT ON COLUMN "BANK"."LOGS_TABLE"."LOG_USER" IS 'Uøytkownik';
   COMMENT ON TABLE "BANK"."LOGS_TABLE"  IS 'Tabela przechowujπca logi.';
--------------------------------------------------------
--  DDL for Table TOP_2_TRNS_MAJ_2022_05_09_2022
--------------------------------------------------------

  CREATE TABLE "BANK"."TOP_2_TRNS_MAJ_2022_05_09_2022" 
   (	"TRNS_ID" NUMBER, 
	"TRNS_KWOTA" NUMBER, 
	"TRNS_DATA_OPERACJI" TIMESTAMP (6), 
	"KTO_UTWORZYL" VARCHAR2(30 CHAR) DEFAULT user
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TOP_2_TRNS_STY_2022_07_09_2022
--------------------------------------------------------

  CREATE TABLE "BANK"."TOP_2_TRNS_STY_2022_07_09_2022" 
   (	"TRNS_ID" NUMBER, 
	"TRNS_KWOTA" NUMBER, 
	"TRNS_DATA_OPERACJI" TIMESTAMP (6), 
	"KTO_UTWORZYL" VARCHAR2(30 CHAR) DEFAULT user
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TOP_3_TRNS_MAJ_2022_06_09_2022
--------------------------------------------------------

  CREATE TABLE "BANK"."TOP_3_TRNS_MAJ_2022_06_09_2022" 
   (	"TRNS_ID" NUMBER, 
	"TRNS_KWOTA" NUMBER, 
	"TRNS_DATA_OPERACJI" TIMESTAMP (6), 
	"KTO_UTWORZYL" VARCHAR2(30 CHAR) DEFAULT user
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TOP_4_TRNS_MAJ_2022_06_09_2022
--------------------------------------------------------

  CREATE TABLE "BANK"."TOP_4_TRNS_MAJ_2022_06_09_2022" 
   (	"TRNS_ID" NUMBER, 
	"TRNS_KWOTA" NUMBER, 
	"TRNS_DATA_OPERACJI" TIMESTAMP (6), 
	"KTO_UTWORZYL" VARCHAR2(30 CHAR) DEFAULT user
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TOP_4_TRNS_SIE_2022_06_09_2022
--------------------------------------------------------

  CREATE TABLE "BANK"."TOP_4_TRNS_SIE_2022_06_09_2022" 
   (	"TRNS_ID" NUMBER, 
	"TRNS_KWOTA" NUMBER, 
	"TRNS_DATA_OPERACJI" TIMESTAMP (6), 
	"KTO_UTWORZYL" VARCHAR2(30 CHAR) DEFAULT user
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TOP_5_TRNS_MAJ_2022_04_10_2022
--------------------------------------------------------

  CREATE TABLE "BANK"."TOP_5_TRNS_MAJ_2022_04_10_2022" 
   (	"TRNS_ID" NUMBER, 
	"TRNS_KWOTA" NUMBER, 
	"TRNS_DATA_OPERACJI" TIMESTAMP (6), 
	"KTO_UTWORZYL" VARCHAR2(30 CHAR) DEFAULT user
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TOP_5_TRNS_MAJ_2022_05_09_2022
--------------------------------------------------------

  CREATE TABLE "BANK"."TOP_5_TRNS_MAJ_2022_05_09_2022" 
   (	"TRNS_ID" NUMBER, 
	"TRNS_KWOTA" NUMBER, 
	"TRNS_DATA_OPERACJI" TIMESTAMP (6), 
	"KTO_UTWORZYL" VARCHAR2(30 CHAR) DEFAULT user
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TOP_6_TRNS_MAJ_2022_05_09_2022
--------------------------------------------------------

  CREATE TABLE "BANK"."TOP_6_TRNS_MAJ_2022_05_09_2022" 
   (	"TRNS_ID" NUMBER, 
	"TRNS_KWOTA" NUMBER, 
	"TRNS_DATA_OPERACJI" TIMESTAMP (6), 
	"KTO_UTWORZYL" VARCHAR2(30 CHAR) DEFAULT user
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TOP_8_TRNS_MAJ_2022_04_10_2022
--------------------------------------------------------

  CREATE TABLE "BANK"."TOP_8_TRNS_MAJ_2022_04_10_2022" 
   (	"TRNS_ID" NUMBER, 
	"TRNS_KWOTA" NUMBER, 
	"TRNS_DATA_OPERACJI" TIMESTAMP (6), 
	"KTO_UTWORZYL" VARCHAR2(30 CHAR) DEFAULT user
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TOP_9_TRNS_MAJ_2022_04_10_2022
--------------------------------------------------------

  CREATE TABLE "BANK"."TOP_9_TRNS_MAJ_2022_04_10_2022" 
   (	"TRNS_ID" NUMBER, 
	"TRNS_KWOTA" NUMBER, 
	"TRNS_DATA_OPERACJI" TIMESTAMP (6), 
	"KTO_UTWORZYL" VARCHAR2(30 CHAR) DEFAULT user
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TRANSAKCJE
--------------------------------------------------------

  CREATE TABLE "BANK"."TRANSAKCJE" 
   (	"TRNS_ID" NUMBER, 
	"TRNS_RODZAJ" VARCHAR2(1 CHAR), 
	"TRNS_KWOTA" NUMBER(*,0), 
	"TRNS_TYP" VARCHAR2(2 CHAR), 
	"DATA_ZAKS" DATE DEFAULT SYSDATE, 
	"DATA_REALIZ" DATE DEFAULT NULL, 
	"UTWORZONO_PRZEZ" VARCHAR2(25 CHAR) DEFAULT user, 
	"TRNS_SP_PLAT" VARCHAR2(1 CHAR), 
	"TRNS_KONTO_ID" NUMBER, 
	"TRNS_KAT_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "BANK"."TRANSAKCJE"."TRNS_ID" IS 'Identyfikator transakcji, klucz g≥Ûwny tabeli.';
   COMMENT ON COLUMN "BANK"."TRANSAKCJE"."TRNS_RODZAJ" IS 'Rodzaj transakcji. P - przychody, W - wydatki.';
   COMMENT ON COLUMN "BANK"."TRANSAKCJE"."TRNS_KWOTA" IS 'Kwota transakcji w PLN.';
   COMMENT ON COLUMN "BANK"."TRANSAKCJE"."TRNS_TYP" IS 'SposÛb dokonania transakcji. PK - p≥atnoúÊ kartπ, PZ - przelew zwyk≥y, PE - przelew ekspresowy, PW - przelew walutowy, B - blik.';
   COMMENT ON COLUMN "BANK"."TRANSAKCJE"."DATA_ZAKS" IS 'Data zaksiÍgowania transakcji.';
   COMMENT ON COLUMN "BANK"."TRANSAKCJE"."DATA_REALIZ" IS 'Data realizacji transakcji';
   COMMENT ON COLUMN "BANK"."TRANSAKCJE"."UTWORZONO_PRZEZ" IS 'Uøytkownik rejestrujπcy transakcje.';
   COMMENT ON COLUMN "BANK"."TRANSAKCJE"."TRNS_SP_PLAT" IS 'SposÛb p≥atnoúci. A - aplikacja mobilna, S - strona internetowa banku, K - karta.';
   COMMENT ON COLUMN "BANK"."TRANSAKCJE"."TRNS_KONTO_ID" IS 'Referencja do tabeli konta. Oznaczenie rachunku bankowego.';
   COMMENT ON COLUMN "BANK"."TRANSAKCJE"."TRNS_KAT_ID" IS 'Referencja do tabeli kategorie. Oznaczenie kategorii przychodu/wydatku.';
   COMMENT ON TABLE "BANK"."TRANSAKCJE"  IS 'Tabela zawierajπca informacje o transakcjach online.';
--------------------------------------------------------
--  DDL for Table TRANSAKCJE_2
--------------------------------------------------------

  CREATE TABLE "BANK"."TRANSAKCJE_2" 
   (	"TRNS_ID" NUMBER, 
	"TRNS_RODZAJ" VARCHAR2(1 CHAR), 
	"TRNS_KWOTA" NUMBER(*,0), 
	"TRNS_TYP" VARCHAR2(2 CHAR), 
	"DATA_ZAKS" DATE, 
	"DATA_REALIZ" DATE, 
	"UTWORZONO_PRZEZ" VARCHAR2(25 CHAR), 
	"TRNS_SP_PLAT" VARCHAR2(1 CHAR), 
	"TRNS_KONTO_ID" NUMBER, 
	"TRNS_KAT_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TRANSAKCJE_3
--------------------------------------------------------

  CREATE TABLE "BANK"."TRANSAKCJE_3" 
   (	"TRNS_ID" NUMBER, 
	"TRNS_RODZAJ" VARCHAR2(1 CHAR), 
	"TRNS_KWOTA" NUMBER(*,0), 
	"TRNS_TYP" VARCHAR2(2 CHAR), 
	"DATA_ZAKS" DATE, 
	"DATA_REALIZ" DATE, 
	"UTWORZONO_PRZEZ" VARCHAR2(25 CHAR), 
	"TRNS_SP_PLAT" VARCHAR2(1 CHAR), 
	"TRNS_KONTO_ID" NUMBER, 
	"TRNS_KAT_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TRANSAKCJE_LOGS
--------------------------------------------------------

  CREATE TABLE "BANK"."TRANSAKCJE_LOGS" 
   (	"TRNS_ID" NUMBER, 
	"TRNS_KWOTA" NUMBER(*,0), 
	"UTWORZONO_PRZEZ" VARCHAR2(25 CHAR), 
	"TRNS_DATA_OPERACJI" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for View BANK_VW_KLIENCI_PELNY
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "BANK"."BANK_VW_KLIENCI_PELNY" ("KLIENT_ID", "IMIE", "NAZWISKO", "LOGIN", "EMAIL", "STATUS", "PLEC", "KL_ADRES_ID", "ULICA", "ADRES_PELNY", "KOD_POCZTOWY", "MIASTO", "KRAJ") AS 
  SELECT 
			kl.klient_id
		, 	kl.imie
		,	kl.nazwisko
		,	kl.login
		, 	kl.email
		, 	DECODE(kl.f_czy_aktywny, 'T', 'Aktywny', 'Nieaktywny') status
		,	kl.plec
        ,   adr.adres_id
		, 	adr.ulica
		,	adr.nr_bud || '/' || adr.nr_miesz
		,	adr.kod_pocztowy
		,	adr.miasto
		,	adr.kraj
    FROM klienci kl join adresy adr
        on kl.kl_adres_id = adr.adres_id;

   COMMENT ON COLUMN "BANK"."BANK_VW_KLIENCI_PELNY"."ADRES_PELNY" IS 'Kompletny adres - ulica, numer budynku, numer mieszkania, kod pocztowy klienta.';
   COMMENT ON TABLE "BANK"."BANK_VW_KLIENCI_PELNY"  IS 'Perspektywa z pe≥nymi informacjami o klientach.'
;
--------------------------------------------------------
--  DDL for View BANK_VW_KLIENCI_TRNS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "BANK"."BANK_VW_KLIENCI_TRNS" ("KLIENT_ID", "IMIE", "NAZWISKO", "LOGIN", "EMAIL", "STATUS", "PLEC", "KL_ADRES_ID", "ULICA", "ADRES_PELNY", "KOD_POCZTOWY", "MIASTO", "KRAJ") AS 
  SELECT 
			kl.klient_id
		, 	kl.imie
		,	kl.nazwisko
		,	kl.login
		, 	kl.email
		, 	DECODE(kl.f_czy_aktywny, 'T', 'Aktywny', 'Nieaktywny') status
		,	kl.plec
        ,   adr.adres_id
		, 	adr.ulica
		,	adr.nr_bud || '/' || adr.nr_miesz
		,	adr.kod_pocztowy
		,	adr.miasto
		,	adr.kraj
    FROM klienci kl inner join adresy adr
        on kl.kl_adres_id = adr.adres_id
    WHERE EXISTS 
        (select NULL 
         from transakcje trns inner join konta knt on knt.konto_id = trns.trns_konto_id
         where knt.konto_wlasc_id = kl.klient_id)
;
--------------------------------------------------------
--  DDL for View BANK_VW_KLIENCI_ZESTAWIENIE_PUBLIC
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "BANK"."BANK_VW_KLIENCI_ZESTAWIENIE_PUBLIC" ("KLIENT_ID", "IMIE", "NAZWISKO", "PLEC", "LOGIN", "EMAIL", "PESEL", "ADRES") AS 
  SELECT
      klient_id
    , imie
    , nazwisko
    , plec
    , login
    , email
    , nvl(regexp_replace( pesel,
      '(^\d{6})(.*)(\d{1}$)', '\1**********\3' ), '***********') PESEL
    , ulica || ' ' || nr_miesz || '/' || nr_bud || ' ' || kod_pocztowy || ', ' || miasto ADRES
FROM
  klienci kl inner join adresy adr on kl.kl_adres_id = adr.adres_id
WHERE kl.f_czy_aktywny = 'T' and exists (select trns.trns_id 
                                        from transakcje trns inner join konta knt
                                        on trns.trns_konto_id = knt.konto_id 
                                        where knt.konto_wlasc_id = klient_id)
WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View BANK_VW_KL_PL_REG
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "BANK"."BANK_VW_KL_PL_REG" ("KLIENT_ID", "IMIE", "NAZWISKO", "PLEC", "LOGIN", "EMAIL", "PESEL", "F_CZY_AKTYWNY", "KL_ADRES_ID", "PESEL_VALID") AS 
  WITH
	klienci_polska AS 
	(
	select *
    from klienci
    where kl_adres_id in (select adres_id from adresy where kraj = 'Polska')
    )
    select "KLIENT_ID","IMIE","NAZWISKO","PLEC","LOGIN","EMAIL","PESEL","F_CZY_AKTYWNY","KL_ADRES_ID","PESEL_VALID" from klienci_polska
;
--------------------------------------------------------
--  DDL for View BANK_VW_KONTA_AKTYWNE
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "BANK"."BANK_VW_KONTA_AKTYWNE" ("KONTO_ID", "RODZAJ", "IBAN", "KLIENT", "CZY_OPERACJE") AS 
  SELECT
        knt.konto_id konto_id,
        'G£”WNE' rodzaj,
        bank_pckg_utilities.f_format_rachunek(knt.konto_id, knt.konto_kr_id) iban,
        kl.imie || ' ' || kl.nazwisko klient,
        CASE WHEN trns.trns_kwota IS NULL THEN 'Nie' ELSE 'Tak' END czy_operacje
    FROM kody_ue kr
        RIGHT OUTER JOIN konta knt on kr.kraj_id = knt.konto_kr_id
        RIGHT OUTER JOIN klienci kl on kl.klient_id = knt.konto_wlasc_id
        LEFT OUTER JOIN transakcje trns on trns.trns_konto_id = knt.konto_id
    WHERE knt.KONTO_OSZCZ_ID IS NULL AND knt.konto_f_czy_aktywne = 'T'
    UNION

    SELECT
        knt.konto_id konto_id,
        'OSZCZ DNOåCIOWE' rodzaj,
        bank_pckg_utilities.f_format_rachunek(knt.konto_id, knt.konto_kr_id) iban,
        kl.imie || ' ' || kl.nazwisko klient,
        CASE WHEN trns.trns_kwota IS NULL THEN 'Nie' ELSE 'Tak' END czy_operacje
    FROM kody_ue kr
        RIGHT OUTER JOIN konta knt on kr.kraj_id = knt.konto_kr_id
        RIGHT OUTER JOIN klienci kl on kl.klient_id = knt.konto_wlasc_id
        LEFT  OUTER JOIN transakcje trns on trns.trns_konto_id = knt.konto_id
    WHERE knt.KONTO_OSZCZ_ID IS NOT NULL AND knt.konto_f_czy_aktywne = 'T';

   COMMENT ON COLUMN "BANK"."BANK_VW_KONTA_AKTYWNE"."RODZAJ" IS 'Znacznik czy konto g≥Ûwne czy oszczÍdnoúciowe.';
   COMMENT ON COLUMN "BANK"."BANK_VW_KONTA_AKTYWNE"."IBAN" IS 'Numer kontaw formacie IBAN.';
   COMMENT ON COLUMN "BANK"."BANK_VW_KONTA_AKTYWNE"."CZY_OPERACJE" IS 'Czy odnotowano transakcje dla tego konta.';
   COMMENT ON TABLE "BANK"."BANK_VW_KONTA_AKTYWNE"  IS 'Perspektywa z danymi na temat aktywnych kont bankowych.'
;
--------------------------------------------------------
--  DDL for View BANK_VW_TRANS_RAPORT
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "BANK"."BANK_VW_TRANS_RAPORT" ("RP_LOGIN", "RP_MSC", "RP_ROK", "RP_KAT", "RP_SP_PLAT", "RP_RAZEM", "RP_KAT_MSC_ROK_RAZEM", "RP_UDZIAL_W_KAT_OKRES", "RP_SP_PLAT_MSC_ROK_RAZEM", "RP_UDZIAL_W_SP_PLAT_OKRES") AS 
  WITH transakcje_all AS (
        SELECT
            trns.trns_id,
            kat.kat_id,
            trns.trns_rodzaj                                            rodzaj,
            kat.nazwa                                                   kategoria,
            trns.trns_sp_plat                                           sp_plat,
            to_char(coalesce(trns.data_realiz, trns.data_zaks), 'mon')  msc,
            to_char(coalesce(trns.data_realiz, trns.data_zaks), 'yyyy') rok,
            trns.trns_kwota                                             kwota,
            kl.login                                                    login
        FROM
            transakcje trns
            LEFT OUTER JOIN kategorie  kat ON trns.trns_kat_id = kat.kat_id
            INNER JOIN konta      knt ON knt.konto_id = trns.trns_konto_id
            INNER JOIN klienci    kl ON kl.klient_id = knt.konto_wlasc_id
    ), trns_sum AS (
        SELECT
            login                                                                         rp_login,
            msc                                                                           rp_msc,
            rok                                                                           rp_rok,
            kategoria                                                                     rp_kat,
            decode(sp_plat, 'K', 'Karta', 'A', 'Aplikacja',
                   'S', 'Strona internetowa')                                             rp_sp_plat,
            nvl(SUM(
                CASE
                    WHEN rodzaj = 'P' THEN
                        + kwota
                    WHEN rodzaj = 'W' THEN
                        - kwota
                    ELSE
                        0
                END
            ), 0)                                                                         rp_razem,
            nvl(bank_pckg_transakcja.f_sum_trns_wg_kat_msc_rok(kat_id, msc, rok), 0)      rp_kat_msc_rok_razem,
            nvl(bank_pckg_transakcja.f_sum_trns_wg_sp_plat_msc_rok(sp_plat, msc, rok), 0) rp_sp_plat_msc_rok_razem
        FROM
            transakcje_all
        GROUP BY
            kat_id,
            login,
            msc,
            rok,
            kategoria,
            sp_plat
        HAVING
            nvl(SUM(
                CASE
                    WHEN rodzaj = 'P' THEN
                        + kwota
                    WHEN rodzaj = 'W' THEN
                        - kwota
                    ELSE
                        0
                END
            ), 0) <> 0
        ORDER BY
            rok,
            msc
    ), trns_sum_procent AS (
        SELECT
            trnss.*,
            bank_pckg_utilities.f_daj_procent(rp_razem, rp_kat_msc_rok_razem)     AS rp_udzial_w_kat_okres,
            bank_pckg_utilities.f_daj_procent(rp_razem, rp_sp_plat_msc_rok_razem) AS rp_udzial_w_sp_plat_okres
        FROM
            trns_sum trnss
    )
    SELECT
        "RP_LOGIN","RP_MSC","RP_ROK","RP_KAT","RP_SP_PLAT","RP_RAZEM","RP_KAT_MSC_ROK_RAZEM","RP_SP_PLAT_MSC_ROK_RAZEM","RP_UDZIAL_W_KAT_OKRES","RP_UDZIAL_W_SP_PLAT_OKRES"
    FROM
        trns_sum_procent
;
--------------------------------------------------------
--  DDL for View BANK_VW_TRANS_STATUS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "BANK"."BANK_VW_TRANS_STATUS" ("TRNS_ID", "DATA_ZAKS", "DATA_REALIZ", "STATUS") AS 
  SELECT
        trns.trns_id,  
        trns.data_zaks,
        trns.data_realiz,
        DECODE(trns.data_realiz, NULL, 'NIEZREALIZOWANA', 'ZREALIZOWANA') status
    FROM transakcje trns
	WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View LOGGER_TABLE
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "BANK"."LOGGER_TABLE" ("LOG_ID", "LOG_TIME", "LOG_SOURCE", "LOG_DETAILS", "LOG_ADD_INFO", "LOG_USER") AS 
  select "LOG_ID","LOG_TIME","LOG_SOURCE","LOG_DETAILS","LOG_ADD_INFO","LOG_USER" from logs_table order by log_id desc
;
REM INSERTING into BANK.ADRESY
SET DEFINE OFF;
Insert into BANK.ADRESY (ADRES_ID,KRAJ,MIASTO,ULICA,NR_BUD,NR_MIESZ,KOD_POCZTOWY) values ('1','Polska','Warszawa','Aleje Jerozolimskie','15A','70','02-001');
Insert into BANK.ADRESY (ADRES_ID,KRAJ,MIASTO,ULICA,NR_BUD,NR_MIESZ,KOD_POCZTOWY) values ('2','Polska','Kielce','Sienkiewicza','121','42','25-123');
Insert into BANK.ADRESY (ADRES_ID,KRAJ,MIASTO,ULICA,NR_BUD,NR_MIESZ,KOD_POCZTOWY) values ('3','Polska','Wroc≥aw','11 Listopada','48','14','40-887');
Insert into BANK.ADRESY (ADRES_ID,KRAJ,MIASTO,ULICA,NR_BUD,NR_MIESZ,KOD_POCZTOWY) values ('4','Polska','Bielsko-Bia≥a','1 Dywizji Pancernej','32','15','33-700');
Insert into BANK.ADRESY (ADRES_ID,KRAJ,MIASTO,ULICA,NR_BUD,NR_MIESZ,KOD_POCZTOWY) values ('5','Polska','GdaÒsk','D≥uga','13B','10','15-140');
Insert into BANK.ADRESY (ADRES_ID,KRAJ,MIASTO,ULICA,NR_BUD,NR_MIESZ,KOD_POCZTOWY) values ('6','Czechy','Czeski Cieszyn','Sokolovska','11','11','737 01');
Insert into BANK.ADRESY (ADRES_ID,KRAJ,MIASTO,ULICA,NR_BUD,NR_MIESZ,KOD_POCZTOWY) values ('7','Polska','Zawiercie','Jesienna','99','1','24-890');
Insert into BANK.ADRESY (ADRES_ID,KRAJ,MIASTO,ULICA,NR_BUD,NR_MIESZ,KOD_POCZTOWY) values ('8','Niemcy','Berlin','Fryderyka','15','2','10318');
Insert into BANK.ADRESY (ADRES_ID,KRAJ,MIASTO,ULICA,NR_BUD,NR_MIESZ,KOD_POCZTOWY) values ('9','Polska','Warszawa','Marsza≥kowska','44','170','00-020');
Insert into BANK.ADRESY (ADRES_ID,KRAJ,MIASTO,ULICA,NR_BUD,NR_MIESZ,KOD_POCZTOWY) values ('10','Polska','Warszawa','Marsza≥kowska','47','89','00-020');
Insert into BANK.ADRESY (ADRES_ID,KRAJ,MIASTO,ULICA,NR_BUD,NR_MIESZ,KOD_POCZTOWY) values ('11','Polska','Katowice','3 Maja','170','4','15-121');
Insert into BANK.ADRESY (ADRES_ID,KRAJ,MIASTO,ULICA,NR_BUD,NR_MIESZ,KOD_POCZTOWY) values ('12','Polska','Katowice','1 Maja','247','89','15-345');
Insert into BANK.ADRESY (ADRES_ID,KRAJ,MIASTO,ULICA,NR_BUD,NR_MIESZ,KOD_POCZTOWY) values ('13','Polska','PoznaÒ','Zawady','115','11','12-229');
Insert into BANK.ADRESY (ADRES_ID,KRAJ,MIASTO,ULICA,NR_BUD,NR_MIESZ,KOD_POCZTOWY) values ('14','Polska','KrakÛw','Grodzka','10','9','45-398');
Insert into BANK.ADRESY (ADRES_ID,KRAJ,MIASTO,ULICA,NR_BUD,NR_MIESZ,KOD_POCZTOWY) values ('15','Polska','Olsztyn','11 listopada','1','3','76-934');
REM INSERTING into BANK.ADRESY_HIST
SET DEFINE OFF;
Insert into BANK.ADRESY_HIST (ADR_HIST_ID,DATA_OPERACJI,KRAJ,MIASTO,ULICA,NR_BUD,NR_MIESZ,KOD_POCZTOWY,KRAJ_NEW,MIASTO_NEW,ULICA_NEW,NR_BUD_NEW,NR_MIESZ_NEW,KOD_POCZTOWY_NEW) values ('4',to_timestamp('22/08/08 19:45:32,000000000','RR/MM/DD HH24:MI:SSXFF'),'Polska','Warszawa','Aleje Jerozolimskie','15A','70','02-001',null,null,null,null,null,null);
Insert into BANK.ADRESY_HIST (ADR_HIST_ID,DATA_OPERACJI,KRAJ,MIASTO,ULICA,NR_BUD,NR_MIESZ,KOD_POCZTOWY,KRAJ_NEW,MIASTO_NEW,ULICA_NEW,NR_BUD_NEW,NR_MIESZ_NEW,KOD_POCZTOWY_NEW) values ('5',to_timestamp('22/08/10 18:31:55,000000000','RR/MM/DD HH24:MI:SSXFF'),'Polska','Be≥chatÛw','Jesienna','99','1','24-890',null,'Zawiercie',null,null,null,null);
REM INSERTING into BANK.KATEGORIE
SET DEFINE OFF;
Insert into BANK.KATEGORIE (KAT_ID,NAZWA,OPIS) values ('1','Przychody podstawowe','Podstawowe wp≥ywy z przelewÛw zwyk≥ych, BLIK i ekspresowych.');
Insert into BANK.KATEGORIE (KAT_ID,NAZWA,OPIS) values ('2','Przychody walutowe','Wp≥ywy z przelewÛw miÍdzynarodowych - z rachunkÛw zagranicznych.');
Insert into BANK.KATEGORIE (KAT_ID,NAZWA,OPIS) values ('3','Przychody pozosta≥e','Pozosta≥e wp≥ywy niezaliczane do dwÛch poprzednich kategorii.');
Insert into BANK.KATEGORIE (KAT_ID,NAZWA,OPIS) values ('4','Wydatki podstawowe','Przelewy, transakcje BLIK, p≥atnoúci kartπ na wydatki codzienne - zakupy spoøywcze, rachunki, p≥atnoúci cykliczne.');
Insert into BANK.KATEGORIE (KAT_ID,NAZWA,OPIS) values ('5','Transport','Wydatki poniesione na transport - bilety, kolej, komunikacja miejska, stacje benzynowe.');
Insert into BANK.KATEGORIE (KAT_ID,NAZWA,OPIS) values ('6','Rozrywka','Koszty zwiπzane z rozrywkπ - restauracje, kina, zakupy inne niø spoøywcze.');
Insert into BANK.KATEGORIE (KAT_ID,NAZWA,OPIS) values ('7','Wydatki pozosta≥e','Pozosta≥e wydatki niezaliczane do innych kategorii.');
REM INSERTING into BANK.KLIENCI
SET DEFINE OFF;
Insert into BANK.KLIENCI (KLIENT_ID,IMIE,NAZWISKO,PLEC,LOGIN,EMAIL,PESEL,F_CZY_AKTYWNY,KL_ADRES_ID,PESEL_VALID) values ('1','Jan','Kowalski','M','jan.kow','janek.k123@o2.pl','76111513832','T','11','T');
Insert into BANK.KLIENCI (KLIENT_ID,IMIE,NAZWISKO,PLEC,LOGIN,EMAIL,PESEL,F_CZY_AKTYWNY,KL_ADRES_ID,PESEL_VALID) values ('2','Zbigniew','Nowak','M','zbi.now','zb.nowak@gmail.com','83040717045','T','12','N');
Insert into BANK.KLIENCI (KLIENT_ID,IMIE,NAZWISKO,PLEC,LOGIN,EMAIL,PESEL,F_CZY_AKTYWNY,KL_ADRES_ID,PESEL_VALID) values ('3','Aleksandra','Nowak','K','ale.now','al.nwk@gmail.com','87031112312','T','12','N');
Insert into BANK.KLIENCI (KLIENT_ID,IMIE,NAZWISKO,PLEC,LOGIN,EMAIL,PESEL,F_CZY_AKTYWNY,KL_ADRES_ID,PESEL_VALID) values ('4','£ukasz','Andrzejewski','N','≥uk.and','luki.and1337@wp.pl','99111119431','T','3','N');
Insert into BANK.KLIENCI (KLIENT_ID,IMIE,NAZWISKO,PLEC,LOGIN,EMAIL,PESEL,F_CZY_AKTYWNY,KL_ADRES_ID,PESEL_VALID) values ('5','Piotr','Kowalewski','M','pio.kow','piotrek.kowalewski12@onet.pl','95120119471','T','2','N');
Insert into BANK.KLIENCI (KLIENT_ID,IMIE,NAZWISKO,PLEC,LOGIN,EMAIL,PESEL,F_CZY_AKTYWNY,KL_ADRES_ID,PESEL_VALID) values ('6','Anna','Lewandowska','K','ann.lew','anna.lewa3@interia.pl','93030116471','T','15','N');
Insert into BANK.KLIENCI (KLIENT_ID,IMIE,NAZWISKO,PLEC,LOGIN,EMAIL,PESEL,F_CZY_AKTYWNY,KL_ADRES_ID,PESEL_VALID) values ('7','Ewa','Nowak','K','ewa.now','ewa178291@gmail.com','77040156432','T','14','N');
Insert into BANK.KLIENCI (KLIENT_ID,IMIE,NAZWISKO,PLEC,LOGIN,EMAIL,PESEL,F_CZY_AKTYWNY,KL_ADRES_ID,PESEL_VALID) values ('8','Justyna','Paw≥owska','K','jus.paw','just.p18@wp.pl','1322302743','T','1','N');
Insert into BANK.KLIENCI (KLIENT_ID,IMIE,NAZWISKO,PLEC,LOGIN,EMAIL,PESEL,F_CZY_AKTYWNY,KL_ADRES_ID,PESEL_VALID) values ('9','Adam','Kwiatkowski','M','ada.kwi','adam.kwiatkowski@o2.pl','98100313843','T','4','N');
Insert into BANK.KLIENCI (KLIENT_ID,IMIE,NAZWISKO,PLEC,LOGIN,EMAIL,PESEL,F_CZY_AKTYWNY,KL_ADRES_ID,PESEL_VALID) values ('10','Karolina','Novotn·','K','kar.nov','kar.nov2022@seznam.cz',null,'T','6','T');
Insert into BANK.KLIENCI (KLIENT_ID,IMIE,NAZWISKO,PLEC,LOGIN,EMAIL,PESEL,F_CZY_AKTYWNY,KL_ADRES_ID,PESEL_VALID) values ('11','Oskar','Woüniak','N','osk.woü','oski1342@wp.pl','96120224413','T','5','N');
Insert into BANK.KLIENCI (KLIENT_ID,IMIE,NAZWISKO,PLEC,LOGIN,EMAIL,PESEL,F_CZY_AKTYWNY,KL_ADRES_ID,PESEL_VALID) values ('12','Pawe≥','Adamczyk','M','paw.ada','pawadm678@wp.pl','63041128671','T','7','N');
Insert into BANK.KLIENCI (KLIENT_ID,IMIE,NAZWISKO,PLEC,LOGIN,EMAIL,PESEL,F_CZY_AKTYWNY,KL_ADRES_ID,PESEL_VALID) values ('13','Jakub','Piotrowski','M','jak.pio','piotrjak.07@interia.pl','91022212834','T','10','N');
Insert into BANK.KLIENCI (KLIENT_ID,IMIE,NAZWISKO,PLEC,LOGIN,EMAIL,PESEL,F_CZY_AKTYWNY,KL_ADRES_ID,PESEL_VALID) values ('14','Paula','KamiÒska','K','pau.kam','kam781@gmail.com','92070803629','T','9','T');
Insert into BANK.KLIENCI (KLIENT_ID,IMIE,NAZWISKO,PLEC,LOGIN,EMAIL,PESEL,F_CZY_AKTYWNY,KL_ADRES_ID,PESEL_VALID) values ('15','Frieda','Muuler','K','fri.muu','friemull.com',null,'T','8','T');
Insert into BANK.KLIENCI (KLIENT_ID,IMIE,NAZWISKO,PLEC,LOGIN,EMAIL,PESEL,F_CZY_AKTYWNY,KL_ADRES_ID,PESEL_VALID) values ('16','Andrzej','B≥aszczyk','N','and.b≥a','andblasz@o2.pl','55072116642','T','13','N');
REM INSERTING into BANK.KLIENCI2
SET DEFINE OFF;
REM INSERTING into BANK.KLIENCI_HIST
SET DEFINE OFF;
Insert into BANK.KLIENCI_HIST (KLIENT_ID,LOGIN,EMAIL_OLD,EMAIL_NEW,KTO_MODYFIKOWAL,KIEDY_MODYFIKOWANO) values ('12','paw.ada','pawadm67@wp.pl','pawadm678@wp.pl','BANK',to_date('22/05/25','RR/MM/DD'));
Insert into BANK.KLIENCI_HIST (KLIENT_ID,LOGIN,EMAIL_OLD,EMAIL_NEW,KTO_MODYFIKOWAL,KIEDY_MODYFIKOWANO) values ('5','pio.kow','piotrek.kowalewski1@onet.pl','piotrek.kowalewski12@onet.pl','BANK',to_date('22/05/25','RR/MM/DD'));
Insert into BANK.KLIENCI_HIST (KLIENT_ID,LOGIN,EMAIL_OLD,EMAIL_NEW,KTO_MODYFIKOWAL,KIEDY_MODYFIKOWANO) values ('8','jus.paw','just.p17@wp.pl','just.p18@wp.pl','BANK',to_date('22/09/26','RR/MM/DD'));
Insert into BANK.KLIENCI_HIST (KLIENT_ID,LOGIN,EMAIL_OLD,EMAIL_NEW,KTO_MODYFIKOWAL,KIEDY_MODYFIKOWANO) values ('6','ann.lew','anna.lewa@interia.pl','anna.lewa3@interia.pl','BANK',to_date('22/09/26','RR/MM/DD'));
REM INSERTING into BANK.KODY_UE
SET DEFINE OFF;
Insert into BANK.KODY_UE (KRAJ_ID,KRAJ_NAZWA,KRAJ_KOD) values ('1','Austria','AT');
Insert into BANK.KODY_UE (KRAJ_ID,KRAJ_NAZWA,KRAJ_KOD) values ('2','Belgia','BE');
Insert into BANK.KODY_UE (KRAJ_ID,KRAJ_NAZWA,KRAJ_KOD) values ('3','Bu≥garia','BG');
Insert into BANK.KODY_UE (KRAJ_ID,KRAJ_NAZWA,KRAJ_KOD) values ('4','Chorwacja','HR');
Insert into BANK.KODY_UE (KRAJ_ID,KRAJ_NAZWA,KRAJ_KOD) values ('5','Cypr','CY');
Insert into BANK.KODY_UE (KRAJ_ID,KRAJ_NAZWA,KRAJ_KOD) values ('6','Czechy','CZ');
Insert into BANK.KODY_UE (KRAJ_ID,KRAJ_NAZWA,KRAJ_KOD) values ('7','Dania','DK');
Insert into BANK.KODY_UE (KRAJ_ID,KRAJ_NAZWA,KRAJ_KOD) values ('8','Estonia','EE');
Insert into BANK.KODY_UE (KRAJ_ID,KRAJ_NAZWA,KRAJ_KOD) values ('9','Finlandia','FI');
Insert into BANK.KODY_UE (KRAJ_ID,KRAJ_NAZWA,KRAJ_KOD) values ('10','Francja','FR');
Insert into BANK.KODY_UE (KRAJ_ID,KRAJ_NAZWA,KRAJ_KOD) values ('11','Grecja','GR');
Insert into BANK.KODY_UE (KRAJ_ID,KRAJ_NAZWA,KRAJ_KOD) values ('12','Hiszpania','ES');
Insert into BANK.KODY_UE (KRAJ_ID,KRAJ_NAZWA,KRAJ_KOD) values ('13','Holandia','NL');
Insert into BANK.KODY_UE (KRAJ_ID,KRAJ_NAZWA,KRAJ_KOD) values ('14','Irlandia','IE');
Insert into BANK.KODY_UE (KRAJ_ID,KRAJ_NAZWA,KRAJ_KOD) values ('15','Litwa','LT');
Insert into BANK.KODY_UE (KRAJ_ID,KRAJ_NAZWA,KRAJ_KOD) values ('16','Luksemburg','LU');
Insert into BANK.KODY_UE (KRAJ_ID,KRAJ_NAZWA,KRAJ_KOD) values ('17','£otwa','LV');
Insert into BANK.KODY_UE (KRAJ_ID,KRAJ_NAZWA,KRAJ_KOD) values ('18','Malta','MT');
Insert into BANK.KODY_UE (KRAJ_ID,KRAJ_NAZWA,KRAJ_KOD) values ('19','Niemcy','DE');
Insert into BANK.KODY_UE (KRAJ_ID,KRAJ_NAZWA,KRAJ_KOD) values ('20','Polska','PL');
Insert into BANK.KODY_UE (KRAJ_ID,KRAJ_NAZWA,KRAJ_KOD) values ('21','Portugalia','PT');
Insert into BANK.KODY_UE (KRAJ_ID,KRAJ_NAZWA,KRAJ_KOD) values ('22','Rumunia','RO');
Insert into BANK.KODY_UE (KRAJ_ID,KRAJ_NAZWA,KRAJ_KOD) values ('23','S≥owacja','SK');
Insert into BANK.KODY_UE (KRAJ_ID,KRAJ_NAZWA,KRAJ_KOD) values ('24','S≥owenia','SI');
Insert into BANK.KODY_UE (KRAJ_ID,KRAJ_NAZWA,KRAJ_KOD) values ('25','Szwecja','SE');
Insert into BANK.KODY_UE (KRAJ_ID,KRAJ_NAZWA,KRAJ_KOD) values ('26','WÍgry','HU');
Insert into BANK.KODY_UE (KRAJ_ID,KRAJ_NAZWA,KRAJ_KOD) values ('27','W≥ochy','IT');
REM INSERTING into BANK.KONTA
SET DEFINE OFF;
Insert into BANK.KONTA (KONTO_ID,KONTO_NR,KONTO_OSZCZ_ID,KONTO_F_CZY_AKTYWNE,KONTO_KR_ID,KONTO_WLASC_ID) values ('26','11918222712721523335742933',null,'T','20','8');
Insert into BANK.KONTA (KONTO_ID,KONTO_NR,KONTO_OSZCZ_ID,KONTO_F_CZY_AKTYWNE,KONTO_KR_ID,KONTO_WLASC_ID) values ('27','11913222712722023435744933',null,'T','20','11');
Insert into BANK.KONTA (KONTO_ID,KONTO_NR,KONTO_OSZCZ_ID,KONTO_F_CZY_AKTYWNE,KONTO_KR_ID,KONTO_WLASC_ID) values ('1','49102028922276300500000000',null,'T','20','2');
Insert into BANK.KONTA (KONTO_ID,KONTO_NR,KONTO_OSZCZ_ID,KONTO_F_CZY_AKTYWNE,KONTO_KR_ID,KONTO_WLASC_ID) values ('2','67910202893226630150214270',null,'T','20','8');
Insert into BANK.KONTA (KONTO_ID,KONTO_NR,KONTO_OSZCZ_ID,KONTO_F_CZY_AKTYWNE,KONTO_KR_ID,KONTO_WLASC_ID) values ('3','40910202893226630150914291',null,'T','20','9');
Insert into BANK.KONTA (KONTO_ID,KONTO_NR,KONTO_OSZCZ_ID,KONTO_F_CZY_AKTYWNE,KONTO_KR_ID,KONTO_WLASC_ID) values ('4','11910202893222610150314870',null,'T','20','14');
Insert into BANK.KONTA (KONTO_ID,KONTO_NR,KONTO_OSZCZ_ID,KONTO_F_CZY_AKTYWNE,KONTO_KR_ID,KONTO_WLASC_ID) values ('5','11910202832226705523117100',null,'N','20','1');
Insert into BANK.KONTA (KONTO_ID,KONTO_NR,KONTO_OSZCZ_ID,KONTO_F_CZY_AKTYWNE,KONTO_KR_ID,KONTO_WLASC_ID) values ('6','11910202893272614158319870',null,'N','20','2');
Insert into BANK.KONTA (KONTO_ID,KONTO_NR,KONTO_OSZCZ_ID,KONTO_F_CZY_AKTYWNE,KONTO_KR_ID,KONTO_WLASC_ID) values ('7','11910202893272614156316472',null,'T','20','3');
Insert into BANK.KONTA (KONTO_ID,KONTO_NR,KONTO_OSZCZ_ID,KONTO_F_CZY_AKTYWNE,KONTO_KR_ID,KONTO_WLASC_ID) values ('8','11910202893702644159316272',null,'T','20','16');
Insert into BANK.KONTA (KONTO_ID,KONTO_NR,KONTO_OSZCZ_ID,KONTO_F_CZY_AKTYWNE,KONTO_KR_ID,KONTO_WLASC_ID) values ('9','24910202893712642165718374',null,'T','20','16');
Insert into BANK.KONTA (KONTO_ID,KONTO_NR,KONTO_OSZCZ_ID,KONTO_F_CZY_AKTYWNE,KONTO_KR_ID,KONTO_WLASC_ID) values ('10','24910202876512242145729379',null,'T','20','1');
Insert into BANK.KONTA (KONTO_ID,KONTO_NR,KONTO_OSZCZ_ID,KONTO_F_CZY_AKTYWNE,KONTO_KR_ID,KONTO_WLASC_ID) values ('11','32910201176512682145229371','4','N','20','14');
Insert into BANK.KONTA (KONTO_ID,KONTO_NR,KONTO_OSZCZ_ID,KONTO_F_CZY_AKTYWNE,KONTO_KR_ID,KONTO_WLASC_ID) values ('12','92910201176512832235299384',null,'T','20','4');
Insert into BANK.KONTA (KONTO_ID,KONTO_NR,KONTO_OSZCZ_ID,KONTO_F_CZY_AKTYWNE,KONTO_KR_ID,KONTO_WLASC_ID) values ('13','92910202276571890235490825',null,'T','20','5');
Insert into BANK.KONTA (KONTO_ID,KONTO_NR,KONTO_OSZCZ_ID,KONTO_F_CZY_AKTYWNE,KONTO_KR_ID,KONTO_WLASC_ID) values ('14','92910202276571295232497843',null,'T','20','6');
Insert into BANK.KONTA (KONTO_ID,KONTO_NR,KONTO_OSZCZ_ID,KONTO_F_CZY_AKTYWNE,KONTO_KR_ID,KONTO_WLASC_ID) values ('15','23910202276541215514367852',null,'T','20','10');
Insert into BANK.KONTA (KONTO_ID,KONTO_NR,KONTO_OSZCZ_ID,KONTO_F_CZY_AKTYWNE,KONTO_KR_ID,KONTO_WLASC_ID) values ('16','23910202276241223512367251',null,'T','20','11');
Insert into BANK.KONTA (KONTO_ID,KONTO_NR,KONTO_OSZCZ_ID,KONTO_F_CZY_AKTYWNE,KONTO_KR_ID,KONTO_WLASC_ID) values ('17','11910202276541673872997850',null,'T','20','12');
Insert into BANK.KONTA (KONTO_ID,KONTO_NR,KONTO_OSZCZ_ID,KONTO_F_CZY_AKTYWNE,KONTO_KR_ID,KONTO_WLASC_ID) values ('18','27910202276545675875495885',null,'N','20','13');
Insert into BANK.KONTA (KONTO_ID,KONTO_NR,KONTO_OSZCZ_ID,KONTO_F_CZY_AKTYWNE,KONTO_KR_ID,KONTO_WLASC_ID) values ('19','11910222271541572472977850',null,'T','20','15');
Insert into BANK.KONTA (KONTO_ID,KONTO_NR,KONTO_OSZCZ_ID,KONTO_F_CZY_AKTYWNE,KONTO_KR_ID,KONTO_WLASC_ID) values ('20','12910222271142562488781933',null,'N','20','6');
Insert into BANK.KONTA (KONTO_ID,KONTO_NR,KONTO_OSZCZ_ID,KONTO_F_CZY_AKTYWNE,KONTO_KR_ID,KONTO_WLASC_ID) values ('21','11919222712421524889741933',null,'N','20','4');
Insert into BANK.KONTA (KONTO_ID,KONTO_NR,KONTO_OSZCZ_ID,KONTO_F_CZY_AKTYWNE,KONTO_KR_ID,KONTO_WLASC_ID) values ('22','11919222201240124089701903','13','T','20','5');
Insert into BANK.KONTA (KONTO_ID,KONTO_NR,KONTO_OSZCZ_ID,KONTO_F_CZY_AKTYWNE,KONTO_KR_ID,KONTO_WLASC_ID) values ('23','11916232327210142449741900','14','T','20','6');
Insert into BANK.KONTA (KONTO_ID,KONTO_NR,KONTO_OSZCZ_ID,KONTO_F_CZY_AKTYWNE,KONTO_KR_ID,KONTO_WLASC_ID) values ('24','11916232827219142444741900','6','N',null,null);
Insert into BANK.KONTA (KONTO_ID,KONTO_NR,KONTO_OSZCZ_ID,KONTO_F_CZY_AKTYWNE,KONTO_KR_ID,KONTO_WLASC_ID) values ('25','19162321270225424072792920',null,'N','20','8');
REM INSERTING into BANK.KONTA_HIST
SET DEFINE OFF;
Insert into BANK.KONTA_HIST (KONTO_ID,KONTO_NR,KONTO_OSZCZ_ID,KONTO_F_CZY_AKTYWNE,KONTO_KR_ID,KONTO_WLASC_ID) values ('24','11916232827219142444741900','6','N','20','2');
REM INSERTING into BANK.LOGS_TABLE
SET DEFINE OFF;
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('42',to_timestamp('22/09/26 19:47:42,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_UTILITIES',null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('43',to_timestamp('22/09/26 19:47:42,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('113',to_timestamp('22/10/08 22:25:56,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_UTILITIES',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('114',to_timestamp('22/10/08 22:25:56,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_TRANSAKCJA',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('133',to_timestamp('22/10/09 16:06:46,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_UTILITIES',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('193',to_timestamp('22/10/17 17:33:53,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_UTILITIES',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('354',to_timestamp('22/10/21 21:41:46,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('355',to_timestamp('22/10/21 21:41:46,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('356',to_timestamp('22/10/21 21:41:46,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('357',to_timestamp('22/10/21 21:41:46,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('358',to_timestamp('22/10/21 21:41:46,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('359',to_timestamp('22/10/21 21:41:46,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('360',to_timestamp('22/10/21 21:41:46,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('361',to_timestamp('22/10/21 21:41:46,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('362',to_timestamp('22/10/21 21:49:15,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('363',to_timestamp('22/10/21 21:49:15,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('364',to_timestamp('22/10/21 21:49:15,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('365',to_timestamp('22/10/21 21:49:15,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('366',to_timestamp('22/10/21 21:49:15,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('367',to_timestamp('22/10/21 21:49:15,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('368',to_timestamp('22/10/21 21:49:15,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('369',to_timestamp('22/10/21 21:49:15,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('370',to_timestamp('22/10/21 21:49:15,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('371',to_timestamp('22/10/21 21:49:15,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('372',to_timestamp('22/10/21 21:49:15,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('373',to_timestamp('22/10/21 21:49:17,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('374',to_timestamp('22/10/21 21:49:17,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('375',to_timestamp('22/10/21 21:49:17,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('376',to_timestamp('22/10/21 21:49:17,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('377',to_timestamp('22/10/21 21:49:17,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('378',to_timestamp('22/10/21 21:49:17,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('379',to_timestamp('22/10/21 21:49:17,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('380',to_timestamp('22/10/21 21:49:17,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('381',to_timestamp('22/10/21 21:49:17,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('382',to_timestamp('22/10/21 21:49:17,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('383',to_timestamp('22/10/21 21:49:17,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('384',to_timestamp('22/10/21 21:49:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('385',to_timestamp('22/10/21 21:49:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('386',to_timestamp('22/10/21 21:49:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('387',to_timestamp('22/10/21 21:49:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('388',to_timestamp('22/10/21 21:49:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('389',to_timestamp('22/10/21 21:49:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('390',to_timestamp('22/10/21 21:49:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('391',to_timestamp('22/10/21 21:49:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('392',to_timestamp('22/10/21 21:49:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('393',to_timestamp('22/10/21 21:49:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('394',to_timestamp('22/10/21 21:49:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('395',to_timestamp('22/10/21 21:49:58,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('396',to_timestamp('22/10/21 21:49:58,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('397',to_timestamp('22/10/21 21:49:58,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('398',to_timestamp('22/10/21 21:49:58,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('399',to_timestamp('22/10/21 21:49:58,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('400',to_timestamp('22/10/21 21:49:58,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('401',to_timestamp('22/10/21 21:49:58,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('402',to_timestamp('22/10/21 21:49:58,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('403',to_timestamp('22/10/21 21:49:58,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('404',to_timestamp('22/10/21 21:49:58,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('405',to_timestamp('22/10/21 21:49:58,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('62',to_timestamp('22/10/03 21:13:05,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_UTILITIES',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('63',to_timestamp('22/10/03 21:16:00,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_UTILITIES',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('64',to_timestamp('22/10/03 21:18:18,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_UTILITIES',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('65',to_timestamp('22/10/03 21:27:34,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_UTILITIES',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('66',to_timestamp('22/10/03 21:27:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('67',to_timestamp('22/10/03 21:32:01,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_UTILITIES',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('68',to_timestamp('22/10/03 21:36:02,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_TRANSAKCJA',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('69',to_timestamp('22/10/03 21:37:37,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_TRANSAKCJA',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('70',to_timestamp('22/10/03 21:38:47,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_TRANSAKCJA',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('71',to_timestamp('22/10/03 21:39:53,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_TRANSAKCJA',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('72',to_timestamp('22/10/03 21:39:53,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('406',to_timestamp('22/10/21 21:50:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('407',to_timestamp('22/10/21 21:50:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('408',to_timestamp('22/10/21 21:50:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('409',to_timestamp('22/10/21 21:50:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('410',to_timestamp('22/10/21 21:50:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('411',to_timestamp('22/10/21 21:50:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('412',to_timestamp('22/10/21 21:50:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('413',to_timestamp('22/10/21 21:50:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('414',to_timestamp('22/10/21 21:50:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('415',to_timestamp('22/10/21 21:50:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('416',to_timestamp('22/10/21 21:50:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('417',to_timestamp('22/10/21 21:50:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('418',to_timestamp('22/10/21 21:50:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('419',to_timestamp('22/10/21 21:50:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('420',to_timestamp('22/10/21 21:50:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('421',to_timestamp('22/10/21 21:50:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('422',to_timestamp('22/10/21 21:50:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('423',to_timestamp('22/10/21 21:50:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('424',to_timestamp('22/10/21 21:50:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('425',to_timestamp('22/10/21 21:50:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('426',to_timestamp('22/10/21 21:50:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('427',to_timestamp('22/10/21 21:50:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('435',to_timestamp('22/10/27 21:49:12,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_UTILITIES',null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('436',to_timestamp('22/10/27 21:49:12,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_TRANSAKCJA',null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('437',to_timestamp('22/10/27 21:49:37,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('438',to_timestamp('22/10/27 21:51:11,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('439',to_timestamp('22/10/27 21:51:11,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('441',to_timestamp('22/10/27 21:51:15,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('442',to_timestamp('22/10/27 21:51:15,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('444',to_timestamp('22/10/27 21:51:54,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('445',to_timestamp('22/10/27 21:51:54,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('446',to_timestamp('22/10/27 21:51:54,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('447',to_timestamp('22/10/27 21:52:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('448',to_timestamp('22/10/27 21:52:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('449',to_timestamp('22/10/27 21:52:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('450',to_timestamp('22/10/27 21:54:51,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('451',to_timestamp('22/10/27 21:54:51,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('452',to_timestamp('22/10/27 21:54:51,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('453',to_timestamp('22/10/27 21:54:51,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('454',to_timestamp('22/10/27 21:54:51,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('455',to_timestamp('22/10/27 21:54:51,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('456',to_timestamp('22/10/27 21:54:51,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('457',to_timestamp('22/10/27 21:54:51,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('458',to_timestamp('22/10/27 21:54:51,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('459',to_timestamp('22/10/27 21:54:51,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('460',to_timestamp('22/10/27 21:54:51,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('461',to_timestamp('22/10/27 21:55:29,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('462',to_timestamp('22/10/27 21:55:29,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('463',to_timestamp('22/10/27 21:55:29,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('464',to_timestamp('22/10/27 21:55:29,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('465',to_timestamp('22/10/27 21:55:29,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('466',to_timestamp('22/10/27 21:55:29,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('467',to_timestamp('22/10/27 21:55:29,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('468',to_timestamp('22/10/27 21:55:29,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('61',to_timestamp('22/10/02 20:24:55,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_UTILITIES',null,'SYS');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('215',to_timestamp('22/10/21 21:11:44,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_UTILITIES',null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('218',to_timestamp('22/10/21 21:14:35,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_UTILITIES',null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('220',to_timestamp('22/10/21 21:15:32,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('221',to_timestamp('22/10/21 21:15:32,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('222',to_timestamp('22/10/21 21:15:33,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('223',to_timestamp('22/10/21 21:15:33,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('224',to_timestamp('22/10/21 21:16:20,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('225',to_timestamp('22/10/21 21:16:20,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('226',to_timestamp('22/10/21 21:17:29,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('227',to_timestamp('22/10/21 21:17:29,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('228',to_timestamp('22/10/21 21:18:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('229',to_timestamp('22/10/21 21:18:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('230',to_timestamp('22/10/21 21:18:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('231',to_timestamp('22/10/21 21:19:20,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('232',to_timestamp('22/10/21 21:19:20,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('233',to_timestamp('22/10/21 21:19:20,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('234',to_timestamp('22/10/21 21:19:37,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('235',to_timestamp('22/10/21 21:19:37,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('236',to_timestamp('22/10/21 21:19:37,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('237',to_timestamp('22/10/21 21:19:45,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('238',to_timestamp('22/10/21 21:19:45,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('239',to_timestamp('22/10/21 21:19:45,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('240',to_timestamp('22/10/21 21:19:45,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('241',to_timestamp('22/10/21 21:20:42,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('242',to_timestamp('22/10/21 21:20:42,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('243',to_timestamp('22/10/21 21:20:42,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('244',to_timestamp('22/10/21 21:20:42,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('245',to_timestamp('22/10/21 21:20:43,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('246',to_timestamp('22/10/21 21:20:43,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('247',to_timestamp('22/10/21 21:20:43,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('248',to_timestamp('22/10/21 21:20:43,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('249',to_timestamp('22/10/21 21:22:28,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('250',to_timestamp('22/10/21 21:22:28,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('251',to_timestamp('22/10/21 21:22:28,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('252',to_timestamp('22/10/21 21:22:28,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('253',to_timestamp('22/10/21 21:23:40,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('254',to_timestamp('22/10/21 21:23:40,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('255',to_timestamp('22/10/21 21:23:40,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('256',to_timestamp('22/10/21 21:23:40,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('257',to_timestamp('22/10/21 21:24:09,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('258',to_timestamp('22/10/21 21:24:09,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('259',to_timestamp('22/10/21 21:24:09,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('260',to_timestamp('22/10/21 21:24:09,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('261',to_timestamp('22/10/21 21:25:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('262',to_timestamp('22/10/21 21:25:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('263',to_timestamp('22/10/21 21:25:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('264',to_timestamp('22/10/21 21:25:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('265',to_timestamp('22/10/21 21:26:17,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('266',to_timestamp('22/10/21 21:26:17,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('267',to_timestamp('22/10/21 21:26:17,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('268',to_timestamp('22/10/21 21:26:17,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('269',to_timestamp('22/10/21 21:27:08,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('270',to_timestamp('22/10/21 21:27:08,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('271',to_timestamp('22/10/21 21:27:08,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('272',to_timestamp('22/10/21 21:27:08,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('273',to_timestamp('22/10/21 21:27:42,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('274',to_timestamp('22/10/21 21:27:42,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('275',to_timestamp('22/10/21 21:27:42,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('276',to_timestamp('22/10/21 21:27:42,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('277',to_timestamp('22/10/21 21:28:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('278',to_timestamp('22/10/21 21:28:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('279',to_timestamp('22/10/21 21:28:11,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('280',to_timestamp('22/10/21 21:28:11,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('281',to_timestamp('22/10/21 21:28:11,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('282',to_timestamp('22/10/21 21:28:21,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('11',to_timestamp('22/09/20 14:17:11,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_UTILITIES',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('12',to_timestamp('22/09/20 14:17:11,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_TRANSAKCJA',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('13',to_timestamp('22/09/20 14:17:35,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('14',to_timestamp('22/09/20 14:17:35,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('15',to_timestamp('22/09/20 14:18:19,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_TRANSAKCJA',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('16',to_timestamp('22/09/20 14:18:19,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('17',to_timestamp('22/09/20 14:18:19,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('18',to_timestamp('22/09/20 14:20:00,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_TRANSAKCJA',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('19',to_timestamp('22/09/20 14:20:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('20',to_timestamp('22/09/20 14:29:26,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_TRANSAKCJA',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('21',to_timestamp('22/09/20 14:29:41,000000000','RR/MM/DD HH24:MI:SSXFF'),'bank_pckg_transakcja.proc_zmien_status(p_trns_id NUMBER)','ERROR HANDLED','BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('93',to_timestamp('22/10/06 22:15:30,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_UTILITIES',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('134',to_timestamp('22/10/09 19:57:15,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_UTILITIES',null,'SYS');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('153',to_timestamp('22/10/13 21:55:02,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_UTILITIES',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('154',to_timestamp('22/10/13 21:55:02,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_TRANSAKCJA',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('155',to_timestamp('22/10/13 22:09:56,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_TRANSAKCJA',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('156',to_timestamp('22/10/13 22:13:54,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_TRANSAKCJA',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('157',to_timestamp('22/10/13 22:14:31,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_TRANSAKCJA',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('213',to_timestamp('22/10/19 18:17:31,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_UTILITIES',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('214',to_timestamp('22/10/19 22:27:23,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_UTILITIES',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('283',to_timestamp('22/10/21 21:28:46,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('284',to_timestamp('22/10/21 21:28:46,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('285',to_timestamp('22/10/21 21:29:35,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('286',to_timestamp('22/10/21 21:29:35,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('287',to_timestamp('22/10/21 21:29:41,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('288',to_timestamp('22/10/21 21:29:41,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('289',to_timestamp('22/10/21 21:29:41,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('290',to_timestamp('22/10/21 21:29:41,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('291',to_timestamp('22/10/21 21:29:46,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('292',to_timestamp('22/10/21 21:29:46,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('293',to_timestamp('22/10/21 21:29:51,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('294',to_timestamp('22/10/21 21:29:51,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('295',to_timestamp('22/10/21 21:29:51,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('296',to_timestamp('22/10/21 21:31:51,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('297',to_timestamp('22/10/21 21:31:51,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('298',to_timestamp('22/10/21 21:31:51,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('299',to_timestamp('22/10/21 21:31:51,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('300',to_timestamp('22/10/21 21:31:51,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('301',to_timestamp('22/10/21 21:31:51,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('302',to_timestamp('22/10/21 21:31:51,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('303',to_timestamp('22/10/21 21:31:51,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('304',to_timestamp('22/10/21 21:31:51,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('305',to_timestamp('22/10/21 21:31:51,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('306',to_timestamp('22/10/21 21:31:51,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('307',to_timestamp('22/10/21 21:36:56,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('308',to_timestamp('22/10/21 21:36:56,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('309',to_timestamp('22/10/21 21:36:56,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('310',to_timestamp('22/10/21 21:36:56,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('311',to_timestamp('22/10/21 21:36:56,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('312',to_timestamp('22/10/21 21:36:56,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('313',to_timestamp('22/10/21 21:36:56,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('314',to_timestamp('22/10/21 21:36:56,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('315',to_timestamp('22/10/21 21:36:56,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('41',to_timestamp('22/09/26 19:35:38,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_UTILITIES',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('44',to_timestamp('22/09/26 21:15:05,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_UTILITIES',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('73',to_timestamp('22/10/04 14:43:49,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_UTILITIES',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('74',to_timestamp('22/10/04 14:43:49,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_TRANSAKCJA',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('75',to_timestamp('22/10/04 14:46:45,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_TRANSAKCJA',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('76',to_timestamp('22/10/04 14:47:54,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_TRANSAKCJA',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('173',to_timestamp('22/10/15 19:53:11,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_UTILITIES',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('174',to_timestamp('22/10/15 19:53:11,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_TRANSAKCJA',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('175',to_timestamp('22/10/15 20:55:58,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_UTILITIES',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('176',to_timestamp('22/10/15 21:04:19,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_UTILITIES',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('177',to_timestamp('22/10/15 22:12:44,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_UTILITIES',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('178',to_timestamp('22/10/15 22:12:44,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_TRANSAKCJA',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('316',to_timestamp('22/10/21 21:36:56,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('317',to_timestamp('22/10/21 21:36:56,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('318',to_timestamp('22/10/21 21:37:02,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('319',to_timestamp('22/10/21 21:37:02,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('320',to_timestamp('22/10/21 21:37:02,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('321',to_timestamp('22/10/21 21:37:02,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('322',to_timestamp('22/10/21 21:37:02,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('323',to_timestamp('22/10/21 21:37:02,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('324',to_timestamp('22/10/21 21:37:02,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('325',to_timestamp('22/10/21 21:37:02,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('326',to_timestamp('22/10/21 21:37:02,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('327',to_timestamp('22/10/21 21:37:02,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('328',to_timestamp('22/10/21 21:37:02,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('329',to_timestamp('22/10/21 21:41:40,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('330',to_timestamp('22/10/21 21:41:40,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('331',to_timestamp('22/10/21 21:41:40,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('332',to_timestamp('22/10/21 21:41:40,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('333',to_timestamp('22/10/21 21:41:40,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('334',to_timestamp('22/10/21 21:41:40,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('335',to_timestamp('22/10/21 21:41:40,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('336',to_timestamp('22/10/21 21:41:40,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('337',to_timestamp('22/10/21 21:41:40,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('338',to_timestamp('22/10/21 21:41:40,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('339',to_timestamp('22/10/21 21:41:40,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('340',to_timestamp('22/10/21 21:41:43,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('341',to_timestamp('22/10/21 21:41:43,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('342',to_timestamp('22/10/21 21:41:43,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('343',to_timestamp('22/10/21 21:41:43,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('344',to_timestamp('22/10/21 21:41:43,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('345',to_timestamp('22/10/21 21:41:43,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('346',to_timestamp('22/10/21 21:41:43,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('347',to_timestamp('22/10/21 21:41:43,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('348',to_timestamp('22/10/21 21:41:43,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('349',to_timestamp('22/10/21 21:41:43,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('350',to_timestamp('22/10/21 21:41:43,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('351',to_timestamp('22/10/21 21:41:46,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('352',to_timestamp('22/10/21 21:41:46,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('353',to_timestamp('22/10/21 21:41:46,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('699',to_timestamp('22/10/27 22:18:27,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('700',to_timestamp('22/10/27 22:18:27,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('701',to_timestamp('22/10/27 22:18:27,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('702',to_timestamp('22/10/27 22:18:27,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('703',to_timestamp('22/10/27 22:18:27,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('704',to_timestamp('22/10/27 22:18:27,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('705',to_timestamp('22/10/27 22:18:28,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('706',to_timestamp('22/10/27 22:18:28,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('707',to_timestamp('22/10/27 22:18:28,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('708',to_timestamp('22/10/27 22:18:28,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('709',to_timestamp('22/10/27 22:18:28,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('710',to_timestamp('22/10/27 22:18:28,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('711',to_timestamp('22/10/27 22:18:28,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('712',to_timestamp('22/10/27 22:18:28,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('713',to_timestamp('22/10/27 22:18:28,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('714',to_timestamp('22/10/27 22:18:28,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('715',to_timestamp('22/10/27 22:18:28,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('716',to_timestamp('22/10/27 22:18:29,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('717',to_timestamp('22/10/27 22:18:29,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('718',to_timestamp('22/10/27 22:18:29,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('719',to_timestamp('22/10/27 22:18:29,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('720',to_timestamp('22/10/27 22:18:29,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('721',to_timestamp('22/10/27 22:18:29,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('722',to_timestamp('22/10/27 22:18:29,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('723',to_timestamp('22/10/27 22:18:29,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('724',to_timestamp('22/10/27 22:18:29,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('725',to_timestamp('22/10/27 22:18:29,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('726',to_timestamp('22/10/27 22:18:29,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('727',to_timestamp('22/10/27 22:18:30,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('728',to_timestamp('22/10/27 22:18:30,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('729',to_timestamp('22/10/27 22:18:30,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('730',to_timestamp('22/10/27 22:18:30,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('731',to_timestamp('22/10/27 22:18:30,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('732',to_timestamp('22/10/27 22:18:30,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('733',to_timestamp('22/10/27 22:18:30,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('734',to_timestamp('22/10/27 22:18:30,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('735',to_timestamp('22/10/27 22:18:30,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('736',to_timestamp('22/10/27 22:18:30,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('737',to_timestamp('22/10/27 22:18:30,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('738',to_timestamp('22/10/27 22:18:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('739',to_timestamp('22/10/27 22:18:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('740',to_timestamp('22/10/27 22:18:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('741',to_timestamp('22/10/27 22:18:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('742',to_timestamp('22/10/27 22:18:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('743',to_timestamp('22/10/27 22:18:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('744',to_timestamp('22/10/27 22:18:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('745',to_timestamp('22/10/27 22:18:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('746',to_timestamp('22/10/27 22:18:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('747',to_timestamp('22/10/27 22:18:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('748',to_timestamp('22/10/27 22:18:34,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('749',to_timestamp('22/10/27 22:22:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('750',to_timestamp('22/10/27 22:22:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('751',to_timestamp('22/10/27 22:22:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('752',to_timestamp('22/10/27 22:22:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('753',to_timestamp('22/10/27 22:22:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('754',to_timestamp('22/10/27 22:22:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('755',to_timestamp('22/10/27 22:22:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('756',to_timestamp('22/10/27 22:22:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('757',to_timestamp('22/10/27 22:22:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('758',to_timestamp('22/10/27 22:22:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('759',to_timestamp('22/10/27 22:22:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('760',to_timestamp('22/10/27 22:22:01,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('761',to_timestamp('22/10/27 22:22:01,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('762',to_timestamp('22/10/27 22:22:01,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('763',to_timestamp('22/10/27 22:22:01,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('764',to_timestamp('22/10/27 22:22:01,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('765',to_timestamp('22/10/27 22:22:01,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('766',to_timestamp('22/10/27 22:22:01,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('767',to_timestamp('22/10/27 22:22:01,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('768',to_timestamp('22/10/27 22:22:01,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('769',to_timestamp('22/10/27 22:22:01,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('770',to_timestamp('22/10/27 22:22:01,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('771',to_timestamp('22/10/27 22:22:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('772',to_timestamp('22/10/27 22:22:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('773',to_timestamp('22/10/27 22:22:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('774',to_timestamp('22/10/27 22:22:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('775',to_timestamp('22/10/27 22:22:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('776',to_timestamp('22/10/27 22:22:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('777',to_timestamp('22/10/27 22:22:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('778',to_timestamp('22/10/27 22:22:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('779',to_timestamp('22/10/27 22:22:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('780',to_timestamp('22/10/27 22:22:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('781',to_timestamp('22/10/27 22:22:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('782',to_timestamp('22/10/27 22:22:07,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('783',to_timestamp('22/10/27 22:22:07,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('784',to_timestamp('22/10/27 22:22:07,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('785',to_timestamp('22/10/27 22:22:07,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('786',to_timestamp('22/10/27 22:22:07,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('787',to_timestamp('22/10/27 22:22:07,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('788',to_timestamp('22/10/27 22:22:07,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('789',to_timestamp('22/10/27 22:22:07,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('790',to_timestamp('22/10/27 22:22:07,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('791',to_timestamp('22/10/27 22:22:07,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('792',to_timestamp('22/10/27 22:22:07,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('793',to_timestamp('22/10/27 22:22:08,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('794',to_timestamp('22/10/27 22:22:08,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('795',to_timestamp('22/10/27 22:22:08,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('796',to_timestamp('22/10/27 22:22:08,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('797',to_timestamp('22/10/27 22:22:08,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('798',to_timestamp('22/10/27 22:22:08,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('799',to_timestamp('22/10/27 22:22:08,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('800',to_timestamp('22/10/27 22:22:08,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('801',to_timestamp('22/10/27 22:22:08,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('802',to_timestamp('22/10/27 22:22:08,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('803',to_timestamp('22/10/27 22:22:08,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('804',to_timestamp('22/10/27 23:34:07,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('805',to_timestamp('22/10/27 23:34:07,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('806',to_timestamp('22/10/27 23:34:07,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('807',to_timestamp('22/10/27 23:34:07,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('808',to_timestamp('22/10/27 23:34:07,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('809',to_timestamp('22/10/27 23:34:07,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('810',to_timestamp('22/10/27 23:34:07,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('811',to_timestamp('22/10/27 23:34:07,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('812',to_timestamp('22/10/27 23:34:07,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('813',to_timestamp('22/10/27 23:34:07,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('814',to_timestamp('22/10/27 23:34:07,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('815',to_timestamp('22/10/27 23:34:15,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('816',to_timestamp('22/10/27 23:34:15,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('817',to_timestamp('22/10/27 23:34:15,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('818',to_timestamp('22/10/27 23:34:15,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('819',to_timestamp('22/10/27 23:34:15,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('820',to_timestamp('22/10/27 23:34:15,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('821',to_timestamp('22/10/27 23:34:15,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('822',to_timestamp('22/10/27 23:34:15,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('823',to_timestamp('22/10/27 23:34:15,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('824',to_timestamp('22/10/27 23:34:15,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('825',to_timestamp('22/10/27 23:34:15,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('826',to_timestamp('22/10/27 23:34:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('827',to_timestamp('22/10/27 23:34:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('828',to_timestamp('22/10/27 23:34:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('829',to_timestamp('22/10/27 23:34:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('830',to_timestamp('22/10/27 23:34:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('831',to_timestamp('22/10/27 23:34:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('832',to_timestamp('22/10/27 23:34:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('833',to_timestamp('22/10/27 23:34:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('834',to_timestamp('22/10/27 23:34:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('835',to_timestamp('22/10/27 23:34:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('836',to_timestamp('22/10/27 23:34:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('837',to_timestamp('22/10/27 23:34:55,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('838',to_timestamp('22/10/27 23:34:55,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('839',to_timestamp('22/10/27 23:34:58,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('840',to_timestamp('22/10/27 23:34:58,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('841',to_timestamp('22/10/27 23:35:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('842',to_timestamp('22/10/27 23:35:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('843',to_timestamp('22/10/27 23:35:29,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('844',to_timestamp('22/10/27 23:35:29,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('845',to_timestamp('22/10/27 23:35:33,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('846',to_timestamp('22/10/27 23:35:33,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('847',to_timestamp('22/10/27 23:35:36,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('848',to_timestamp('22/10/27 23:35:36,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('849',to_timestamp('22/10/27 23:36:21,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('850',to_timestamp('22/10/27 23:36:21,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('851',to_timestamp('22/10/27 23:36:21,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('852',to_timestamp('22/10/27 23:36:41,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('853',to_timestamp('22/10/27 23:36:41,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('854',to_timestamp('22/10/27 23:36:41,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('855',to_timestamp('22/10/27 23:36:46,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('856',to_timestamp('22/10/27 23:36:46,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('857',to_timestamp('22/10/27 23:36:49,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('858',to_timestamp('22/10/27 23:36:49,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('859',to_timestamp('22/10/27 23:44:24,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('860',to_timestamp('22/10/27 23:44:24,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('861',to_timestamp('22/10/27 23:44:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('862',to_timestamp('22/10/27 23:44:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('863',to_timestamp('22/10/27 23:44:31,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('864',to_timestamp('22/10/27 23:44:31,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('865',to_timestamp('22/10/27 23:44:38,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('866',to_timestamp('22/10/27 23:44:38,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('867',to_timestamp('22/10/27 23:44:38,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('868',to_timestamp('22/10/27 23:44:51,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('869',to_timestamp('22/10/27 23:44:51,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('870',to_timestamp('22/10/27 23:44:51,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('871',to_timestamp('22/10/27 23:45:12,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('872',to_timestamp('22/10/27 23:45:12,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('873',to_timestamp('22/10/27 23:45:12,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('874',to_timestamp('22/10/27 23:45:12,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('875',to_timestamp('22/10/27 23:45:12,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('876',to_timestamp('22/10/27 23:45:12,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('877',to_timestamp('22/10/27 23:45:12,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('878',to_timestamp('22/10/27 23:45:12,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('879',to_timestamp('22/10/27 23:45:12,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('880',to_timestamp('22/10/27 23:45:12,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('881',to_timestamp('22/10/27 23:45:12,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('882',to_timestamp('22/10/27 23:46:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('883',to_timestamp('22/10/27 23:46:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('884',to_timestamp('22/10/27 23:46:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('885',to_timestamp('22/10/27 23:46:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('886',to_timestamp('22/10/27 23:46:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('887',to_timestamp('22/10/27 23:46:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('888',to_timestamp('22/10/27 23:46:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('889',to_timestamp('22/10/27 23:46:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('890',to_timestamp('22/10/27 23:46:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('891',to_timestamp('22/10/27 23:46:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('892',to_timestamp('22/10/27 23:46:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('893',to_timestamp('22/10/27 23:46:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('894',to_timestamp('22/10/27 23:46:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('895',to_timestamp('22/10/27 23:46:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('896',to_timestamp('22/10/27 23:46:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('897',to_timestamp('22/10/27 23:46:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('898',to_timestamp('22/10/27 23:46:26,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('899',to_timestamp('22/10/27 23:46:54,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('900',to_timestamp('22/10/27 23:46:54,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('901',to_timestamp('22/10/27 23:46:54,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('902',to_timestamp('22/10/27 23:46:54,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('903',to_timestamp('22/10/27 23:46:54,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('904',to_timestamp('22/10/27 23:46:54,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('905',to_timestamp('22/10/27 23:46:54,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('906',to_timestamp('22/10/27 23:46:54,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('907',to_timestamp('22/10/27 23:46:54,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('908',to_timestamp('22/10/27 23:46:54,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('909',to_timestamp('22/10/27 23:46:54,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('910',to_timestamp('22/10/27 23:46:56,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('911',to_timestamp('22/10/27 23:46:56,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('912',to_timestamp('22/10/27 23:46:56,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('913',to_timestamp('22/10/27 23:46:56,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('914',to_timestamp('22/10/27 23:46:56,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('915',to_timestamp('22/10/27 23:46:56,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('916',to_timestamp('22/10/27 23:46:56,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('917',to_timestamp('22/10/27 23:46:56,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('918',to_timestamp('22/10/27 23:46:56,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('919',to_timestamp('22/10/27 23:46:56,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('920',to_timestamp('22/10/27 23:46:56,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('921',to_timestamp('22/10/27 23:46:57,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('922',to_timestamp('22/10/27 23:46:57,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('923',to_timestamp('22/10/27 23:46:57,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('924',to_timestamp('22/10/27 23:46:57,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('925',to_timestamp('22/10/27 23:46:57,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('926',to_timestamp('22/10/27 23:46:57,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('927',to_timestamp('22/10/27 23:46:57,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('928',to_timestamp('22/10/27 23:46:57,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('929',to_timestamp('22/10/27 23:46:57,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('930',to_timestamp('22/10/27 23:46:57,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('931',to_timestamp('22/10/27 23:46:57,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('932',to_timestamp('22/10/27 23:47:12,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('933',to_timestamp('22/10/27 23:47:12,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('934',to_timestamp('22/10/27 23:47:14,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('935',to_timestamp('22/10/27 23:47:14,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('936',to_timestamp('22/10/27 23:47:20,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('937',to_timestamp('22/10/27 23:47:20,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('938',to_timestamp('22/10/27 23:47:20,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('939',to_timestamp('22/10/27 23:47:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('940',to_timestamp('22/10/27 23:47:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('941',to_timestamp('22/10/27 23:47:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('942',to_timestamp('22/10/27 23:47:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('943',to_timestamp('22/10/27 23:47:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('944',to_timestamp('22/10/27 23:47:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('945',to_timestamp('22/10/27 23:47:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('946',to_timestamp('22/10/27 23:47:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('947',to_timestamp('22/10/27 23:47:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('948',to_timestamp('22/10/27 23:47:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('949',to_timestamp('22/10/27 23:47:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('950',to_timestamp('22/10/27 23:48:20,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('951',to_timestamp('22/10/27 23:48:20,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('952',to_timestamp('22/10/27 23:48:22,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('953',to_timestamp('22/10/27 23:48:22,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('954',to_timestamp('22/10/27 23:48:33,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('955',to_timestamp('22/10/27 23:48:33,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('956',to_timestamp('22/10/27 23:48:33,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('957',to_timestamp('22/10/27 23:48:33,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('958',to_timestamp('22/10/27 23:48:33,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('959',to_timestamp('22/10/27 23:48:33,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('960',to_timestamp('22/10/27 23:48:33,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('961',to_timestamp('22/10/27 23:48:33,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('962',to_timestamp('22/10/27 23:48:33,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('963',to_timestamp('22/10/27 23:48:41,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('964',to_timestamp('22/10/27 23:48:41,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('965',to_timestamp('22/10/27 23:48:43,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('966',to_timestamp('22/10/27 23:48:43,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('967',to_timestamp('22/10/27 23:48:50,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('968',to_timestamp('22/10/27 23:48:50,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('969',to_timestamp('22/10/27 23:48:50,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('970',to_timestamp('22/10/27 23:48:50,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('971',to_timestamp('22/10/27 23:48:50,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('972',to_timestamp('22/10/27 23:48:50,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('973',to_timestamp('22/10/27 23:48:50,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('974',to_timestamp('22/10/27 23:48:50,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('975',to_timestamp('22/10/27 23:48:50,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('976',to_timestamp('22/10/27 23:48:52,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('977',to_timestamp('22/10/27 23:48:52,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('978',to_timestamp('22/10/27 23:48:52,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('979',to_timestamp('22/10/27 23:48:52,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('980',to_timestamp('22/10/27 23:48:52,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('981',to_timestamp('22/10/27 23:48:52,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('982',to_timestamp('22/10/27 23:48:52,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('983',to_timestamp('22/10/27 23:48:52,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('984',to_timestamp('22/10/27 23:48:52,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('985',to_timestamp('22/10/27 23:49:02,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('986',to_timestamp('22/10/27 23:49:02,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('987',to_timestamp('22/10/27 23:49:02,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('988',to_timestamp('22/10/27 23:49:02,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('989',to_timestamp('22/10/27 23:49:02,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('990',to_timestamp('22/10/27 23:49:02,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('991',to_timestamp('22/10/27 23:49:02,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('992',to_timestamp('22/10/27 23:49:02,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('993',to_timestamp('22/10/27 23:49:02,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('994',to_timestamp('22/10/27 23:49:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('995',to_timestamp('22/10/27 23:49:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('996',to_timestamp('22/10/27 23:49:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('997',to_timestamp('22/10/27 23:49:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('998',to_timestamp('22/10/27 23:49:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('999',to_timestamp('22/10/27 23:49:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1000',to_timestamp('22/10/27 23:49:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1001',to_timestamp('22/10/27 23:49:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1002',to_timestamp('22/10/27 23:49:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1003',to_timestamp('22/10/27 23:49:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1004',to_timestamp('22/10/27 23:49:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1005',to_timestamp('22/10/27 23:49:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1006',to_timestamp('22/10/27 23:49:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1007',to_timestamp('22/10/27 23:49:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1008',to_timestamp('22/10/27 23:49:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1009',to_timestamp('22/10/27 23:49:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1010',to_timestamp('22/10/27 23:49:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1011',to_timestamp('22/10/27 23:49:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1012',to_timestamp('22/10/27 23:49:17,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1013',to_timestamp('22/10/27 23:49:17,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1014',to_timestamp('22/10/27 23:50:25,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1015',to_timestamp('22/10/27 23:50:25,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1016',to_timestamp('22/10/27 23:50:25,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1017',to_timestamp('22/10/27 23:50:25,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1018',to_timestamp('22/10/27 23:50:25,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1019',to_timestamp('22/10/27 23:50:25,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1020',to_timestamp('22/10/27 23:50:25,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1021',to_timestamp('22/10/27 23:50:25,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1022',to_timestamp('22/10/27 23:50:25,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1023',to_timestamp('22/10/27 23:50:31,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1024',to_timestamp('22/10/27 23:50:31,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1025',to_timestamp('22/10/27 23:50:31,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1026',to_timestamp('22/10/27 23:50:31,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1027',to_timestamp('22/10/27 23:50:31,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1028',to_timestamp('22/10/27 23:50:31,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1029',to_timestamp('22/10/27 23:50:31,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1030',to_timestamp('22/10/27 23:50:31,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1031',to_timestamp('22/10/27 23:50:31,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1032',to_timestamp('22/10/27 23:50:43,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1033',to_timestamp('22/10/27 23:50:43,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1034',to_timestamp('22/10/27 23:50:45,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1035',to_timestamp('22/10/27 23:50:45,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1036',to_timestamp('22/10/27 23:50:53,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1037',to_timestamp('22/10/27 23:50:53,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1038',to_timestamp('22/10/27 23:50:53,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1039',to_timestamp('22/10/28 00:02:56,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1040',to_timestamp('22/10/28 00:32:58,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1041',to_timestamp('22/10/28 00:34:10,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('1055',to_timestamp('23/02/18 10:48:20,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK_PCKG_UTILITIES',null,'BANK');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('469',to_timestamp('22/10/27 21:55:29,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('470',to_timestamp('22/10/27 21:55:29,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('471',to_timestamp('22/10/27 21:55:29,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('472',to_timestamp('22/10/27 21:56:41,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('473',to_timestamp('22/10/27 21:56:41,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('474',to_timestamp('22/10/27 21:56:41,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('475',to_timestamp('22/10/27 21:56:41,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('476',to_timestamp('22/10/27 21:56:41,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('477',to_timestamp('22/10/27 21:56:41,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('478',to_timestamp('22/10/27 21:56:41,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('479',to_timestamp('22/10/27 21:56:41,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('480',to_timestamp('22/10/27 21:56:41,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('481',to_timestamp('22/10/27 21:56:41,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('482',to_timestamp('22/10/27 21:56:41,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('483',to_timestamp('22/10/27 21:56:41,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('484',to_timestamp('22/10/27 22:01:50,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('485',to_timestamp('22/10/27 22:01:50,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('486',to_timestamp('22/10/27 22:01:50,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('487',to_timestamp('22/10/27 22:01:50,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('488',to_timestamp('22/10/27 22:01:50,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('489',to_timestamp('22/10/27 22:01:50,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('490',to_timestamp('22/10/27 22:01:50,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('491',to_timestamp('22/10/27 22:01:50,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('492',to_timestamp('22/10/27 22:01:50,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('493',to_timestamp('22/10/27 22:01:50,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('494',to_timestamp('22/10/27 22:01:50,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('495',to_timestamp('22/10/27 22:02:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('496',to_timestamp('22/10/27 22:02:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('497',to_timestamp('22/10/27 22:02:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('498',to_timestamp('22/10/27 22:02:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('499',to_timestamp('22/10/27 22:02:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('500',to_timestamp('22/10/27 22:02:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('501',to_timestamp('22/10/27 22:02:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('502',to_timestamp('22/10/27 22:02:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('503',to_timestamp('22/10/27 22:02:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('504',to_timestamp('22/10/27 22:02:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('505',to_timestamp('22/10/27 22:02:00,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('506',to_timestamp('22/10/27 22:02:20,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('507',to_timestamp('22/10/27 22:02:20,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('508',to_timestamp('22/10/27 22:02:20,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('509',to_timestamp('22/10/27 22:02:20,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('510',to_timestamp('22/10/27 22:02:20,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('511',to_timestamp('22/10/27 22:02:20,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('512',to_timestamp('22/10/27 22:02:20,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('513',to_timestamp('22/10/27 22:02:20,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('514',to_timestamp('22/10/27 22:02:20,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('515',to_timestamp('22/10/27 22:02:20,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('516',to_timestamp('22/10/27 22:02:20,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('517',to_timestamp('22/10/27 22:03:36,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('518',to_timestamp('22/10/27 22:03:36,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('519',to_timestamp('22/10/27 22:03:36,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('520',to_timestamp('22/10/27 22:03:36,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('521',to_timestamp('22/10/27 22:03:36,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('522',to_timestamp('22/10/27 22:03:36,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('523',to_timestamp('22/10/27 22:03:36,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('524',to_timestamp('22/10/27 22:03:36,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('525',to_timestamp('22/10/27 22:03:36,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('526',to_timestamp('22/10/27 22:03:36,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('527',to_timestamp('22/10/27 22:03:36,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('528',to_timestamp('22/10/27 22:04:58,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('529',to_timestamp('22/10/27 22:04:58,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('530',to_timestamp('22/10/27 22:04:58,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('531',to_timestamp('22/10/27 22:04:58,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('532',to_timestamp('22/10/27 22:04:58,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('533',to_timestamp('22/10/27 22:04:58,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('534',to_timestamp('22/10/27 22:04:58,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('535',to_timestamp('22/10/27 22:04:58,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('536',to_timestamp('22/10/27 22:04:58,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('537',to_timestamp('22/10/27 22:04:58,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('538',to_timestamp('22/10/27 22:04:58,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('539',to_timestamp('22/10/27 22:06:27,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('540',to_timestamp('22/10/27 22:06:27,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('541',to_timestamp('22/10/27 22:06:27,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('542',to_timestamp('22/10/27 22:06:27,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('543',to_timestamp('22/10/27 22:06:27,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('544',to_timestamp('22/10/27 22:06:27,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('545',to_timestamp('22/10/27 22:06:27,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('546',to_timestamp('22/10/27 22:06:27,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('547',to_timestamp('22/10/27 22:06:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('548',to_timestamp('22/10/27 22:06:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('549',to_timestamp('22/10/27 22:06:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('550',to_timestamp('22/10/27 22:06:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('551',to_timestamp('22/10/27 22:06:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('552',to_timestamp('22/10/27 22:06:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('553',to_timestamp('22/10/27 22:06:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('554',to_timestamp('22/10/27 22:06:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('555',to_timestamp('22/10/27 22:06:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('556',to_timestamp('22/10/27 22:06:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('557',to_timestamp('22/10/27 22:06:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('558',to_timestamp('22/10/27 22:07:37,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('559',to_timestamp('22/10/27 22:07:37,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('560',to_timestamp('22/10/27 22:07:37,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('561',to_timestamp('22/10/27 22:07:37,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('562',to_timestamp('22/10/27 22:07:37,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('563',to_timestamp('22/10/27 22:07:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('564',to_timestamp('22/10/27 22:07:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('565',to_timestamp('22/10/27 22:07:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('566',to_timestamp('22/10/27 22:07:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('567',to_timestamp('22/10/27 22:07:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('568',to_timestamp('22/10/27 22:07:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('569',to_timestamp('22/10/27 22:07:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('570',to_timestamp('22/10/27 22:07:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('571',to_timestamp('22/10/27 22:07:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('572',to_timestamp('22/10/27 22:07:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('573',to_timestamp('22/10/27 22:07:47,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('574',to_timestamp('22/10/27 22:09:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('575',to_timestamp('22/10/27 22:09:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('576',to_timestamp('22/10/27 22:09:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('577',to_timestamp('22/10/27 22:09:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('578',to_timestamp('22/10/27 22:09:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('579',to_timestamp('22/10/27 22:09:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('580',to_timestamp('22/10/27 22:09:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('581',to_timestamp('22/10/27 22:09:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('582',to_timestamp('22/10/27 22:09:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('583',to_timestamp('22/10/27 22:09:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('584',to_timestamp('22/10/27 22:09:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('585',to_timestamp('22/10/27 22:09:05,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('586',to_timestamp('22/10/27 22:09:05,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('587',to_timestamp('22/10/27 22:09:05,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('588',to_timestamp('22/10/27 22:09:05,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('589',to_timestamp('22/10/27 22:09:05,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('590',to_timestamp('22/10/27 22:09:05,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('591',to_timestamp('22/10/27 22:09:05,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('592',to_timestamp('22/10/27 22:09:05,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('593',to_timestamp('22/10/27 22:09:05,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('594',to_timestamp('22/10/27 22:09:05,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('595',to_timestamp('22/10/27 22:09:05,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('596',to_timestamp('22/10/27 22:09:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('597',to_timestamp('22/10/27 22:09:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('598',to_timestamp('22/10/27 22:09:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('599',to_timestamp('22/10/27 22:09:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('600',to_timestamp('22/10/27 22:09:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('601',to_timestamp('22/10/27 22:09:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('602',to_timestamp('22/10/27 22:09:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('603',to_timestamp('22/10/27 22:09:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('604',to_timestamp('22/10/27 22:09:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('605',to_timestamp('22/10/27 22:09:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('606',to_timestamp('22/10/27 22:09:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('607',to_timestamp('22/10/27 22:09:11,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('608',to_timestamp('22/10/27 22:09:11,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('609',to_timestamp('22/10/27 22:09:11,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('610',to_timestamp('22/10/27 22:09:11,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('611',to_timestamp('22/10/27 22:09:11,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('612',to_timestamp('22/10/27 22:09:11,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('613',to_timestamp('22/10/27 22:09:11,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('614',to_timestamp('22/10/27 22:09:11,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('615',to_timestamp('22/10/27 22:09:11,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('616',to_timestamp('22/10/27 22:09:11,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('617',to_timestamp('22/10/27 22:09:11,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('618',to_timestamp('22/10/27 22:10:24,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('619',to_timestamp('22/10/27 22:10:24,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('620',to_timestamp('22/10/27 22:10:24,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('621',to_timestamp('22/10/27 22:10:24,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('622',to_timestamp('22/10/27 22:10:24,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('623',to_timestamp('22/10/27 22:10:24,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('624',to_timestamp('22/10/27 22:10:24,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('625',to_timestamp('22/10/27 22:10:24,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('626',to_timestamp('22/10/27 22:10:24,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('627',to_timestamp('22/10/27 22:10:24,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('628',to_timestamp('22/10/27 22:10:24,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('629',to_timestamp('22/10/27 22:18:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('630',to_timestamp('22/10/27 22:18:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('631',to_timestamp('22/10/27 22:18:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('632',to_timestamp('22/10/27 22:18:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('633',to_timestamp('22/10/27 22:18:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('634',to_timestamp('22/10/27 22:18:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('635',to_timestamp('22/10/27 22:18:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('636',to_timestamp('22/10/27 22:18:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('637',to_timestamp('22/10/27 22:18:03,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('638',to_timestamp('22/10/27 22:18:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('639',to_timestamp('22/10/27 22:18:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('640',to_timestamp('22/10/27 22:18:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('641',to_timestamp('22/10/27 22:18:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('642',to_timestamp('22/10/27 22:18:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('643',to_timestamp('22/10/27 22:18:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('644',to_timestamp('22/10/27 22:18:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('645',to_timestamp('22/10/27 22:18:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('646',to_timestamp('22/10/27 22:18:04,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('647',to_timestamp('22/10/27 22:18:05,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('648',to_timestamp('22/10/27 22:18:05,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('649',to_timestamp('22/10/27 22:18:05,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('650',to_timestamp('22/10/27 22:18:05,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('651',to_timestamp('22/10/27 22:18:05,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('652',to_timestamp('22/10/27 22:18:05,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('653',to_timestamp('22/10/27 22:18:05,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('654',to_timestamp('22/10/27 22:18:05,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('655',to_timestamp('22/10/27 22:18:05,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('656',to_timestamp('22/10/27 22:18:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('657',to_timestamp('22/10/27 22:18:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('658',to_timestamp('22/10/27 22:18:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('659',to_timestamp('22/10/27 22:18:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('660',to_timestamp('22/10/27 22:18:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('661',to_timestamp('22/10/27 22:18:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('662',to_timestamp('22/10/27 22:18:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('663',to_timestamp('22/10/27 22:18:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('664',to_timestamp('22/10/27 22:18:06,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('665',to_timestamp('22/10/27 22:18:09,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('666',to_timestamp('22/10/27 22:18:09,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('667',to_timestamp('22/10/27 22:18:09,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('668',to_timestamp('22/10/27 22:18:09,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('669',to_timestamp('22/10/27 22:18:09,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('670',to_timestamp('22/10/27 22:18:09,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('671',to_timestamp('22/10/27 22:18:09,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('672',to_timestamp('22/10/27 22:18:09,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('673',to_timestamp('22/10/27 22:18:09,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('674',to_timestamp('22/10/27 22:18:11,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('675',to_timestamp('22/10/27 22:18:11,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('676',to_timestamp('22/10/27 22:18:11,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('677',to_timestamp('22/10/27 22:18:11,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('678',to_timestamp('22/10/27 22:18:11,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('679',to_timestamp('22/10/27 22:18:11,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('680',to_timestamp('22/10/27 22:18:11,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('681',to_timestamp('22/10/27 22:18:11,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('682',to_timestamp('22/10/27 22:18:11,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('683',to_timestamp('22/10/27 22:18:25,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('684',to_timestamp('22/10/27 22:18:25,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('685',to_timestamp('22/10/27 22:18:25,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('686',to_timestamp('22/10/27 22:18:25,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('687',to_timestamp('22/10/27 22:18:25,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('688',to_timestamp('22/10/27 22:18:25,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('689',to_timestamp('22/10/27 22:18:25,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('690',to_timestamp('22/10/27 22:18:25,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('691',to_timestamp('22/10/27 22:18:25,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('692',to_timestamp('22/10/27 22:18:25,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('693',to_timestamp('22/10/27 22:18:25,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('694',to_timestamp('22/10/27 22:18:27,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('695',to_timestamp('22/10/27 22:18:27,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('696',to_timestamp('22/10/27 22:18:27,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('697',to_timestamp('22/10/27 22:18:27,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
Insert into BANK.LOGS_TABLE (LOG_ID,LOG_TIME,LOG_SOURCE,LOG_ADD_INFO,LOG_USER) values ('698',to_timestamp('22/10/27 22:18:27,000000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'HR');
REM INSERTING into BANK.TOP_2_TRNS_MAJ_2022_05_09_2022
SET DEFINE OFF;
Insert into BANK.TOP_2_TRNS_MAJ_2022_05_09_2022 (TRNS_ID,TRNS_KWOTA,TRNS_DATA_OPERACJI,KTO_UTWORZYL) values ('1','120',to_timestamp('22/05/24 01:36:00,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK');
Insert into BANK.TOP_2_TRNS_MAJ_2022_05_09_2022 (TRNS_ID,TRNS_KWOTA,TRNS_DATA_OPERACJI,KTO_UTWORZYL) values ('2','30',to_timestamp('22/05/24 00:18:42,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK');
REM INSERTING into BANK.TOP_2_TRNS_STY_2022_07_09_2022
SET DEFINE OFF;
REM INSERTING into BANK.TOP_3_TRNS_MAJ_2022_06_09_2022
SET DEFINE OFF;
Insert into BANK.TOP_3_TRNS_MAJ_2022_06_09_2022 (TRNS_ID,TRNS_KWOTA,TRNS_DATA_OPERACJI,KTO_UTWORZYL) values ('1','120',to_timestamp('22/05/24 01:36:00,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK');
Insert into BANK.TOP_3_TRNS_MAJ_2022_06_09_2022 (TRNS_ID,TRNS_KWOTA,TRNS_DATA_OPERACJI,KTO_UTWORZYL) values ('2','30',to_timestamp('22/05/24 00:18:42,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK');
Insert into BANK.TOP_3_TRNS_MAJ_2022_06_09_2022 (TRNS_ID,TRNS_KWOTA,TRNS_DATA_OPERACJI,KTO_UTWORZYL) values ('3','550',to_timestamp('22/05/24 01:56:04,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK');
REM INSERTING into BANK.TOP_4_TRNS_MAJ_2022_06_09_2022
SET DEFINE OFF;
Insert into BANK.TOP_4_TRNS_MAJ_2022_06_09_2022 (TRNS_ID,TRNS_KWOTA,TRNS_DATA_OPERACJI,KTO_UTWORZYL) values ('1','120',to_timestamp('22/05/24 01:36:00,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK');
Insert into BANK.TOP_4_TRNS_MAJ_2022_06_09_2022 (TRNS_ID,TRNS_KWOTA,TRNS_DATA_OPERACJI,KTO_UTWORZYL) values ('2','30',to_timestamp('22/05/24 00:18:42,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK');
Insert into BANK.TOP_4_TRNS_MAJ_2022_06_09_2022 (TRNS_ID,TRNS_KWOTA,TRNS_DATA_OPERACJI,KTO_UTWORZYL) values ('3','550',to_timestamp('22/05/24 01:56:04,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK');
Insert into BANK.TOP_4_TRNS_MAJ_2022_06_09_2022 (TRNS_ID,TRNS_KWOTA,TRNS_DATA_OPERACJI,KTO_UTWORZYL) values ('4','200',to_timestamp('22/05/24 01:56:55,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK');
REM INSERTING into BANK.TOP_4_TRNS_SIE_2022_06_09_2022
SET DEFINE OFF;
REM INSERTING into BANK.TOP_5_TRNS_MAJ_2022_04_10_2022
SET DEFINE OFF;
REM INSERTING into BANK.TOP_5_TRNS_MAJ_2022_05_09_2022
SET DEFINE OFF;
Insert into BANK.TOP_5_TRNS_MAJ_2022_05_09_2022 (TRNS_ID,TRNS_KWOTA,TRNS_DATA_OPERACJI,KTO_UTWORZYL) values ('1','120',to_timestamp('22/05/24 01:36:00,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK');
Insert into BANK.TOP_5_TRNS_MAJ_2022_05_09_2022 (TRNS_ID,TRNS_KWOTA,TRNS_DATA_OPERACJI,KTO_UTWORZYL) values ('2','30',to_timestamp('22/05/24 00:18:42,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK');
Insert into BANK.TOP_5_TRNS_MAJ_2022_05_09_2022 (TRNS_ID,TRNS_KWOTA,TRNS_DATA_OPERACJI,KTO_UTWORZYL) values ('3','550',to_timestamp('22/05/24 01:56:04,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK');
Insert into BANK.TOP_5_TRNS_MAJ_2022_05_09_2022 (TRNS_ID,TRNS_KWOTA,TRNS_DATA_OPERACJI,KTO_UTWORZYL) values ('4','200',to_timestamp('22/05/24 01:56:55,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK');
Insert into BANK.TOP_5_TRNS_MAJ_2022_05_09_2022 (TRNS_ID,TRNS_KWOTA,TRNS_DATA_OPERACJI,KTO_UTWORZYL) values ('5','15',to_timestamp('22/05/24 01:59:53,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK');
REM INSERTING into BANK.TOP_6_TRNS_MAJ_2022_05_09_2022
SET DEFINE OFF;
Insert into BANK.TOP_6_TRNS_MAJ_2022_05_09_2022 (TRNS_ID,TRNS_KWOTA,TRNS_DATA_OPERACJI,KTO_UTWORZYL) values ('1','120',to_timestamp('22/05/24 01:36:00,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK');
Insert into BANK.TOP_6_TRNS_MAJ_2022_05_09_2022 (TRNS_ID,TRNS_KWOTA,TRNS_DATA_OPERACJI,KTO_UTWORZYL) values ('2','30',to_timestamp('22/05/24 00:18:42,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK');
Insert into BANK.TOP_6_TRNS_MAJ_2022_05_09_2022 (TRNS_ID,TRNS_KWOTA,TRNS_DATA_OPERACJI,KTO_UTWORZYL) values ('3','550',to_timestamp('22/05/24 01:56:04,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK');
Insert into BANK.TOP_6_TRNS_MAJ_2022_05_09_2022 (TRNS_ID,TRNS_KWOTA,TRNS_DATA_OPERACJI,KTO_UTWORZYL) values ('4','200',to_timestamp('22/05/24 01:56:55,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK');
Insert into BANK.TOP_6_TRNS_MAJ_2022_05_09_2022 (TRNS_ID,TRNS_KWOTA,TRNS_DATA_OPERACJI,KTO_UTWORZYL) values ('5','15',to_timestamp('22/05/24 01:59:53,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK');
REM INSERTING into BANK.TOP_8_TRNS_MAJ_2022_04_10_2022
SET DEFINE OFF;
REM INSERTING into BANK.TOP_9_TRNS_MAJ_2022_04_10_2022
SET DEFINE OFF;
Insert into BANK.TOP_9_TRNS_MAJ_2022_04_10_2022 (TRNS_ID,TRNS_KWOTA,TRNS_DATA_OPERACJI,KTO_UTWORZYL) values ('1','120',to_timestamp('22/05/24 01:36:00,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK');
Insert into BANK.TOP_9_TRNS_MAJ_2022_04_10_2022 (TRNS_ID,TRNS_KWOTA,TRNS_DATA_OPERACJI,KTO_UTWORZYL) values ('2','30',to_timestamp('22/05/24 00:18:42,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK');
Insert into BANK.TOP_9_TRNS_MAJ_2022_04_10_2022 (TRNS_ID,TRNS_KWOTA,TRNS_DATA_OPERACJI,KTO_UTWORZYL) values ('3','550',to_timestamp('22/05/24 01:56:04,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK');
Insert into BANK.TOP_9_TRNS_MAJ_2022_04_10_2022 (TRNS_ID,TRNS_KWOTA,TRNS_DATA_OPERACJI,KTO_UTWORZYL) values ('4','200',to_timestamp('22/05/24 01:56:55,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK');
Insert into BANK.TOP_9_TRNS_MAJ_2022_04_10_2022 (TRNS_ID,TRNS_KWOTA,TRNS_DATA_OPERACJI,KTO_UTWORZYL) values ('5','15',to_timestamp('22/05/24 01:59:53,000000000','RR/MM/DD HH24:MI:SSXFF'),'BANK');
REM INSERTING into BANK.TRANSAKCJE
SET DEFINE OFF;
Insert into BANK.TRANSAKCJE (TRNS_ID,TRNS_RODZAJ,TRNS_KWOTA,TRNS_TYP,DATA_ZAKS,DATA_REALIZ,UTWORZONO_PRZEZ,TRNS_SP_PLAT,TRNS_KONTO_ID,TRNS_KAT_ID) values ('3','W','550','PE',to_date('22/05/24','RR/MM/DD'),to_date('22/05/24','RR/MM/DD'),'BANK','K','10','7');
Insert into BANK.TRANSAKCJE (TRNS_ID,TRNS_RODZAJ,TRNS_KWOTA,TRNS_TYP,DATA_ZAKS,DATA_REALIZ,UTWORZONO_PRZEZ,TRNS_SP_PLAT,TRNS_KONTO_ID,TRNS_KAT_ID) values ('4','P','200','PZ',to_date('22/05/24','RR/MM/DD'),to_date('22/10/15','RR/MM/DD'),'BANK','K','4','1');
Insert into BANK.TRANSAKCJE (TRNS_ID,TRNS_RODZAJ,TRNS_KWOTA,TRNS_TYP,DATA_ZAKS,DATA_REALIZ,UTWORZONO_PRZEZ,TRNS_SP_PLAT,TRNS_KONTO_ID,TRNS_KAT_ID) values ('5','W','15','B',to_date('22/05/24','RR/MM/DD'),to_date('22/05/24','RR/MM/DD'),'BANK','A','2','6');
Insert into BANK.TRANSAKCJE (TRNS_ID,TRNS_RODZAJ,TRNS_KWOTA,TRNS_TYP,DATA_ZAKS,DATA_REALIZ,UTWORZONO_PRZEZ,TRNS_SP_PLAT,TRNS_KONTO_ID,TRNS_KAT_ID) values ('7','W','15','PZ',to_date('22/05/24','RR/MM/DD'),null,'BANK','A','12','5');
Insert into BANK.TRANSAKCJE (TRNS_ID,TRNS_RODZAJ,TRNS_KWOTA,TRNS_TYP,DATA_ZAKS,DATA_REALIZ,UTWORZONO_PRZEZ,TRNS_SP_PLAT,TRNS_KONTO_ID,TRNS_KAT_ID) values ('8','P','300','PZ',to_date('22/05/24','RR/MM/DD'),to_date('22/05/24','RR/MM/DD'),'BANK','A','12','1');
Insert into BANK.TRANSAKCJE (TRNS_ID,TRNS_RODZAJ,TRNS_KWOTA,TRNS_TYP,DATA_ZAKS,DATA_REALIZ,UTWORZONO_PRZEZ,TRNS_SP_PLAT,TRNS_KONTO_ID,TRNS_KAT_ID) values ('9','P','300','PZ',to_date('22/05/24','RR/MM/DD'),null,'BANK','A','12','3');
Insert into BANK.TRANSAKCJE (TRNS_ID,TRNS_RODZAJ,TRNS_KWOTA,TRNS_TYP,DATA_ZAKS,DATA_REALIZ,UTWORZONO_PRZEZ,TRNS_SP_PLAT,TRNS_KONTO_ID,TRNS_KAT_ID) values ('10','P','98','PZ',to_date('22/05/24','RR/MM/DD'),to_date('22/05/24','RR/MM/DD'),'BANK','A','14','1');
Insert into BANK.TRANSAKCJE (TRNS_ID,TRNS_RODZAJ,TRNS_KWOTA,TRNS_TYP,DATA_ZAKS,DATA_REALIZ,UTWORZONO_PRZEZ,TRNS_SP_PLAT,TRNS_KONTO_ID,TRNS_KAT_ID) values ('11','P','98','PE',to_date('22/05/24','RR/MM/DD'),to_date('22/05/24','RR/MM/DD'),'BANK','A','7','2');
Insert into BANK.TRANSAKCJE (TRNS_ID,TRNS_RODZAJ,TRNS_KWOTA,TRNS_TYP,DATA_ZAKS,DATA_REALIZ,UTWORZONO_PRZEZ,TRNS_SP_PLAT,TRNS_KONTO_ID,TRNS_KAT_ID) values ('12','W','1500','PW',to_date('22/05/24','RR/MM/DD'),null,'BANK','A','4','7');
Insert into BANK.TRANSAKCJE (TRNS_ID,TRNS_RODZAJ,TRNS_KWOTA,TRNS_TYP,DATA_ZAKS,DATA_REALIZ,UTWORZONO_PRZEZ,TRNS_SP_PLAT,TRNS_KONTO_ID,TRNS_KAT_ID) values ('13','P','500','B',to_date('22/05/24','RR/MM/DD'),to_date('22/05/24','RR/MM/DD'),'BANK','A','1','1');
Insert into BANK.TRANSAKCJE (TRNS_ID,TRNS_RODZAJ,TRNS_KWOTA,TRNS_TYP,DATA_ZAKS,DATA_REALIZ,UTWORZONO_PRZEZ,TRNS_SP_PLAT,TRNS_KONTO_ID,TRNS_KAT_ID) values ('14','W','500','B',to_date('22/05/24','RR/MM/DD'),to_date('22/05/24','RR/MM/DD'),'BANK','A','1','6');
Insert into BANK.TRANSAKCJE (TRNS_ID,TRNS_RODZAJ,TRNS_KWOTA,TRNS_TYP,DATA_ZAKS,DATA_REALIZ,UTWORZONO_PRZEZ,TRNS_SP_PLAT,TRNS_KONTO_ID,TRNS_KAT_ID) values ('15','W','300','PZ',to_date('22/05/24','RR/MM/DD'),to_date('22/05/24','RR/MM/DD'),'BANK','S','8','4');
Insert into BANK.TRANSAKCJE (TRNS_ID,TRNS_RODZAJ,TRNS_KWOTA,TRNS_TYP,DATA_ZAKS,DATA_REALIZ,UTWORZONO_PRZEZ,TRNS_SP_PLAT,TRNS_KONTO_ID,TRNS_KAT_ID) values ('16','W','133','PZ',to_date('22/05/24','RR/MM/DD'),to_date('22/08/10','RR/MM/DD'),'BANK','S','15','4');
Insert into BANK.TRANSAKCJE (TRNS_ID,TRNS_RODZAJ,TRNS_KWOTA,TRNS_TYP,DATA_ZAKS,DATA_REALIZ,UTWORZONO_PRZEZ,TRNS_SP_PLAT,TRNS_KONTO_ID,TRNS_KAT_ID) values ('17','W','1000','PZ',to_date('22/05/24','RR/MM/DD'),to_date('22/05/24','RR/MM/DD'),'BANK','A','13','4');
Insert into BANK.TRANSAKCJE (TRNS_ID,TRNS_RODZAJ,TRNS_KWOTA,TRNS_TYP,DATA_ZAKS,DATA_REALIZ,UTWORZONO_PRZEZ,TRNS_SP_PLAT,TRNS_KONTO_ID,TRNS_KAT_ID) values ('18','P','130','PZ',to_date('22/05/24','RR/MM/DD'),to_date('22/08/10','RR/MM/DD'),'BANK','S','4','2');
Insert into BANK.TRANSAKCJE (TRNS_ID,TRNS_RODZAJ,TRNS_KWOTA,TRNS_TYP,DATA_ZAKS,DATA_REALIZ,UTWORZONO_PRZEZ,TRNS_SP_PLAT,TRNS_KONTO_ID,TRNS_KAT_ID) values ('1','W','120','PZ',to_date('22/05/24','RR/MM/DD'),to_date('22/05/24','RR/MM/DD'),'BANK','S','3','4');
Insert into BANK.TRANSAKCJE (TRNS_ID,TRNS_RODZAJ,TRNS_KWOTA,TRNS_TYP,DATA_ZAKS,DATA_REALIZ,UTWORZONO_PRZEZ,TRNS_SP_PLAT,TRNS_KONTO_ID,TRNS_KAT_ID) values ('2','W','30','B',to_date('22/05/24','RR/MM/DD'),to_date('22/05/24','RR/MM/DD'),'BANK','A','3','4');
REM INSERTING into BANK.TRANSAKCJE_2
SET DEFINE OFF;
REM INSERTING into BANK.TRANSAKCJE_3
SET DEFINE OFF;
Insert into BANK.TRANSAKCJE_3 (TRNS_ID,TRNS_RODZAJ,TRNS_KWOTA,TRNS_TYP,DATA_ZAKS,DATA_REALIZ,UTWORZONO_PRZEZ,TRNS_SP_PLAT,TRNS_KONTO_ID,TRNS_KAT_ID) values ('3','W','550','PE',to_date('22/05/24','RR/MM/DD'),to_date('22/05/24','RR/MM/DD'),'BANK','K','10','7');
Insert into BANK.TRANSAKCJE_3 (TRNS_ID,TRNS_RODZAJ,TRNS_KWOTA,TRNS_TYP,DATA_ZAKS,DATA_REALIZ,UTWORZONO_PRZEZ,TRNS_SP_PLAT,TRNS_KONTO_ID,TRNS_KAT_ID) values ('4','P','200','PZ',to_date('22/05/24','RR/MM/DD'),null,'BANK','K','4','1');
Insert into BANK.TRANSAKCJE_3 (TRNS_ID,TRNS_RODZAJ,TRNS_KWOTA,TRNS_TYP,DATA_ZAKS,DATA_REALIZ,UTWORZONO_PRZEZ,TRNS_SP_PLAT,TRNS_KONTO_ID,TRNS_KAT_ID) values ('5','W','15','B',to_date('22/05/24','RR/MM/DD'),to_date('22/05/24','RR/MM/DD'),'BANK','A','2','6');
REM INSERTING into BANK.TRANSAKCJE_LOGS
SET DEFINE OFF;
Insert into BANK.TRANSAKCJE_LOGS (TRNS_ID,TRNS_KWOTA,UTWORZONO_PRZEZ,TRNS_DATA_OPERACJI) values ('1','120','BANK',to_timestamp('22/05/24 01:36:00,000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into BANK.TRANSAKCJE_LOGS (TRNS_ID,TRNS_KWOTA,UTWORZONO_PRZEZ,TRNS_DATA_OPERACJI) values ('2','30','BANK',to_timestamp('22/05/24 00:18:42,000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into BANK.TRANSAKCJE_LOGS (TRNS_ID,TRNS_KWOTA,UTWORZONO_PRZEZ,TRNS_DATA_OPERACJI) values ('3','550','BANK',to_timestamp('22/05/24 01:56:04,000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into BANK.TRANSAKCJE_LOGS (TRNS_ID,TRNS_KWOTA,UTWORZONO_PRZEZ,TRNS_DATA_OPERACJI) values ('4','200','BANK',to_timestamp('22/05/24 01:56:55,000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into BANK.TRANSAKCJE_LOGS (TRNS_ID,TRNS_KWOTA,UTWORZONO_PRZEZ,TRNS_DATA_OPERACJI) values ('5','15','BANK',to_timestamp('22/05/24 01:59:53,000000000','RR/MM/DD HH24:MI:SSXFF'));
--------------------------------------------------------
--  DDL for Trigger BANK_TRG_ADR_HIST
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BANK"."BANK_TRG_ADR_HIST" 
BEFORE UPDATE 
ON bank.adresy
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW

DECLARE
    v_kraj_new adresy.kraj%TYPE := :NEW.kraj;
    v_miasto_new adresy.miasto%TYPE := :NEW.miasto;
    v_ulica_new adresy.ulica%TYPE := :NEW.ulica;
    v_nr_bud_new adresy.nr_bud%TYPE := :NEW.nr_bud;
    v_nr_miesz_new adresy.nr_miesz%TYPE := :NEW.nr_miesz;
    v_kod_pocztowy_new adresy.kod_pocztowy%TYPE := :NEW.kod_pocztowy;

BEGIN

    IF :OLD.kraj = :NEW.kraj THEN v_kraj_new := NULL; END IF;
    IF :OLD.miasto = :NEW.miasto THEN v_miasto_new := NULL; END IF;
    IF :OLD.ulica = :NEW.ulica THEN v_ulica_new := NULL; END IF;
    IF :OLD.nr_bud = :NEW.nr_bud THEN v_nr_bud_new := NULL; END IF;
    IF :OLD.nr_miesz = :NEW.nr_miesz THEN v_nr_miesz_new := NULL; END IF;
    IF :OLD.kod_pocztowy = :NEW.kod_pocztowy THEN v_kod_pocztowy_new := NULL; END IF;

    INSERT INTO bank.adresy_hist VALUES
    (       ADR_HIST_ID_SEQ.NEXTVAL
        ,   sysdate
        ,   :OLD.kraj
        ,   :OLD.miasto
        ,   :OLD.ulica
        ,   :OLD.nr_bud
        ,   :OLD.nr_miesz
        ,   :OLD.kod_pocztowy
        ,   v_kraj_new
        ,   v_miasto_new
        ,   v_ulica_new
        ,   v_nr_bud_new
        ,   v_nr_miesz_new
        ,   v_kod_pocztowy_new
    );
END;
/
ALTER TRIGGER "BANK"."BANK_TRG_ADR_HIST" ENABLE;
--------------------------------------------------------
--  DDL for Trigger KODY_UE_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BANK"."KODY_UE_TRG" 
BEFORE INSERT ON kody_ue
FOR EACH ROW
BEGIN
    :NEW.kraj_id := auto_id_seq .nextval;
END;
/
ALTER TRIGGER "BANK"."KODY_UE_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_ADRES_HIST
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BANK"."TRG_ADRES_HIST" 
before update or delete 
on adresy_hist
for each row
begin
if updating then
raise_application_error(-20003, 'Cannot modify any data in this table.');
elsif deleting then
raise_application_error(-20004, 'Cannot delete any data from this table.');
end if;
end;
/
ALTER TRIGGER "BANK"."TRG_ADRES_HIST" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_KL_HIST
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BANK"."TRG_KL_HIST" 
before update or delete 
on klienci_hist
for each row
begin
if updating then
raise_application_error(-20003, 'Cannot modify any data in this table.');
elsif deleting then
raise_application_error(-20004, 'Cannot delete any data from this table.');
end if;
end;
/
ALTER TRIGGER "BANK"."TRG_KL_HIST" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_KL_UPD_HIST
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BANK"."TRG_KL_UPD_HIST" 
BEFORE UPDATE OF email on klienci
FOR EACH ROW
BEGIN
INSERT INTO klienci_hist (klient_id, login, email_old, email_new) VALUES (:NEW.klient_id, :NEW.login, :OLD.email, :NEW.email);
END;
/
ALTER TRIGGER "BANK"."TRG_KL_UPD_HIST" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_KONTA_HIST
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BANK"."TRG_KONTA_HIST" 
before update or delete 
on konta_hist
for each row
begin
if updating then
raise_application_error(-20003, 'Cannot modify any data in this table.');
elsif deleting then
raise_application_error(-20004, 'Cannot delete any data from this table.');
end if;
end;
/
ALTER TRIGGER "BANK"."TRG_KONTA_HIST" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_LOGS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BANK"."TRG_LOGS" 
before update or delete
on logs_table
for each row
begin
if updating('log_id')then
raise_application_error(-20001, 'Only the LOG_ADD_INFO column can be modified.');
elsif updating('log_time')then
raise_application_error(-20001, 'Only the LOG_ADD_INFO column can be modified.');
elsif updating('log_source')then
raise_application_error(-20001, 'Only the LOG_ADD_INFO column can be modified.');
elsif updating('log_details')then
raise_application_error(-20001, 'Only the LOG_ADD_INFO column can be modified.');
elsif updating('log_user')then
raise_application_error(-20001, 'Only the LOG_ADD_INFO column can be modified.');
elsif deleting then
raise_application_error(-20002, 'Cannot delete logs from this table.');
end if;
end;
/
ALTER TRIGGER "BANK"."TRG_LOGS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_TRNS_HIST
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BANK"."TRG_TRNS_HIST" 
before update or delete 
on transakcje_logs
for each row
begin
if updating then
raise_application_error(-20003, 'Cannot modify any data in this table.');
elsif deleting then
raise_application_error(-20004, 'Cannot delete any data from this table.');
end if;
end;
/
ALTER TRIGGER "BANK"."TRG_TRNS_HIST" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRNS_ID_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BANK"."TRNS_ID_TRG" 
BEFORE INSERT on transakcje
FOR EACH ROW
BEGIN
  :NEW.trns_id := trns_id_seq.nextval;
END;
/
ALTER TRIGGER "BANK"."TRNS_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Package BANK_PCKG_KONTO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "BANK"."BANK_PCKG_KONTO" IS


PROCEDURE proc_zaloz_konto (  p_id IN NUMBER
                            , p_nr IN NUMBER
                            , p_oszcz_id IN NUMBER
                            ,p_f_akt IN VARCHAR2
                            , p_kr_id IN NUMBER
                            , p_wlasc_id IN NUMBER
                            , p_data_urodzenia IN DATE);

PROCEDURE proc_zamknij_konto (p_id IN NUMBER);

kontoNieaktywneExc EXCEPTION;

END bank_pckg_konto;

/
--------------------------------------------------------
--  DDL for Package BANK_PCKG_TRANSAKCJA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "BANK"."BANK_PCKG_TRANSAKCJA" IS

PROCEDURE proc_zmien_status(p_trns_id NUMBER);

PROCEDURE proc_zaktualizuj_transaction_logs (p_id_first number, p_id_last number);

PROCEDURE proc_pobierz_konto_glowne;

PROCEDURE proc_daj_top_transakcji(p_miesiac number, p_rok number, p_top integer);

FUNCTION f_sum_trns_wg_kat_msc_rok (p_kat_id number, p_msc varchar2, p_rok number) return number;

FUNCTION f_sum_trns_wg_sp_plat_msc_rok (p_sp_plat varchar2, p_msc varchar2, p_rok number) return number;
--aabc

END bank_pckg_transakcja;

/
--------------------------------------------------------
--  DDL for Package BANK_PCKG_UTILITIES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "BANK"."BANK_PCKG_UTILITIES" 
IS

-- funkcja wstawia separatory w celu dostosowania do powszechnego formatu nr konta
FUNCTION f_format_rachunek (p_konto_id IN NUMBER) RETURN VARCHAR2;

-- funkcja formatuje nr konta do miÍdzynarodowego standardu IBAN
FUNCTION f_format_rachunek (p_konto_id IN NUMBER, p_kraj_id IN NUMBER) RETURN VARCHAR2;

-- funkcja informuje o aktualnym wieku klienta na podstawie parametru data ur
FUNCTION f_sprawdz_wiek_kl (p_data_urodzenia IN DATE) RETURN NUMBER;

-- funkcja sprawdzajaca istnienie obiektu tbl w db
FUNCTION f_is_tbl_exist (p_name varchar2) return number;

-- funkcja wylicza procent liczby x z liczby y
FUNCTION f_daj_procent (p_x number, p_y number) return number;

-- procedura do kompilacji obiektÛw
PROCEDURE proc_compile_invalid_obj;

-- funkcja walidujπca numer pesel wed≥ug oficjalnego algorytmu, sprawdza poprawnoúÊ liczby kontrolnej, p≥ci osoby
FUNCTION f_validate_pesel(p_klient_id number) return varchar2 DETERMINISTIC;

-- funkcja do logowania w tabelu logs_table - parametr p_log_details
procedure log(p_log_details varchar2);

-- funkcja do logowania w tabelu logs_table - parametr p_log_details, p_log_source
PROCEDURE log(p_log_details varchar2, p_log_source varchar2);

-- funkcja do logowania w tabelu logs_table - parametr p_log_details, p_log_add_info, p_log_source
PROCEDURE log(p_log_details varchar2, p_log_add_info varchar2, p_log_source varchar2);

-- f_parser() - funkcja do parsowania tekstu
-- @p_input_string - any varchar2 string
-- @v_return_string - string after parsing - currently deletes Polish characters 
--                                            and returns text without capital letters,
--      
FUNCTION f_parser(p_input_string varchar2) return varchar2 DETERMINISTIC;

END bank_pckg_utilities;

/

  GRANT EXECUTE ON "BANK"."BANK_PCKG_UTILITIES" TO "HR";
--------------------------------------------------------
--  DDL for Package Body BANK_PCKG_KONTO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "BANK"."BANK_PCKG_KONTO" IS
/*******************************************************************************
Author: Pawel
Version: 4
Changes: dodanie funkcji logujacej
*******************************************************************************/

-- procedura do zakladania nowego konta, po uprzednim zweryfikowaniu pelnoletnosci klienta
PROCEDURE proc_zaloz_konto (p_id IN NUMBER, p_nr IN NUMBER, p_oszcz_id IN NUMBER,
p_f_akt IN VARCHAR2, p_kr_id IN NUMBER, p_wlasc_id IN NUMBER, p_data_urodzenia IN DATE)  IS
v_nowe_konto konta%ROWTYPE;
BEGIN

v_nowe_konto.konto_id := p_id;
v_nowe_konto.konto_nr := p_nr;
v_nowe_konto.konto_oszcz_id := p_oszcz_id;
v_nowe_konto.konto_f_czy_aktywne := p_f_akt;
v_nowe_konto.konto_kr_id := p_kr_id;
v_nowe_konto.konto_wlasc_id := p_wlasc_id;

IF bank_pckg_utilities.f_sprawdz_wiek_kl(p_data_urodzenia) >= 18 THEN
    INSERT INTO konta 
    values
    (
    v_nowe_konto.konto_id
    , v_nowe_konto.konto_nr
    , v_nowe_konto.konto_oszcz_id
    , v_nowe_konto.konto_f_czy_aktywne
    , v_nowe_konto.konto_kr_id
    , v_nowe_konto.konto_wlasc_id
    );
    COMMIT;
ELSE
    dbms_output.put_line('Tylko pe≥noletni uøytkownicy mogπ zak≥adaÊ konta.');
END IF;
EXCEPTION
when others then
dbms_output.put_line(sqlcode || '-->' || sqlerrm);
END proc_zaloz_konto;

-- procedura zmiany statusu konta na nieaktywne, modyfikuje takze informacje
-- o koncie oszczednosciowym oraz odklada je do tabeli konta_hist
PROCEDURE proc_zamknij_konto (p_id IN NUMBER) IS
kontoNieaktywneExc EXCEPTION;
v_czy_wyst_id NUMBER;
v_status VARCHAR2(1 CHAR);
BEGIN
    SELECT konto_id, konto_f_czy_aktywne into v_czy_wyst_id, v_status 
    FROM konta
    WHERE konto_id = p_id;
    IF v_status = 'N'
    THEN RAISE kontoNieaktywneExc;
    END IF;
    UPDATE konta SET konto_f_czy_aktywne = 'N' WHERE konto_id = p_id;
    UPDATE konta SET konto_f_czy_aktywne = 'N' WHERE konto_oszcz_id = p_id;
    INSERT INTO konta_hist SELECT * FROM konta WHERE konto_oszcz_id = p_id;
    UPDATE konta SET konto_kr_id = NULL WHERE konto_oszcz_id = p_id;
    UPDATE konta SET konto_wlasc_id = NULL WHERE konto_oszcz_id = p_id;
    COMMIT;
    EXCEPTION
    WHEN kontoNieaktywneExc THEN 
    dbms_output.put_line('To konto zosta≥o juø zdezaktywowane. Operacja nie jest dozwolona.');
END proc_zamknij_konto;

BEGIN
bank_pckg_utilities.log('zainicjalizowano pakiet', 'BANK_PCKG_KONTO');
END bank_pckg_konto;

/
--------------------------------------------------------
--  DDL for Package Body BANK_PCKG_TRANSAKCJA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "BANK"."BANK_PCKG_TRANSAKCJA" IS
/*******************************************************************************
Author: Pawel
Version: 8
Changes: poprawa typowania w funkcjach analitycznych ze wzglÍdu na zmianÍ 
         rp_msc%type z number na varchar2 w bank_vw_trans_raport
*******************************************************************************/

--funkcja sprawdzajaca aktualny status transakcji bankowej
FUNCTION f_sprawdz_status(p_trns_id NUMBER) RETURN BOOLEAN IS
    v_status BOOLEAN := FALSE;
    type rec_trns is record(id transakcje.trns_id%type, data_realiz transakcje.data_realiz%type);
    r_transaction rec_trns;
BEGIN
    SELECT trns_id, data_realiz into r_transaction from transakcje where trns_id = p_trns_id;
    IF r_transaction.data_realiz IS NULL THEN
        v_status := true;
    ELSE
        v_status := false;
    END IF;
    RETURN v_status;
END f_sprawdz_status;


--procedura zmieniajaca status transakcji z niezrealizowanej na zrealizowana
PROCEDURE proc_zmien_status(p_trns_id NUMBER) IS
BEGIN
    IF f_sprawdz_status(p_trns_id) THEN
        UPDATE transakcje
        SET data_realiz = sysdate
        WHERE trns_id = p_trns_id;
        COMMIT;
        dbms_output.put_line('Transakcja o nr ID ' || p_trns_id || ' zosta≥a zrealizowana.');
    ELSIF f_sprawdz_status(p_trns_id) = false THEN
    dbms_output.put_line('Transakcja nr ' || p_trns_id || ' jest juø zrealizowana.
    Zmiana statusu nie jest moøliwa.');
    END IF;
EXCEPTION
    when no_data_found then 
        dbms_output.put_line('Brak transakcji o nr ID ' || p_trns_id);
        bank_pckg_utilities.log(p_log_details => sqlcode || ' ' || sqlerrm, p_log_add_info => 'ERROR HANDLED', p_log_source => 'bank_pckg_transakcja.proc_zmien_status(p_trns_id NUMBER)');
    when others then
        null;
        bank_pckg_utilities.log(p_log_details => sqlcode || ' ' || sqlerrm, p_log_add_info => 'OTHER ERROR', p_log_source => 'bank_pckg_transakcja.proc_zmien_status(p_trns_id NUMBER)');
END proc_zmien_status;

--procedura zapisujaca logi transakcji dla wybranych TRNS_ID, pozwalajaca przechowywac tylko aktualne szczegoly transakcji
PROCEDURE proc_zaktualizuj_transaction_logs (p_id_first IN number, p_id_last IN number) IS
    type t_trns_rec is record   (trns_log_id transakcje.trns_id%type,
                                trns_log_kwota transakcje.trns_kwota%type,
                                trns_log_user transakcje.utworzono_przez%type,
                                trns_log_data timestamp);         
    type t_trans_tab is table of t_trns_rec index by pls_integer;
    v_trns t_trans_tab;
    idx pls_integer;
BEGIN
    for i in p_id_first..p_id_last LOOP
        select trns_id, trns_kwota, utworzono_przez, coalesce(data_realiz, data_zaks) into v_trns(i) 
        from transakcje 
        where trns_id = i;
    END LOOP;
    
    idx := v_trns.first;
    
    /** wymaga tabeli transakcje logs 
    CREATE TABLE transakcje_logs
    (
        TRNS_ID NUMBER, 
        TRNS_KWOTA NUMBER(38,0) NOT NULL, 
        UTWORZONO_PRZEZ VARCHAR2(25 CHAR), 
        TRNS_DATA_OPERACJI TIMESTAMP (6)
    );
    **/
    
    execute immediate 'truncate table bank.transakcje_logs';
        
    while idx is not null 
    LOOP
        insert into transakcje_logs values v_trns(idx);
        dbms_output.put_line('Wprowadzono transakcjÍ o ID: ' 
        || v_trns(idx).trns_log_id
        || ', ostatnio modyfikowana ' || v_trns(idx).trns_log_data);
        idx := v_trns.next(idx);
    END LOOP;
    COMMIT;
EXCEPTION
    when no_data_found then null;
END proc_zaktualizuj_transaction_logs;

-- procedura nadpisujaca konto oszczednosciowe odpowiadajacym mu kontem glownym
-- w przypadku odnotowania platnosci
PROCEDURE proc_pobierz_konto_glowne IS
v_konto_glowne_id konta.konto_id%type;
BEGIN
    for trns in (select t.trns_id, t.trns_kwota, k.konto_id, k.konto_oszcz_id 
                from transakcje t inner join konta k on t.trns_konto_id = k.konto_id)
    loop
            select trns.konto_oszcz_id into v_konto_glowne_id from dual;
            if trns.trns_kwota <> 0 and trns.konto_oszcz_id is not null then
                update transakcje set trns_konto_id = v_konto_glowne_id where trns_id = trns.trns_id;
                dbms_output.put_line('Transakcja ID: ' || trns.trns_id || ' Zmodyfikowano ' || sql%rowcount || ' rekordÛw');
            else 
                dbms_output.put_line('Transakcja ID: ' || trns.trns_id);
            end if;
    end loop;
    commit;
END proc_pobierz_konto_glowne;

--procedura generuje i przechowuje zestawienie transakcji o najwyøszej kwocie wed≥ug wprowadzonych przez uøytkownika parametrÛw msc, rok, ilosc pozycji
PROCEDURE proc_daj_top_transakcji(p_miesiac number, p_rok number, p_top integer) is
    cursor c_trns_by_month_year is select trns_id, trns_kwota, trns_data_operacji from transakcje_logs 
    where to_char(trns_data_operacji, 'mm') = p_miesiac and to_char(trns_data_operacji, 'yyyy') = p_rok;
    v_ilosc_trns number;
    v_pozycja number := 0;
    v_tbl varchar2(4000 CHAR);
    v_miesiac varchar2(15 CHAR);
    exc_existing_tbl exception;
    exc_no_transactions exception;
begin
    begin
        select count(*) into v_ilosc_trns from (select trns_id, trns_kwota, trns_data_operacji from transakcje_logs 
        where to_char(trns_data_operacji, 'mm') = p_miesiac and to_char(trns_data_operacji, 'yyyy') = p_rok);
        
        if v_ilosc_trns = 0 then raise exc_no_transactions; end if;
    
        if p_miesiac = 01 then v_miesiac := 'STY';
        elsif p_miesiac = 02 then v_miesiac := 'LUT';
        elsif p_miesiac = 03 then v_miesiac := 'MAR';
        elsif p_miesiac = 04 then v_miesiac := 'KWI';
        elsif p_miesiac = 05 then v_miesiac := 'MAJ';
        elsif p_miesiac = 06 then v_miesiac := 'CZE';
        elsif p_miesiac = 07 then v_miesiac := 'LIP';
        elsif p_miesiac = 08 then v_miesiac := 'SIE';
        elsif p_miesiac = 09 then v_miesiac := 'WRZ';
        elsif p_miesiac = 10 then v_miesiac := 'PAZ';
        elsif p_miesiac = 11 then v_miesiac := 'LIS';
        elsif p_miesiac = 12 then v_miesiac := 'GRU';
        end if;
        
        v_tbl := 'top_' || p_top || '_trns_' ||
        v_miesiac || '_' || p_rok || '_' || to_char(sysdate,'DD_MM_YYYY');
        
        if bank_pckg_utilities.f_is_tbl_exist(v_tbl) <> 0 then raise exc_existing_tbl; end if;
        
        execute immediate 'create table ' || v_tbl ||
        '(trns_id number primary key
        , trns_kwota number not null
        , trns_data_operacji timestamp(6) not null
        , kto_utworzyl varchar2(30 CHAR) default user not null)';
        
        for i in c_trns_by_month_year loop
            exit when c_trns_by_month_year%rowcount > p_top;
            v_pozycja := v_pozycja + 1;
            execute immediate 'insert into ' || v_tbl || '(trns_id, trns_kwota, trns_data_operacji)' ||
            ' values (' || i.trns_id || ', ' || i.trns_kwota || ', ''' || i.trns_data_operacji || '''' || ')';
            dbms_output.put_line(v_pozycja || '. ' || i.trns_kwota || ', ' || i.trns_data_operacji);
        end loop;
        
        commit;
    
    exception
    when exc_existing_tbl then 
        dbms_output.put_line('W tym dniu wygenerowano juø raport transakcji za ten okres i w podanej konfiguracji.');
    end;
exception 
when exc_no_transactions then 
    dbms_output.put_line('Nie znaleziono transakcji.');
when others then
        dbms_output.put_line(sqlcode || ' ==> ' || sqlerrm);
end proc_daj_top_transakcji;

--funkcja wyliczajaca sume transakcji w danej kategorii na dany miesiac i rok
FUNCTION f_sum_trns_wg_kat_msc_rok (p_kat_id number, p_msc varchar2, p_rok number) return number is
v_kwota_sumaryczna number;
begin
        select sum(abs(trns.trns_kwota)) into v_kwota_sumaryczna
        from transakcje trns left outer join kategorie kat on trns.trns_kat_id = kat.kat_id
        where p_kat_id = kat.kat_id 
        and p_msc = to_char(coalesce(trns.data_realiz, trns.data_zaks), 'mon')
        and p_rok = to_number(to_char(coalesce(trns.data_realiz, trns.data_zaks), 'yyyy'));
    return v_kwota_sumaryczna;
end f_sum_trns_wg_kat_msc_rok;

--funkcja wyliczajaca sume transakcji o danym sposobie platnosci na dany miesiac i rok
FUNCTION f_sum_trns_wg_sp_plat_msc_rok (p_sp_plat varchar2, p_msc varchar2, p_rok number) return number is
v_kwota_sumaryczna number;
begin
        select sum(abs(trns.trns_kwota)) into v_kwota_sumaryczna
        from transakcje trns
        where trns.trns_sp_plat = p_sp_plat
        and p_msc = to_char(coalesce(trns.data_realiz, trns.data_zaks), 'mon')
        and p_rok = to_number(to_char(coalesce(trns.data_realiz, trns.data_zaks), 'yyyy'));
    return v_kwota_sumaryczna;
end f_sum_trns_wg_sp_plat_msc_rok;

BEGIN
bank_pckg_utilities.log('zainicjalizowano pakiet', 'BANK_PCKG_TRANSAKCJA');
END bank_pckg_transakcja;

/
--------------------------------------------------------
--  DDL for Package Body BANK_PCKG_UTILITIES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "BANK"."BANK_PCKG_UTILITIES" 
IS
/*******************************************************************************
Author: Pawel
Version: 10
Changes: dodano f_parser
*******************************************************************************/

-- funkcja wstawia separatory w celu dostosowania do powszechnego formatu nr konta
FUNCTION f_format_rachunek (p_konto_id IN NUMBER) RETURN VARCHAR2 IS
v_rachunek VARCHAR2(40);
BEGIN

    SELECT
        substr(knt.konto_nr, 1,2)||
        ' ' || substr(knt.konto_nr, 3,4) ||
        ' ' || substr(knt.konto_nr, 7,4) ||
        ' ' || substr(knt.konto_nr, 11,4) ||
        ' ' || substr(knt.konto_nr, 15,4) ||
        ' ' || substr(knt.konto_nr, 19,4) ||
        ' ' || substr(knt.konto_nr, 23,4) into v_rachunek
        FROM konta knt
        WHERE knt.konto_id = p_konto_id;
    RETURN v_rachunek;
    EXCEPTION
        when no_data_found then null;
END f_format_rachunek;

-- funkcja formatuje nr konta do miÍdzynarodowego standardu IBAN
FUNCTION f_format_rachunek (p_konto_id IN NUMBER, p_kraj_id IN NUMBER) RETURN VARCHAR2 IS
v_rachunek VARCHAR2(40);
BEGIN

    SELECT
        kd.kraj_kod || ' ' ||
        ' ' || substr(knt.konto_nr, 1,2)||
        ' ' || substr(knt.konto_nr, 3,4) ||
        ' ' || substr(knt.konto_nr, 7,4) ||
        ' ' || substr(knt.konto_nr, 11,4) ||
        ' ' || substr(knt.konto_nr, 15,4) ||
        ' ' || substr(knt.konto_nr, 19,4) ||
        ' ' || substr(knt.konto_nr, 23,4) into v_rachunek
        FROM konta knt join kody_ue kd
        on knt.konto_kr_id = kd.kraj_id
        WHERE knt.konto_id = p_konto_id
        and knt.konto_kr_id = p_kraj_id;
    RETURN v_rachunek;
    EXCEPTION
        when no_data_found then null;
END f_format_rachunek;

-- funkcja informuje o aktualnym wieku klienta na podstawie parametru data ur
FUNCTION f_sprawdz_wiek_kl (p_data_urodzenia DATE) RETURN NUMBER IS
v_data_urodzenia DATE;
v_wiek NUMBER(3,0);
BEGIN

    v_data_urodzenia := to_date(p_data_urodzenia,'dd-mm-yyyy');
    SELECT TRUNC((sysdate - v_data_urodzenia)/365,0) into v_wiek from dual;
    RETURN v_wiek;

END f_sprawdz_wiek_kl;

--funkcja sprawdzajaca istnienie obiektu tbl w db
FUNCTION f_is_tbl_exist (p_name varchar2) return number is
v_return number(1,0);
BEGIN
    select count(*) into v_return from all_tables where table_name = UPPER(p_name);
    return v_return;
END f_is_tbl_exist;

--funkcja wylicza procent liczby x z liczby y
FUNCTION f_daj_procent (p_x number, p_y number) return number is
v_return number;
begin
    begin
        
        select round((p_x / p_y)*100,2) into v_return from dual;

        exception 
        when zero_divide then
        v_return := null;
    end;
    return v_return;
end f_daj_procent;

--procedura do kompilacji obiektÛw db
PROCEDURE proc_compile_invalid_obj is
v_new_status user_objects.status%type;
v_count number;
begin
    select count(object_id) into v_count from user_objects where status = 'INVALID';
    dbms_output.put_line('Number of invalid objects in ' || user || ' schema is: ' || v_count);

    for obj in (select * from user_objects where status = 'INVALID')
    loop
    dbms_output.put_line('object: ' || obj.object_name || ' status before compilation: ' || obj.status);
        begin
            if obj.object_type = 'PACKAGE BODY' then
                execute immediate 'alter package ' || obj.object_name || ' compile body';
--                dbms_output.put_line('execute immediate ' || '''alter package ' || obj.object_name || ' compile body;''' || 'STATUS: ' || obj.status);
            elsif obj.object_type = 'PACKAGE' then
                execute immediate 'alter package ' || obj.object_name || ' compile package';
--                dbms_output.put_line('execute immediate ' || '''alter package ' || obj.object_name || ' compile paackage;''');
            else
                execute immediate 'alter ' || obj.object_type || ' ' || obj.object_name || ' compile';
            end if;
        exception
        when others then
            null;
        end;
        
        select status into v_new_status from all_objects where object_id = obj.object_id;
        dbms_output.put_line('===> ' || 'object: ' || obj.object_name || ' status after compilation: ' || v_new_status);
        dbms_output.put_line('--------------------------------------------------------------------------------');
        
        if v_new_status <> 'VALID' then
            dbms_output.put_line('Failure while compiling ' || obj.object_type || ' ' || obj.object_name);
            dbms_output.put_line('--------------------------------------------------------------------------------');
        end if;
    end loop;
    
    select count(object_id) into v_count from user_objects where status = 'INVALID';
    if v_count <> 0 then
        dbms_output.put_line('Number of invalid objects in ' || user || ' schema is: ' || v_count);
        for i in (select * from user_objects where status = 'INVALID') 
        loop
            dbms_output.put_line(i.object_name);
        end loop;
    end if;    
end proc_compile_invalid_obj;

-- funkcja walidujπca numer pesel wed≥ug oficjalnego algorytmu, sprawdza poprawnoúÊ liczby kontrolnej, p≥ci osoby
FUNCTION f_validate_pesel(p_klient_id number) return varchar2 DETERMINISTIC is
v_pesel klienci.pesel%type;
v_plec klienci.plec%type;
v_liczba_kontrolna number;
v_return varchar2(1 CHAR);
type t_elements is record   (char_1 varchar2(1 CHAR), char_2 varchar2(1 CHAR), char_3 varchar2(1 CHAR),
                            char_4 varchar2(1 CHAR), char_5 varchar2(1 CHAR), char_6 varchar2(1 CHAR), 
                            char_7 varchar2(1 CHAR), char_8 varchar2(1 CHAR), char_9 varchar2(1 CHAR), char_10 varchar2(1 CHAR));
type t_weights is varray(10) of number;
weights constant t_weights := t_weights(1, 3, 7, 9, 1, 3, 7, 9, 1, 3);
pesel_digits t_elements;
multiply_by_weight t_weights;
check_digit number;
sum_mbw number;
invalid_pesel exception;
begin
    select kl.pesel into v_pesel from klienci kl where kl.klient_id = p_klient_id;
    select kl.plec into v_plec from klienci kl where kl.klient_id = p_klient_id;
    select  substr(v_pesel, 1, 1), substr(v_pesel, 2, 1), substr(v_pesel, 3, 1), substr(v_pesel, 4, 1), substr(v_pesel, 5, 1), substr(v_pesel, 6, 1), 
            substr(v_pesel, 7, 1), substr(v_pesel, 8, 1), substr(v_pesel, 9, 1), substr(v_pesel, 10, 1) 
            into pesel_digits from dual;
    multiply_by_weight := t_weights(null, null, null, null, null, null, null, null, null, null);
    
    multiply_by_weight(1) := pesel_digits.char_1 * weights(1);
    multiply_by_weight(2) := pesel_digits.char_2 * weights(2);
    multiply_by_weight(3) := pesel_digits.char_3 * weights(3);
    multiply_by_weight(4) := pesel_digits.char_4 * weights(4);
    multiply_by_weight(5) := pesel_digits.char_5 * weights(5);
    multiply_by_weight(6):= pesel_digits.char_6 * weights(6);
    multiply_by_weight(7) := pesel_digits.char_7 * weights(7);
    multiply_by_weight(8) := pesel_digits.char_8 * weights(8);
    multiply_by_weight(9) := pesel_digits.char_9 * weights(9);
    multiply_by_weight(10) := pesel_digits.char_10 * weights(10);
    
    for i in multiply_by_weight.first..multiply_by_weight.last
    loop
        if length(multiply_by_weight(i)) = 2 then
            multiply_by_weight(i) := substr(multiply_by_weight(i), 2, 1);
        else 
            multiply_by_weight(i) := multiply_by_weight(i);
        end if;
    end loop;
    
    select   multiply_by_weight(1) + multiply_by_weight(2) + multiply_by_weight(3) + multiply_by_weight(4) + multiply_by_weight(5) +
             multiply_by_weight(6) + multiply_by_weight(7) + multiply_by_weight(8) + multiply_by_weight(9) + multiply_by_weight(10) 
             into sum_mbw from dual;
                 
    if length(sum_mbw) = 2 then sum_mbw := substr(sum_mbw, 2, 1); end if;
    select 10 - sum_mbw into check_digit from dual;
    
    if substr(v_pesel, 11, 1) = check_digit then
        if  substr(v_pesel, 10, 1) in (0,2,4,6,8) and v_plec in ('K','N') or
            substr(v_pesel, 10, 1) in (1,3,5,7,9) and v_plec in ('M','N') then
            v_return := 'T'; 
        else
            v_return := 'N';
        end if;
    elsif v_pesel is null then
        v_return := 'T';
    else
        v_return := 'N';
        raise invalid_pesel;
    end if;

return v_return;

exception
when invalid_pesel then return 'N';

end f_validate_pesel;

-- procedura do logowania eventow w tabeli logs_table, przeciazona w 3 wersjach
procedure log(p_log_details varchar2) is PRAGMA AUTONOMOUS_TRANSACTION;
begin
insert into bank.logs_table values(log_id_seq.nextval, sysdate, null, p_log_details, null, user);
commit;
end log;

procedure log(p_log_details varchar2, p_log_source varchar2) is PRAGMA AUTONOMOUS_TRANSACTION;
begin
insert into bank.logs_table values(log_id_seq.nextval, sysdate, p_log_source, p_log_details, null, user);
commit;
end log;

procedure log(p_log_details varchar2, p_log_add_info varchar2, p_log_source varchar2) is PRAGMA AUTONOMOUS_TRANSACTION;
begin
insert into bank.logs_table values(bank.log_id_seq.nextval, sysdate, p_log_source, p_log_details, p_log_add_info, user);
commit;
end log;

-- f_parser() - funkcja do parsowania tekstu
-- @p_input_string - any varchar2 string
-- @v_return_string - string after parsing - currently deletes Polish characters 
--                                            and returns text without capital letters,
--                                            will be develop in future
function f_parser(p_input_string varchar2) return varchar2 DETERMINISTIC is 
v_return_string varchar2(4000);
begin
    select translate(lower(p_input_string),'πÊÍ≥ÒÛúüø','aceloszz') 
    into v_return_string from dual;
return v_return_string;
end;

BEGIN
log('zainicjalizowano pakiet', 'BANK_PCKG_UTILITIES');
END bank_pckg_utilities;

/

  GRANT EXECUTE ON "BANK"."BANK_PCKG_UTILITIES" TO "HR";
--------------------------------------------------------
--  Constraints for Table TRANSAKCJE_2
--------------------------------------------------------

  ALTER TABLE "BANK"."TRANSAKCJE_2" MODIFY ("TRNS_RODZAJ" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TRANSAKCJE_2" MODIFY ("TRNS_KWOTA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table KONTA_HIST
--------------------------------------------------------

  ALTER TABLE "BANK"."KONTA_HIST" MODIFY ("KONTO_NR" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TOP_5_TRNS_MAJ_2022_05_09_2022
--------------------------------------------------------

  ALTER TABLE "BANK"."TOP_5_TRNS_MAJ_2022_05_09_2022" MODIFY ("TRNS_KWOTA" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_5_TRNS_MAJ_2022_05_09_2022" MODIFY ("TRNS_DATA_OPERACJI" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_5_TRNS_MAJ_2022_05_09_2022" MODIFY ("KTO_UTWORZYL" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_5_TRNS_MAJ_2022_05_09_2022" ADD PRIMARY KEY ("TRNS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TRANSAKCJE_LOGS
--------------------------------------------------------

  ALTER TABLE "BANK"."TRANSAKCJE_LOGS" MODIFY ("TRNS_KWOTA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ADRESY_HIST
--------------------------------------------------------

  ALTER TABLE "BANK"."ADRESY_HIST" MODIFY ("DATA_OPERACJI" NOT NULL ENABLE);
  ALTER TABLE "BANK"."ADRESY_HIST" MODIFY ("KRAJ" NOT NULL ENABLE);
  ALTER TABLE "BANK"."ADRESY_HIST" MODIFY ("MIASTO" NOT NULL ENABLE);
  ALTER TABLE "BANK"."ADRESY_HIST" MODIFY ("NR_BUD" NOT NULL ENABLE);
  ALTER TABLE "BANK"."ADRESY_HIST" MODIFY ("KOD_POCZTOWY" NOT NULL ENABLE);
  ALTER TABLE "BANK"."ADRESY_HIST" ADD PRIMARY KEY ("ADR_HIST_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TOP_6_TRNS_MAJ_2022_05_09_2022
--------------------------------------------------------

  ALTER TABLE "BANK"."TOP_6_TRNS_MAJ_2022_05_09_2022" MODIFY ("TRNS_KWOTA" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_6_TRNS_MAJ_2022_05_09_2022" MODIFY ("TRNS_DATA_OPERACJI" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_6_TRNS_MAJ_2022_05_09_2022" MODIFY ("KTO_UTWORZYL" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_6_TRNS_MAJ_2022_05_09_2022" ADD PRIMARY KEY ("TRNS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TOP_4_TRNS_SIE_2022_06_09_2022
--------------------------------------------------------

  ALTER TABLE "BANK"."TOP_4_TRNS_SIE_2022_06_09_2022" MODIFY ("TRNS_KWOTA" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_4_TRNS_SIE_2022_06_09_2022" MODIFY ("TRNS_DATA_OPERACJI" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_4_TRNS_SIE_2022_06_09_2022" MODIFY ("KTO_UTWORZYL" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_4_TRNS_SIE_2022_06_09_2022" ADD PRIMARY KEY ("TRNS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TOP_5_TRNS_MAJ_2022_04_10_2022
--------------------------------------------------------

  ALTER TABLE "BANK"."TOP_5_TRNS_MAJ_2022_04_10_2022" MODIFY ("TRNS_KWOTA" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_5_TRNS_MAJ_2022_04_10_2022" MODIFY ("TRNS_DATA_OPERACJI" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_5_TRNS_MAJ_2022_04_10_2022" MODIFY ("KTO_UTWORZYL" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_5_TRNS_MAJ_2022_04_10_2022" ADD PRIMARY KEY ("TRNS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TOP_8_TRNS_MAJ_2022_04_10_2022
--------------------------------------------------------

  ALTER TABLE "BANK"."TOP_8_TRNS_MAJ_2022_04_10_2022" MODIFY ("TRNS_KWOTA" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_8_TRNS_MAJ_2022_04_10_2022" MODIFY ("TRNS_DATA_OPERACJI" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_8_TRNS_MAJ_2022_04_10_2022" MODIFY ("KTO_UTWORZYL" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_8_TRNS_MAJ_2022_04_10_2022" ADD PRIMARY KEY ("TRNS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table KLIENCI2
--------------------------------------------------------

  ALTER TABLE "BANK"."KLIENCI2" MODIFY ("IMIE" NOT NULL ENABLE);
  ALTER TABLE "BANK"."KLIENCI2" MODIFY ("NAZWISKO" NOT NULL ENABLE);
  ALTER TABLE "BANK"."KLIENCI2" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "BANK"."KLIENCI2" ADD PRIMARY KEY ("KLIENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BANK"."KLIENCI2" ADD UNIQUE ("EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BANK"."KLIENCI2" ADD UNIQUE ("PESEL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TOP_2_TRNS_STY_2022_07_09_2022
--------------------------------------------------------

  ALTER TABLE "BANK"."TOP_2_TRNS_STY_2022_07_09_2022" MODIFY ("TRNS_KWOTA" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_2_TRNS_STY_2022_07_09_2022" MODIFY ("TRNS_DATA_OPERACJI" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_2_TRNS_STY_2022_07_09_2022" MODIFY ("KTO_UTWORZYL" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_2_TRNS_STY_2022_07_09_2022" ADD PRIMARY KEY ("TRNS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TOP_3_TRNS_MAJ_2022_06_09_2022
--------------------------------------------------------

  ALTER TABLE "BANK"."TOP_3_TRNS_MAJ_2022_06_09_2022" MODIFY ("TRNS_KWOTA" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_3_TRNS_MAJ_2022_06_09_2022" MODIFY ("TRNS_DATA_OPERACJI" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_3_TRNS_MAJ_2022_06_09_2022" MODIFY ("KTO_UTWORZYL" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_3_TRNS_MAJ_2022_06_09_2022" ADD PRIMARY KEY ("TRNS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TOP_9_TRNS_MAJ_2022_04_10_2022
--------------------------------------------------------

  ALTER TABLE "BANK"."TOP_9_TRNS_MAJ_2022_04_10_2022" MODIFY ("TRNS_KWOTA" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_9_TRNS_MAJ_2022_04_10_2022" MODIFY ("TRNS_DATA_OPERACJI" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_9_TRNS_MAJ_2022_04_10_2022" MODIFY ("KTO_UTWORZYL" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_9_TRNS_MAJ_2022_04_10_2022" ADD PRIMARY KEY ("TRNS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TRANSAKCJE
--------------------------------------------------------

  ALTER TABLE "BANK"."TRANSAKCJE" MODIFY ("TRNS_RODZAJ" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TRANSAKCJE" MODIFY ("TRNS_KWOTA" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TRANSAKCJE" ADD PRIMARY KEY ("TRNS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BANK"."TRANSAKCJE" ADD CONSTRAINT "TRNS_RODZ_CHK" CHECK (trns_rodzaj in ('P','W')) ENABLE;
  ALTER TABLE "BANK"."TRANSAKCJE" ADD CONSTRAINT "TRNS_TYP_CHK" CHECK (trns_typ in ('PK', 'PZ', 'PE', 'PW', 'B')) ENABLE;
  ALTER TABLE "BANK"."TRANSAKCJE" ADD CONSTRAINT "TRNS_PL_CHK" CHECK (trns_sp_plat in ('A', 'S', 'K')) ENABLE;
--------------------------------------------------------
--  Constraints for Table KLIENCI_HIST
--------------------------------------------------------

  ALTER TABLE "BANK"."KLIENCI_HIST" MODIFY ("EMAIL_OLD" NOT NULL ENABLE);
  ALTER TABLE "BANK"."KLIENCI_HIST" MODIFY ("EMAIL_NEW" NOT NULL ENABLE);
  ALTER TABLE "BANK"."KLIENCI_HIST" ADD PRIMARY KEY ("KLIENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BANK"."KLIENCI_HIST" ADD UNIQUE ("EMAIL_OLD")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BANK"."KLIENCI_HIST" ADD UNIQUE ("EMAIL_NEW")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TOP_2_TRNS_MAJ_2022_05_09_2022
--------------------------------------------------------

  ALTER TABLE "BANK"."TOP_2_TRNS_MAJ_2022_05_09_2022" MODIFY ("TRNS_KWOTA" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_2_TRNS_MAJ_2022_05_09_2022" MODIFY ("TRNS_DATA_OPERACJI" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_2_TRNS_MAJ_2022_05_09_2022" MODIFY ("KTO_UTWORZYL" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_2_TRNS_MAJ_2022_05_09_2022" ADD PRIMARY KEY ("TRNS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ADRESY
--------------------------------------------------------

  ALTER TABLE "BANK"."ADRESY" MODIFY ("KOD_POCZTOWY" NOT NULL ENABLE);
  ALTER TABLE "BANK"."ADRESY" MODIFY ("KRAJ" NOT NULL ENABLE);
  ALTER TABLE "BANK"."ADRESY" MODIFY ("MIASTO" NOT NULL ENABLE);
  ALTER TABLE "BANK"."ADRESY" MODIFY ("NR_BUD" NOT NULL ENABLE);
  ALTER TABLE "BANK"."ADRESY" ADD PRIMARY KEY ("ADRES_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table KONTA
--------------------------------------------------------

  ALTER TABLE "BANK"."KONTA" MODIFY ("KONTO_NR" NOT NULL ENABLE);
  ALTER TABLE "BANK"."KONTA" ADD PRIMARY KEY ("KONTO_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BANK"."KONTA" ADD UNIQUE ("KONTO_NR")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BANK"."KONTA" ADD UNIQUE ("KONTO_OSZCZ_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BANK"."KONTA" ADD CONSTRAINT "KNT_ACC_ATV_CHK" CHECK (konto_f_czy_aktywne in ('T', 'N')) ENABLE;
  ALTER TABLE "BANK"."KONTA" ADD CONSTRAINT "KNT_NR_CHK" CHECK (length(konto_nr) = 26) ENABLE;
--------------------------------------------------------
--  Constraints for Table KATEGORIE
--------------------------------------------------------

  ALTER TABLE "BANK"."KATEGORIE" MODIFY ("NAZWA" NOT NULL ENABLE);
  ALTER TABLE "BANK"."KATEGORIE" ADD PRIMARY KEY ("KAT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BANK"."KATEGORIE" ADD UNIQUE ("NAZWA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table KLIENCI
--------------------------------------------------------

  ALTER TABLE "BANK"."KLIENCI" MODIFY ("IMIE" NOT NULL ENABLE);
  ALTER TABLE "BANK"."KLIENCI" MODIFY ("NAZWISKO" NOT NULL ENABLE);
  ALTER TABLE "BANK"."KLIENCI" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "BANK"."KLIENCI" ADD PRIMARY KEY ("KLIENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BANK"."KLIENCI" ADD UNIQUE ("EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BANK"."KLIENCI" ADD UNIQUE ("PESEL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BANK"."KLIENCI" ADD CONSTRAINT "KL_GND_CHK" CHECK (plec in ('M', 'K', 'N')) ENABLE;
  ALTER TABLE "BANK"."KLIENCI" ADD CONSTRAINT "KL_ATV_CHK" CHECK (f_czy_aktywny in ('T', 'N')) ENABLE;
  ALTER TABLE "BANK"."KLIENCI" MODIFY ("KL_ADRES_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table KODY_UE
--------------------------------------------------------

  ALTER TABLE "BANK"."KODY_UE" ADD CONSTRAINT "KD_KOD_CHK" CHECK (length(kraj_kod) = 2) ENABLE;
  ALTER TABLE "BANK"."KODY_UE" MODIFY ("KRAJ_NAZWA" NOT NULL ENABLE);
  ALTER TABLE "BANK"."KODY_UE" MODIFY ("KRAJ_KOD" NOT NULL ENABLE);
  ALTER TABLE "BANK"."KODY_UE" ADD PRIMARY KEY ("KRAJ_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BANK"."KODY_UE" ADD UNIQUE ("KRAJ_NAZWA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BANK"."KODY_UE" ADD UNIQUE ("KRAJ_KOD")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGS_TABLE
--------------------------------------------------------

  ALTER TABLE "BANK"."LOGS_TABLE" MODIFY ("LOG_ID" NOT NULL ENABLE);
  ALTER TABLE "BANK"."LOGS_TABLE" MODIFY ("LOG_TIME" NOT NULL ENABLE);
  ALTER TABLE "BANK"."LOGS_TABLE" MODIFY ("LOG_DETAILS" NOT NULL ENABLE);
  ALTER TABLE "BANK"."LOGS_TABLE" MODIFY ("LOG_USER" NOT NULL ENABLE);
  ALTER TABLE "BANK"."LOGS_TABLE" ADD UNIQUE ("LOG_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TOP_4_TRNS_MAJ_2022_06_09_2022
--------------------------------------------------------

  ALTER TABLE "BANK"."TOP_4_TRNS_MAJ_2022_06_09_2022" MODIFY ("TRNS_KWOTA" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_4_TRNS_MAJ_2022_06_09_2022" MODIFY ("TRNS_DATA_OPERACJI" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_4_TRNS_MAJ_2022_06_09_2022" MODIFY ("KTO_UTWORZYL" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TOP_4_TRNS_MAJ_2022_06_09_2022" ADD PRIMARY KEY ("TRNS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TRANSAKCJE_3
--------------------------------------------------------

  ALTER TABLE "BANK"."TRANSAKCJE_3" MODIFY ("TRNS_RODZAJ" NOT NULL ENABLE);
  ALTER TABLE "BANK"."TRANSAKCJE_3" MODIFY ("TRNS_KWOTA" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table KLIENCI
--------------------------------------------------------

  ALTER TABLE "BANK"."KLIENCI" ADD CONSTRAINT "KL_FK" FOREIGN KEY ("KL_ADRES_ID")
	  REFERENCES "BANK"."ADRESY" ("ADRES_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table KONTA
--------------------------------------------------------

  ALTER TABLE "BANK"."KONTA" ADD FOREIGN KEY ("KONTO_KR_ID")
	  REFERENCES "BANK"."KODY_UE" ("KRAJ_ID") ENABLE;
  ALTER TABLE "BANK"."KONTA" ADD FOREIGN KEY ("KONTO_WLASC_ID")
	  REFERENCES "BANK"."KLIENCI" ("KLIENT_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TRANSAKCJE
--------------------------------------------------------

  ALTER TABLE "BANK"."TRANSAKCJE" ADD FOREIGN KEY ("TRNS_KONTO_ID")
	  REFERENCES "BANK"."KONTA" ("KONTO_ID") ENABLE;
  ALTER TABLE "BANK"."TRANSAKCJE" ADD FOREIGN KEY ("TRNS_KAT_ID")
	  REFERENCES "BANK"."KATEGORIE" ("KAT_ID") ENABLE;
