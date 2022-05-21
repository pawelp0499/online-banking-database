CREATE TABLE bank.adresy
    (
    adres_id NUMBER PRIMARY KEY,
    kraj varchar2(50 CHAR) NOT NULL,
    miasto varchar2(60 CHAR) NOT NULL,
    ulica varchar2(50 CHAR) DEFAULT NULL,
    nr_bud varchar2(10 CHAR) NOT NULL,
    nr_miesz number(4,0) DEFAULT NULL,
    kod_pocztowy varchar2(6 CHAR)
    )
    
    COMMENT ON TABLE bank.adresy IS 'Tabela zawierająca adresy klientów podane przy rejestracji konta.';
    COMMENT ON COLUMN bank.adresy.adres_id IS 'Klucz główny identyfikujący adres.';
    COMMENT ON COLUMN bank.adresy.kraj IS 'Kraj.';
    COMMENT ON COLUMN bank.adresy.miasto IS 'Miejscowość.';
    COMMENT ON COLUMN bank.adresy.ulica IS 'Ulica.';
    COMMENT ON COLUMN bank.adresy.nr_bud IS 'Numer budynku.';
    COMMENT ON COLUMN bank.adresy.nr_miesz IS 'Numer mieszkania lub apartamentu.';
    COMMENT ON COLUMN bank.adresy.kod_pocztowy IS 'Kod pocztowy.';
    
    CREATE PUBLIC SYNONYM adresy
    FOR bank.adresy;