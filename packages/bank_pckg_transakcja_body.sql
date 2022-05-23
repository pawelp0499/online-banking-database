create or replace PACKAGE BODY bank_pckg_transakcja  IS
/*******************************************************************************
Author: Pawel
Version: 1
Changes: dodano definicję funkcji f_sprawdz_status i procedury proc_zmien_status
*******************************************************************************/

--funkcja sprawdzajaca aktualny status transakcji bankowej
FUNCTION f_sprawdz_status(p_trns_id NUMBER) RETURN VARCHAR2 IS
v_status VARCHAR2(1 CHAR);
BEGIN
SELECT CASE WHEN trns.data_realiz IS NULL THEN 1
ELSE 0 END into v_status FROM transakcje trns
WHERE trns_id = p_trns_id;
RETURN v_status;
END f_sprawdz_status;

--procedura zmieniajaca status transakcji z niezrealizowanej na zrealizowana
PROCEDURE proc_zmien_status(p_trns_id NUMBER) IS
BEGIN
    IF f_sprawdz_status(p_trns_id) = 1 THEN
        UPDATE transakcje
        SET data_realiz = sysdate
        WHERE trns_id = p_trns_id;
        COMMIT;
    ELSIF f_sprawdz_status(p_trns_id) = 0 THEN
    dbms_output.put_line('Transakcja nr ' || p_trns_id || ' jest już zrealizowana.
    Zmiana statusu nie jest możliwa.');
    END IF;
    EXCEPTION
    WHEN no_data_found THEN
    dbms_output.put_line('Brak transakcji o ID: ' || p_trns_id);
END proc_zmien_status;

END bank_pckg_transakcja;