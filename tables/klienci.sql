CREATE TABLE bank.klienci
    (   
    klient_id NUMBER PRIMARY KEY,
    imie VARCHAR2(30) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL,
    plec VARCHAR2(1 CHAR), 
    login VARCHAR2(15 CHAR) GENERATED ALWAYS AS
    (LOWER(SUBSTR(imie, 0, 3) || '.' || SUBSTR(nazwisko,0, 3))),
    email VARCHAR2(75) NOT NULL UNIQUE,
    pesel NUMBER(11) UNIQUE,
    f_czy_aktywny VARCHAR2(1 CHAR) DEFAULT 'T'
    );
    
COMMENT ON TABLE bank.klienci IS 'Tabela przechowująca informacje o klientach.';
COMMENT ON COLUMN bank.klienci.klient_id IS 'Klucz główny identyfikujący klienta.';
COMMENT ON COLUMN bank.klienci.imie IS 'Imię klienta.';
COMMENT ON COLUMN bank.klienci.nazwisko IS 'Nazwisko klienta.';
COMMENT ON COLUMN bank.klienci.plec IS 'Zadeklarowana płeć klienta M - mężczyzna, K - kobieta, N - nie chce podawać.';
COMMENT ON COLUMN bank.klienci.login IS 'Login do aplikacji mobilnej danego użytkownika (klienta).';
COMMENT ON COLUMN bank.klienci.email IS 'Adres e-mail klienta.';
COMMENT ON COLUMN bank.klienci.pesel IS 'Numer PESEL klienta.';
COMMENT ON COLUMN bank.klienci.f_czy_aktywny IS 'Flaga czy klient aktywny.';
    
CREATE PUBLIC SYNONYM klienci
FOR bank.klienci;
	
-- created foreign key kl_fk referenced to bank.adresy after create of that table
/	

SET SERVEROUTPUT ON
DECLARE
  v_col_exists NUMBER;
BEGIN
  SELECT count(*) INTO v_col_exists
    FROM user_tab_cols
    WHERE column_name = 'kl_adres_id'
      AND table_name = 'klienci';

   IF (v_col_exists = 0) THEN
      EXECUTE IMMEDIATE 'ALTER TABLE klienci ADD kl_adres_id NUMBER UNIQUE NOT NULL';
      EXECUTE IMMEDIATE 'ALTER TABLE klienci ADD constraint kl_fk foreign key (kl_adres_id) references adresy(adres_id)';
      DBMS_OUTPUT.PUT_LINE('Klucz obcy został poprawnie stworzony.');
   ELSE
    DBMS_OUTPUT.PUT_LINE('Taka kolumna już istnieje.');
  END IF;
END;

/
    COMMENT ON COLUMN bank.klienci.kl_adres_id IS 'Referencja do tabeli Adresy.';
/

-- additional CONSTRAINTS for allowed values
ALTER TABLE klienci ADD CONSTRAINT kl_gnd_chk CHECK (plec in ('M', 'K', 'N'));
ALTER TABLE klienci ADD CONSTRAINT kl_atv_chk CHECK (f_czy_aktywny in ('T', 'N'));