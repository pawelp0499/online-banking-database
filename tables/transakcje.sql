CREATE TABLE bank.transakcje
    (
    trns_id NUMBER PRIMARY KEY,
    trns_rodzaj varchar2(1 CHAR) NOT NULL,
    trns_kwota INTEGER NOT NULL, 
    trns_typ NUMBER(1),
    data_zaks DATE DEFAULT SYSDATE,
    data_realiz DATE DEFAULT NULL,
    utworzono_przez varchar(2) DEFAULT user,
    trns_sp_plat varchar2(2 CHAR), 
    trns_konto_id NUMBER references konta (konto_id),
    trns_kat_id NUMBER references kategorie (kat_id)
    );
    
COMMENT ON TABLE bank.transakcje IS 'Tabela zawierająca informacje o transakcjach online.';
COMMENT ON COLUMN bank.transakcje.trns_id IS 'Identyfikator transakcji, klucz główny tabeli.';
COMMENT ON COLUMN bank.transakcje.trns_rodzaj IS 'Rodzaj transakcji. P - przychody, W - wydatki.';
COMMENT ON COLUMN bank.transakcje.trns_kwota IS 'Kwota transakcji w PLN.';
COMMENT ON COLUMN bank.transakcje.trns_typ IS 'Sposób dokonania transakcji. PZ - przelew zwykły, PE - przelew ekspresowy, PW - przelew walutowy, B - blik.';
COMMENT ON COLUMN bank.transakcje.data_zaks IS 'Data zaksięgowania transakcji.';
COMMENT ON COLUMN bank.transakcje.data_realiz IS 'Data realizacji transakcji';
COMMENT ON COLUMN bank.transakcje.utworzono_przez IS 'Użytkownik rejestrujący transakcje.';
COMMENT ON COLUMN bank.transakcje.trns_sp_plat IS 'Sposób płatności. A - aplikacja mobilna, S - strona internetowa banku.';
COMMENT ON COLUMN bank.transakcje.trns_konto_id IS 'Referencja do tabeli konta. Oznaczenie rachunku bankowego.';
COMMENT ON COLUMN bank.transakcje.trns_kat_id IS 'Referencja do tabeli kategorie. Oznaczenie kategorii przychodu/wydatku.';

CREATE PUBLIC SYNONYM transakcje
FOR bank.transakcje;

-- additional CONSTRAINTS for allowed values
ALTER TABLE transakcje ADD CONSTRAINT trns_rodz_chk CHECK (trns_rodzaj in ('P','W'));
ALTER TABLE transakcje ADD CONSTRAINT trns_typ_chk CHECK (trns_typ in ('PZ', 'PE', 'PW', 'B'));
ALTER TABLE transakcje ADD CONSTRAINT trns_pl_chk CHECK (trns_sp_plat in ('A', 'S'));