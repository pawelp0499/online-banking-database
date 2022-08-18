create or replace PACKAGE BODY bank_pckg_transakcja  IS
/*******************************************************************************
Author: Pawel
Version: 3
Changes: dodanie procedury proc_zaktualizuj_transaction_logs
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

--procedura zapisujaca logi transakcji dla wybranych TRNS_ID, pozwalajaca przechowywac tylko aktualne szczegoly transakcji
PROCEDURE proc_zaktualizuj_transaction_logs (p_id_first IN number, p_id_last IN number) IS

    type t_trns_rec is record   (trns_log_id transakcje.trns_id%type,
                                trns_log_kwota transakcje.trns_kwota%type,
                                trns_log_user transakcje.utworzono_przez%type,
                                trns_log_data timestamp);         
    type t_trans_tab is table of t_trns_rec index by pls_integer;
    v_trns t_trans_tab;
    idx pls_integer;
BEGIN
for i in p_id_first..p_id_last LOOP
    select trns_id, trns_kwota, utworzono_przez, coalesce(data_realiz, data_zaks) into v_trns(i) 
    from transakcje 
    where trns_id = i;
END LOOP;

idx := v_trns.first;

/** wymaga tabeli transakcje logs 
CREATE TABLE transakcje_logs
(
    TRNS_ID NUMBER, 
	TRNS_KWOTA NUMBER(38,0) NOT NULL, 
	UTWORZONO_PRZEZ VARCHAR2(25 CHAR), 
	TRNS_DATA_OPERACJI TIMESTAMP (6)
);
**/

execute immediate 'truncate table bank.transakcje_logs';
    
while idx is not null 
LOOP
    insert into transakcje_logs values v_trns(idx);
    dbms_output.put_line('Wprowadzono transakcję o ID: ' 
    || v_trns(idx).trns_log_id
    || ', ostatnio modyfikowana ' || v_trns(idx).trns_log_data);
    idx := v_trns.next(idx);
END LOOP;
COMMIT;
EXCEPTION
when no_data_found then null;
END proc_zaktualizuj_transaction_logs;


END bank_pckg_transakcja;