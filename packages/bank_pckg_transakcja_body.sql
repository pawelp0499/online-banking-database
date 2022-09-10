create or replace PACKAGE BODY bank_pckg_transakcja  IS
/*******************************************************************************
Author: Pawel
Version: 5
Changes: przeniesienie f_is_tbl_exist do bank_pckg_utilities
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
    WHEN no_data_found THEN dbms_output.put_line('Brak transakcji o nr ID ' || p_trns_id);
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

-- procedura nadpisujaca konto oszczednosciowe odpowiadajacym mu kontem glownym
-- w przypadku odnotowania platnosci
PROCEDURE proc_pobierz_konto_glowne IS
v_konto_glowne_id konta.konto_id%type;
BEGIN
    for trns in (select t.trns_id, t.trns_kwota, k.konto_id, k.konto_oszcz_id 
                from transakcje t inner join konta k on t.trns_konto_id = k.konto_id)
    loop
            select trns.konto_oszcz_id into v_konto_glowne_id from dual;
            if trns.trns_kwota <> 0 and trns.konto_oszcz_id is not null then
                update transakcje set trns_konto_id = v_konto_glowne_id where trns_id = trns.trns_id;
                dbms_output.put_line('Transakcja ID: ' || trns.trns_id || ' Zmodyfikowano ' || sql%rowcount || ' rekordów');
            else 
                dbms_output.put_line('Transakcja ID: ' || trns.trns_id);
            end if;
    end loop;
    commit;
END proc_pobierz_konto_glowne;

PROCEDURE proc_daj_top_transakcji(p_miesiac number, p_rok number, p_top integer) is
    cursor c_trns_by_month_year is select trns_id, trns_kwota, trns_data_operacji from transakcje_logs 
    where to_char(trns_data_operacji, 'mm') = p_miesiac and to_char(trns_data_operacji, 'yyyy') = p_rok;
    v_ilosc_trns number;
    v_pozycja number := 0;
    v_tbl varchar2(4000 CHAR);
    v_miesiac varchar2(15 CHAR);
    exc_existing_tbl exception;
    exc_no_transactions exception;
begin
    begin
        select count(*) into v_ilosc_trns from (select trns_id, trns_kwota, trns_data_operacji from transakcje_logs 
        where to_char(trns_data_operacji, 'mm') = p_miesiac and to_char(trns_data_operacji, 'yyyy') = p_rok);
        
        if v_ilosc_trns = 0 then raise exc_no_transactions; end if;
    
        if p_miesiac = 01 then v_miesiac := 'STY';
        elsif p_miesiac = 02 then v_miesiac := 'LUT';
        elsif p_miesiac = 03 then v_miesiac := 'MAR';
        elsif p_miesiac = 04 then v_miesiac := 'KWI';
        elsif p_miesiac = 05 then v_miesiac := 'MAJ';
        elsif p_miesiac = 06 then v_miesiac := 'CZE';
        elsif p_miesiac = 07 then v_miesiac := 'LIP';
        elsif p_miesiac = 08 then v_miesiac := 'SIE';
        elsif p_miesiac = 09 then v_miesiac := 'WRZ';
        elsif p_miesiac = 10 then v_miesiac := 'PAZ';
        elsif p_miesiac = 11 then v_miesiac := 'LIS';
        elsif p_miesiac = 12 then v_miesiac := 'GRU';
        end if;
        
        v_tbl := 'top_' || p_top || '_trns_' ||
        v_miesiac || '_' || p_rok || '_' || to_char(sysdate,'DD_MM_YYYY');
        
        if bank_pckg_utilities.f_is_tbl_exist(v_tbl) <> 0 then raise exc_existing_tbl; end if;
        
        execute immediate 'create table ' || v_tbl ||
        '(trns_id number primary key
        , trns_kwota number not null
        , trns_data_operacji timestamp(6) not null
        , kto_utworzyl varchar2(30 CHAR) default user not null)';
        
        for i in c_trns_by_month_year loop
            exit when c_trns_by_month_year%rowcount > p_top;
            v_pozycja := v_pozycja + 1;
            execute immediate 'insert into ' || v_tbl || '(trns_id, trns_kwota, trns_data_operacji)' ||
            ' values (' || i.trns_id || ', ' || i.trns_kwota || ', ''' || i.trns_data_operacji || '''' || ')';
            dbms_output.put_line(v_pozycja || '. ' || i.trns_kwota || ', ' || i.trns_data_operacji);
        end loop;
        
        commit;
    
    exception
    when exc_existing_tbl then 
        dbms_output.put_line('W tym dniu wygenerowano już raport transakcji za ten okres i w podanej konfiguracji.');
    end;
exception 
when exc_no_transactions then 
    dbms_output.put_line('Nie znaleziono transakcji.');
when others then
        dbms_output.put_line(sqlcode || ' ==> ' || sqlerrm);
end proc_daj_top_transakcji;


END bank_pckg_transakcja;