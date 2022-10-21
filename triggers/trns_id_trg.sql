-- trigger to autoincrement transaction id in transakcje table
create or replace TRIGGER trns_id_trg
BEFORE INSERT on transakcje
FOR EACH ROW
BEGIN
  :NEW.trns_id := trns_id_seq.nextval;
END;