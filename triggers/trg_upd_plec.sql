CREATE OR REPLACE TRIGGER trg_upd_plec
INSTEAD OF UPDATE ON bank_vw_klienci_pelny 
FOR EACH ROW
BEGIN
    UPDATE klienci
    SET plec = :NEW.plec
    WHERE klient_id = :OLD.klient_id;
	COMMIT;
END;