CREATE TABLE bank.adresy_hist
    (
		adr_hist_id NUMBER PRIMARY KEY
    ,   data_operacji timestamp default SYSDATE NOT NULL    
	,	kraj varchar2(50 CHAR) NOT NULL
	,	miasto varchar2(60 CHAR) NOT NULL
	,	ulica varchar2(50 CHAR) DEFAULT NULL
	,	nr_bud varchar2(10 CHAR) NOT NULL
	,	nr_miesz number(4,0) DEFAULT NULL
	,	kod_pocztowy varchar2(10 CHAR) NOT NULL
    );

ALTER TABLE bank.adresy_hist ADD 	kraj_new varchar2(50 CHAR);
ALTER TABLE bank.adresy_hist ADD 	miasto_new 			varchar2(60 CHAR);
ALTER TABLE bank.adresy_hist ADD	ulica_new 			varchar2(50 CHAR);
ALTER TABLE bank.adresy_hist ADD	nr_bud_new 			varchar2(10 CHAR)
ALTER TABLE bank.adresy_hist ADD 	nr_miesz_new 		number(4,0);
ALTER TABLE bank.adresy_hist ADD	kod_pocztowy_new 	varchar2(10 CHAR);

--comments
COMMENT ON TABLE bank.adresy_hist IS 'Tabela zawierająca historyczne zmiany adresów klientów.';
COMMENT ON COLUMN bank.adresy_hist.adr_hist_id IS 'Klucz główny identyfikujący adres.';
COMMENT ON COLUMN bank.adresy_hist.data_operacji IS 'Kiedy zmodyfikowano dane.';
COMMENT ON COLUMN bank.adresy_hist.kraj IS 'Kraj.';
COMMENT ON COLUMN bank.adresy_hist.miasto IS 'Miejscowość.';
COMMENT ON COLUMN bank.adresy_hist.ulica IS 'Ulica.';
COMMENT ON COLUMN bank.adresy_hist.nr_bud IS 'Numer budynku.';
COMMENT ON COLUMN bank.adresy_hist.nr_miesz IS 'Numer mieszkania lub apartamentu.';
COMMENT ON COLUMN bank.adresy_hist.kod_pocztowy IS 'Kod pocztowy.';
COMMENT ON COLUMN bank.adresy_hist.kraj_new IS 'Kraj - nowa wartość.';
COMMENT ON COLUMN bank.adresy_hist.miasto_new IS 'Miejscowość - nowa wartość.';
COMMENT ON COLUMN bank.adresy_hist.ulica_new IS 'Ulica - nowa wartość.';
COMMENT ON COLUMN bank.adresy_hist.nr_bud_new IS 'Numer budynku - nowa wartość.';
COMMENT ON COLUMN bank.adresy_hist.nr_miesz_new IS 'Numer mieszkania lub apartamentu - nowa wartość.';
COMMENT ON COLUMN bank.adresy_hist.kod_pocztowy_new IS 'Kod pocztowy - nowa wartość.';



--synonym
CREATE PUBLIC SYNONYM adresy_hist
FOR bank.adresy_hist;