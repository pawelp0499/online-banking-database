CREATE OR REPLACE TRIGGER bank_trg_adr_hist
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