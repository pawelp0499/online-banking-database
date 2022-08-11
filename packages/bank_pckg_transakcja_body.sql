create or replace PACKAGE BODY bank_pckg_transakcja  IS
/*******************************************************************************
Author: Pawel
Version: 2
Changes: zmiana definicji funkcji f_sprawdz_status i procedury proc_zmien_status
*******************************************************************************/

--funkcja sprawdzajaca aktualny status transakcji bankowej
FUNCTION f_sprawdz_status(p_trns_id NUMBER) RETURN BOOLEAN IS
    v_status BOOLEAN := FALSE;
    type rec_trns is record(id transakcje.trns_id%type, data_realiz transakcje.data_realiz%type);
    r_transaction rec_trns;
BEGIN
    SELECT trns_id, data_realiz into r_transaction from transakcje where trns_id = p_trns_id;
    IF r_transaction.data_realiz IS NULL THEN
        v_status := true;
    ELSE
        v_status := false;
    END IF;
    RETURN v_status;
END f_sprawdz_status;


--procedura zmieniajaca status transakcji z niezrealizowanej na zrealizowana
PROCEDURE proc_zmien_status(p_trns_id NUMBER) IS
BEGIN
    IF f_sprawdz_status(p_trns_id) = true THEN
        UPDATE transakcje
        SET data_realiz = sysdate
        WHERE trns_id = p_trns_id;
        COMMIT;
        dbms_output.put_line('Transakcja o nr ID ' || p_trns_id || ' została zrealizowana.');
    ELSIF f_sprawdz_status(p_trns_id) = false THEN
    dbms_output.put_line('Transakcja nr ' || p_trns_id || ' jest już zrealizowana.
    Zmiana statusu nie jest możliwa.');
    END IF;
    EXCEPTION
    WHEN no_data_found THEN
    dbms_output.put_line('Brak transakcji o nr ID ' || p_trns_id);
END proc_zmien_status;


END bank_pckg_transakcja;