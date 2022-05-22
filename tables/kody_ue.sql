CREATE TABLE bank.kody_ue
    (
    kraj_id NUMBER PRIMARY KEY,
    kraj_nazwa varchar2(50 CHAR) UNIQUE NOT NULL,
    kraj_kod varchar2(2 CHAR) UNIQUE NOT NULL
    );

--comments    
COMMENT ON TABLE bank.kody_ue IS 'Kody krajów Unii Europejskiej stosowane w numerze rachunku w formacie IBAN.';
COMMENT ON COLUMN bank.kody_ue.kraj_id IS 'Identyfikator kraju.';
COMMENT ON COLUMN bank.kody_ue.kraj_nazwa IS 'Państwo.';
COMMENT ON COLUMN bank.kody_ue.kraj_kod IS 'Kod kraju.';

--synonym
CREATE PUBLIC SYNONYM kody_ue
FOR bank.kody_ue;

--triggers
CREATE OR REPLACE TRIGGER kody_ue_trg
BEFORE INSERT ON kody_ue
FOR EACH ROW
BEGIN
    :NEW.kraj_id := auto_id_seq.nextval;
END;

--constraints
ALTER TABLE kody_ue ADD CONSTRAINT kd_kod_chk CHECK (length(kraj_kod) = 2);