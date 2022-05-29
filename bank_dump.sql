--------------------------------------------------------
--  File created - niedziela-maja-29-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence AUTO_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BANK"."AUTO_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
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

   COMMENT ON COLUMN "BANK"."ADRESY"."ADRES_ID" IS 'Klucz g³ówny identyfikuj¹cy adres.';
   COMMENT ON COLUMN "BANK"."ADRESY"."KRAJ" IS 'Kraj.';
   COMMENT ON COLUMN "BANK"."ADRESY"."MIASTO" IS 'Miejscowoœæ.';
   COMMENT ON COLUMN "BANK"."ADRESY"."ULICA" IS 'Ulica.';
   COMMENT ON COLUMN "BANK"."ADRESY"."NR_BUD" IS 'Numer budynku.';
   COMMENT ON COLUMN "BANK"."ADRESY"."NR_MIESZ" IS 'Numer mieszkania lub apartamentu.';
   COMMENT ON COLUMN "BANK"."ADRESY"."KOD_POCZTOWY" IS 'Kod pocztowy.';
   COMMENT ON TABLE "BANK"."ADRESY"  IS 'Tabela zawieraj¹ca adresy klientów podane przy rejestracji konta.';
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

   COMMENT ON COLUMN "BANK"."KATEGORIE"."KAT_ID" IS 'Klucz g³ówny identyfikuj¹cy kategorie.';
   COMMENT ON COLUMN "BANK"."KATEGORIE"."NAZWA" IS 'Nazwa kategorii.';
   COMMENT ON COLUMN "BANK"."KATEGORIE"."OPIS" IS 'Opis szczegó³owy kategorii.';
   COMMENT ON TABLE "BANK"."KATEGORIE"  IS 'Tabela przechowuj¹ca informacje o kategoriach transakcji.';
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
	"F_CZY_AKTYWNY" VARCHAR2(1 CHAR) DEFAULT 'T', 
	"KL_ADRES_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "BANK"."KLIENCI"."KLIENT_ID" IS 'Klucz g³ówny identyfikuj¹cy klienta.';
   COMMENT ON COLUMN "BANK"."KLIENCI"."IMIE" IS 'Imiê klienta.';
   COMMENT ON COLUMN "BANK"."KLIENCI"."NAZWISKO" IS 'Nazwisko klienta.';
   COMMENT ON COLUMN "BANK"."KLIENCI"."PLEC" IS 'Zadeklarowana p³eæ klienta M - mê¿czyzna, K - kobieta, N - nie chce podawaæ.';
   COMMENT ON COLUMN "BANK"."KLIENCI"."LOGIN" IS 'Login do aplikacji mobilnej danego u¿ytkownika (klienta).';
   COMMENT ON COLUMN "BANK"."KLIENCI"."EMAIL" IS 'Adres e-mail klienta.';
   COMMENT ON COLUMN "BANK"."KLIENCI"."PESEL" IS 'Numer PESEL klienta.';
   COMMENT ON COLUMN "BANK"."KLIENCI"."F_CZY_AKTYWNY" IS 'Flaga czy klient aktywny.';
   COMMENT ON COLUMN "BANK"."KLIENCI"."KL_ADRES_ID" IS 'Referencja do tabeli adresy.';
   COMMENT ON TABLE "BANK"."KLIENCI"  IS 'Tabela przechowuj¹ca informacje o klientach.';
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
   COMMENT ON COLUMN "BANK"."KODY_UE"."KRAJ_NAZWA" IS 'Pañstwo.';
   COMMENT ON COLUMN "BANK"."KODY_UE"."KRAJ_KOD" IS 'Kod kraju.';
   COMMENT ON TABLE "BANK"."KODY_UE"  IS 'Kody krajów Unii Europejskiej stosowane w numerze rachunku w formacie IBAN.';
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

   COMMENT ON COLUMN "BANK"."KONTA"."KONTO_ID" IS 'Klucz g³ówny identyfikuj¹cy konto.';
   COMMENT ON COLUMN "BANK"."KONTA"."KONTO_NR" IS 'Numer konta bankowego.';
   COMMENT ON COLUMN "BANK"."KONTA"."KONTO_OSZCZ_ID" IS 'ID konta g³ównego dla konta oszczêdnoœciowego.';
   COMMENT ON COLUMN "BANK"."KONTA"."KONTO_F_CZY_AKTYWNE" IS 'Flaga czy konto jest aktywne. T - aktywne, N - nieaktywne.';
   COMMENT ON COLUMN "BANK"."KONTA"."KONTO_KR_ID" IS 'Referencja do tabeli kody_ue. Oznaczenie kraju w rachunku IBAN.';
   COMMENT ON COLUMN "BANK"."KONTA"."KONTO_WLASC_ID" IS 'Referencja do tabeli klienci. Oznaczenie posiadacza konta.';
   COMMENT ON TABLE "BANK"."KONTA"  IS 'Tabela zawieraj¹ca dane o kontach bankowych.';
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

   COMMENT ON COLUMN "BANK"."TRANSAKCJE"."TRNS_ID" IS 'Identyfikator transakcji, klucz g³ówny tabeli.';
   COMMENT ON COLUMN "BANK"."TRANSAKCJE"."TRNS_RODZAJ" IS 'Rodzaj transakcji. P - przychody, W - wydatki.';
   COMMENT ON COLUMN "BANK"."TRANSAKCJE"."TRNS_KWOTA" IS 'Kwota transakcji w PLN.';
   COMMENT ON COLUMN "BANK"."TRANSAKCJE"."TRNS_TYP" IS 'Sposób dokonania transakcji. PK - p³atnoœæ kart¹, PZ - przelew zwyk³y, PE - przelew ekspresowy, PW - przelew walutowy, B - blik.';
   COMMENT ON COLUMN "BANK"."TRANSAKCJE"."DATA_ZAKS" IS 'Data zaksiêgowania transakcji.';
   COMMENT ON COLUMN "BANK"."TRANSAKCJE"."DATA_REALIZ" IS 'Data realizacji transakcji';
   COMMENT ON COLUMN "BANK"."TRANSAKCJE"."UTWORZONO_PRZEZ" IS 'U¿ytkownik rejestruj¹cy transakcje.';
   COMMENT ON COLUMN "BANK"."TRANSAKCJE"."TRNS_SP_PLAT" IS 'Sposób p³atnoœci. A - aplikacja mobilna, S - strona internetowa banku, K - karta.';
   COMMENT ON COLUMN "BANK"."TRANSAKCJE"."TRNS_KONTO_ID" IS 'Referencja do tabeli konta. Oznaczenie rachunku bankowego.';
   COMMENT ON COLUMN "BANK"."TRANSAKCJE"."TRNS_KAT_ID" IS 'Referencja do tabeli kategorie. Oznaczenie kategorii przychodu/wydatku.';
   COMMENT ON TABLE "BANK"."TRANSAKCJE"  IS 'Tabela zawieraj¹ca informacje o transakcjach online.';
--------------------------------------------------------
--  DDL for View BANK_VW_KLIENCI_PELNY
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "BANK"."BANK_VW_KLIENCI_PELNY" ("KLIENT_ID", "IMIE", "NAZWISKO", "LOGIN", "EMAIL", "STATUS", "PLEC", "ADRES_PE£NY", "MIASTO", "KRAJ") AS 
  SELECT 
        kl.klient_id,
        kl.imie,
        kl.nazwisko,
        kl.login, 
        kl.email, 
        DECODE(kl.f_czy_aktywny, 'T', 'Aktywny', 'Nieaktywny') status,
        kl.plec, 
        'ul. ' || adr.ulica || ' ' || adr.nr_bud || '/' || nr_miesz || ', '|| adr.kod_pocztowy adres_pe³ny,
        adr.miasto,
        adr.kraj
    FROM klienci kl 
        join adresy adr
        on kl.kl_adres_id = adr.adres_id
;
--------------------------------------------------------
--  DDL for View BANK_VW_KONTA_AKTYWNE
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "BANK"."BANK_VW_KONTA_AKTYWNE" ("KONTO_ID", "RODZAJ", "IBAN", "KLIENT", "CZY_OPERACJE") AS 
  SELECT
        knt.konto_id konto_id,
        'G£ÓWNE' rodzaj,
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
        'OSZCZÊDNOŒCIOWE' rodzaj,
        bank_pckg_utilities.f_format_rachunek(knt.konto_id, knt.konto_kr_id) iban,
        kl.imie || ' ' || kl.nazwisko klient,
        CASE WHEN trns.trns_kwota IS NULL THEN 'Nie' ELSE 'Tak' END czy_operacje
    FROM kody_ue kr
        RIGHT OUTER JOIN konta knt on kr.kraj_id = knt.konto_kr_id
        RIGHT OUTER JOIN klienci kl on kl.klient_id = knt.konto_wlasc_id
        LEFT  OUTER JOIN transakcje trns on trns.trns_konto_id = knt.konto_id
    WHERE knt.KONTO_OSZCZ_ID IS NOT NULL AND knt.konto_f_czy_aktywne = 'T';

   COMMENT ON COLUMN "BANK"."BANK_VW_KONTA_AKTYWNE"."RODZAJ" IS 'Znacznik czy konto g³ówne czy oszczêdnoœciowe.';
   COMMENT ON COLUMN "BANK"."BANK_VW_KONTA_AKTYWNE"."IBAN" IS 'Numer kontaw formacie IBAN.';
   COMMENT ON COLUMN "BANK"."BANK_VW_KONTA_AKTYWNE"."CZY_OPERACJE" IS 'Czy odnotowano transakcje dla tego konta.';
   COMMENT ON TABLE "BANK"."BANK_VW_KONTA_AKTYWNE"  IS 'Perspektywa z danymi na temat aktywnych kont bankowych.'
;
--------------------------------------------------------
--  DDL for View BANK_VW_TRANS_RAPORT
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "BANK"."BANK_VW_TRANS_RAPORT" ("LOGIN", "MSC", "ROK", "KATEGORIA", "RAZEM") AS 
  WITH
transakcje_w_p AS 
(
	SELECT 
		trns_rodzaj rodzaj,
		kat.nazwa kategoria,
		to_char(data_zaks, 'month', 'NLS_DATE_LANGUAGE = polish') msc,
        to_char(data_zaks, 'yyyy') rok,
		trns.trns_kwota kwota,
		kl.login login
	FROM transakcje trns
		left outer join kategorie kat on trns.trns_kat_id = kat.kat_id
		inner join konta knt on knt.konto_id = trns.trns_konto_id
		inner join klienci kl on kl.klient_id = knt.konto_wlasc_id
	WHERE trns.data_realiz IS NOT NULL
)
		SELECT 
		login,
		msc,
        rok,
		kategoria,
		NVL(SUM(CASE WHEN rodzaj = 'P' THEN +KWOTA WHEN rodzaj = 'W' THEN -KWOTA ELSE 0 END),0) razem
	FROM transakcje_w_p
	GROUP BY login, msc, rok, kategoria
    HAVING NVL(SUM(CASE WHEN rodzaj = 'P' THEN +KWOTA WHEN rodzaj = 'W' THEN -KWOTA ELSE 0 END),0) <> 0
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
/*
PLACE FOR INSERTS HERE
MY TEST INSERTS ARE NOT AVAILABLE PUBLIC
FEEL FREE TO INSERT YOUR OWN DATA 
*/
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


PROCEDURE proc_zaloz_konto (p_id IN NUMBER, p_nr IN NUMBER, p_oszcz_id IN NUMBER,p_f_akt IN VARCHAR2, p_kr_id IN NUMBER, p_wlasc_id IN NUMBER, p_data_urodzenia IN DATE);

PROCEDURE proc_zamknij_konto (p_id IN NUMBER);

kontoNieaktywneExc EXCEPTION;

END bank_pckg_konto;

/
--------------------------------------------------------
--  DDL for Package BANK_PCKG_TRANSAKCJA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "BANK"."BANK_PCKG_TRANSAKCJA" IS

FUNCTION f_sprawdz_status(p_trns_id NUMBER) RETURN VARCHAR2;

PROCEDURE proc_zmien_status(p_trns_id NUMBER);

END bank_pckg_transakcja;

/
--------------------------------------------------------
--  DDL for Package BANK_PCKG_UTILITIES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "BANK"."BANK_PCKG_UTILITIES" 
IS

FUNCTION f_format_rachunek (p_konto_id IN NUMBER) RETURN VARCHAR2;

FUNCTION f_format_rachunek (p_konto_id IN NUMBER, p_kraj_id IN NUMBER) RETURN VARCHAR2;

FUNCTION f_sprawdz_wiek_kl (p_data_urodzenia IN DATE) RETURN NUMBER;


END bank_pckg_utilities;

/
--------------------------------------------------------
--  DDL for Package Body BANK_PCKG_KONTO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "BANK"."BANK_PCKG_KONTO" IS
/*******************************************************************************
Author: Pawel
Version: 3
Changes: poprawa procedury proc_zamknij_konto
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
    values(
    v_nowe_konto.konto_id,
    v_nowe_konto.konto_nr,
    v_nowe_konto.konto_oszcz_id,
    v_nowe_konto.konto_f_czy_aktywne,
    v_nowe_konto.konto_kr_id,
    v_nowe_konto.konto_wlasc_id);
    COMMIT;
ELSE
    dbms_output.put_line('Tylko pe³noletni u¿ytkownicy mog¹ zak³adaæ konta.');
END IF;
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
    dbms_output.put_line('To konto zosta³o ju¿ zdezaktywowane. Operacja nie jest dozwolona.');
END proc_zamknij_konto;

END bank_pckg_konto;

/
--------------------------------------------------------
--  DDL for Package Body BANK_PCKG_TRANSAKCJA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "BANK"."BANK_PCKG_TRANSAKCJA" IS
/*******************************************************************************
Author: Pawel
Version: 1
Changes: dodano definicjê funkcji f_sprawdz_status i procedury proc_zmien_status
*******************************************************************************/

--funkcja sprawdzajaca aktualny status transakcji bankowej
FUNCTION f_sprawdz_status(p_trns_id NUMBER) RETURN VARCHAR2 IS
v_status VARCHAR2(1 CHAR);
BEGIN
SELECT CASE WHEN trns.data_realiz IS NULL THEN 1
ELSE 0 END into v_status FROM transakcje trns
WHERE trns_id = p_trns_id;
RETURN v_status;
END f_sprawdz_status;


--procedura zmieniajaca status transakcji z niezrealizowanej na zrealizowana
PROCEDURE proc_zmien_status(p_trns_id NUMBER) IS
BEGIN
    IF f_sprawdz_status(p_trns_id) = 1 THEN
        UPDATE transakcje
        SET data_realiz = sysdate
        WHERE trns_id = p_trns_id;
        COMMIT;
        dbms_output.put_line('Transakcja o nr ID ' || p_trns_id || ' zosta³a zrealizowana.');
    ELSIF f_sprawdz_status(p_trns_id) = 0 THEN
    dbms_output.put_line('Transakcja nr ' || p_trns_id || ' jest ju¿ zrealizowana.
    Zmiana statusu nie jest mo¿liwa.');
    END IF;
    EXCEPTION
    WHEN no_data_found THEN
    dbms_output.put_line('Brak transakcji o nr ID ' || p_trns_id);
END proc_zmien_status;


END bank_pckg_transakcja;

/
--------------------------------------------------------
--  DDL for Package Body BANK_PCKG_UTILITIES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "BANK"."BANK_PCKG_UTILITIES" 
IS
/*******************************************************************************
Author: Pawel
Version: 3
Changes: dodanie funkcji f_sprawdz_wiek_kl
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

-- funkcja formatuje nr konta do miêdzynarodowego standardu IBAN
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
FUNCTION f_sprawdz_wiek_kl (p_data_urodzenia IN DATE) RETURN NUMBER IS
v_data_urodzenia DATE;
v_wiek NUMBER(3,0);
BEGIN

    v_data_urodzenia := to_date(p_data_urodzenia,'dd-mm-yyyy');
    SELECT TRUNC((sysdate - v_data_urodzenia)/365,0) into v_wiek from dual;
    RETURN v_wiek;

END f_sprawdz_wiek_kl;


END bank_pckg_utilities;

/
--------------------------------------------------------
--  Constraints for Table KONTA_HIST
--------------------------------------------------------

  ALTER TABLE "BANK"."KONTA_HIST" MODIFY ("KONTO_NR" NOT NULL ENABLE);
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
--  Constraints for Table ADRESY
--------------------------------------------------------

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
  ALTER TABLE "BANK"."KLIENCI" ADD CONSTRAINT "KL_PESEL_CHK" CHECK (length(pesel) = 11) ENABLE;
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
