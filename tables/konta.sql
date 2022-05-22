CREATE TABLE bank.konta
    (
    konto_id NUMBER PRIMARY KEY,
    konto_nr NUMBER(26,0) UNIQUE NOT NULL,
    konto_oszcz_id NUMBER DEFAULT NULL UNIQUE,
    konto_f_czy_aktywne varchar2(1 CHAR) DEFAULT 'T',
    konto_kr_id NUMBER references kody_ue (kraj_id),
    konto_wlasc_id NUMBER references klienci (klient_id)
    );
    
--comments
COMMENT ON TABLE bank.konta IS  'Tabela zawierająca dane o kontach bankowych.';
COMMENT ON COLUMN bank.konta.konto_id IS  'Klucz główny identyfikujący konto.';
COMMENT ON COLUMN bank.konta.konto_nr IS  'Numer konta bankowego.';
COMMENT ON COLUMN bank.konta.konto_oszcz_id IS  'ID konta głównego dla konta oszczędnościowego.';
COMMENT ON COLUMN bank.konta.konto_f_czy_aktywne IS  'Flaga czy konto jest aktywne. T - aktywne, N - nieaktywne.';
COMMENT ON COLUMN bank.konta.konto_kr_id IS  'Referencja do tabeli kody_ue. Oznaczenie kraju w rachunku IBAN.';
COMMENT ON COLUMN bank.konta.konto_wlasc_id IS  'Referencja do tabeli klienci. Oznaczenie posiadacza konta.';

--synonym
CREATE PUBLIC SYNONYM konta
FOR bank.konta;

-- additional CONSTRAINTS for allowed values
ALTER TABLE konta ADD CONSTRAINT knt_acc_atv_chk CHECK (konto_f_czy_aktywne in ('T', 'N'));
ALTER TABLE konta ADD CONSTRAINT knt_nr_chk CHECK (length(konto_nr) = 26);