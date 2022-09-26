create or replace PACKAGE BODY bank_pckg_utilities
IS
/*******************************************************************************
Author: Pawel
Version: 9
Changes: poprawa procedury log - PRAGMA AUTONOMOUS_TRANSACTION
*******************************************************************************/

-- funkcja wstawia separatory w celu dostosowania do powszechnego formatu nr konta
FUNCTION f_format_rachunek (p_konto_id IN NUMBER) RETURN VARCHAR2 IS
v_rachunek VARCHAR2(40);
BEGIN

    SELECT
        substr(knt.konto_nr, 1,2)||
        ' ' || substr(knt.konto_nr, 3,4) ||
        ' ' || substr(knt.konto_nr, 7,4) ||
        ' ' || substr(knt.konto_nr, 11,4) ||
        ' ' || substr(knt.konto_nr, 15,4) ||
        ' ' || substr(knt.konto_nr, 19,4) ||
        ' ' || substr(knt.konto_nr, 23,4) into v_rachunek
        FROM konta knt
        WHERE knt.konto_id = p_konto_id;
    RETURN v_rachunek;
    EXCEPTION
        when no_data_found then null;
END f_format_rachunek;

-- funkcja formatuje nr konta do międzynarodowego standardu IBAN
FUNCTION f_format_rachunek (p_konto_id IN NUMBER, p_kraj_id IN NUMBER) RETURN VARCHAR2 IS
v_rachunek VARCHAR2(40);
BEGIN

    SELECT
        kd.kraj_kod || ' ' ||
        ' ' || substr(knt.konto_nr, 1,2)||
        ' ' || substr(knt.konto_nr, 3,4) ||
        ' ' || substr(knt.konto_nr, 7,4) ||
        ' ' || substr(knt.konto_nr, 11,4) ||
        ' ' || substr(knt.konto_nr, 15,4) ||
        ' ' || substr(knt.konto_nr, 19,4) ||
        ' ' || substr(knt.konto_nr, 23,4) into v_rachunek
        FROM konta knt join kody_ue kd
        on knt.konto_kr_id = kd.kraj_id
        WHERE knt.konto_id = p_konto_id
        and knt.konto_kr_id = p_kraj_id;
    RETURN v_rachunek;
    EXCEPTION
        when no_data_found then null;
END f_format_rachunek;

-- funkcja informuje o aktualnym wieku klienta na podstawie parametru data ur
FUNCTION f_sprawdz_wiek_kl (p_data_urodzenia DATE) RETURN NUMBER IS
v_data_urodzenia DATE;
v_wiek NUMBER(3,0);
BEGIN

    v_data_urodzenia := to_date(p_data_urodzenia,'dd-mm-yyyy');
    SELECT TRUNC((sysdate - v_data_urodzenia)/365,0) into v_wiek from dual;
    RETURN v_wiek;

END f_sprawdz_wiek_kl;

--funkcja sprawdzajaca istnienie obiektu tbl w db
FUNCTION f_is_tbl_exist (p_name varchar2) return number is
v_return number(1,0);
BEGIN
    select count(*) into v_return from all_tables where table_name = UPPER(p_name);
    return v_return;
END f_is_tbl_exist;

--funkcja wylicza procent liczby x z liczby y
FUNCTION f_daj_procent (p_x number, p_y number) return number is
v_return number;
zero_divide exception;
begin
    begin
        if p_y = 0 then raise zero_divide; end if;
        
        select round((p_x / p_y)*100,2) into v_return from dual;

        exception 
        when zero_divide then
        v_return := null;
    end;
    return v_return;
end f_daj_procent;

--procedura do kompilacji obiektów db
PROCEDURE proc_compile_invalid_obj is
v_new_status user_objects.status%type;
v_count number;
begin
    select count(object_id) into v_count from user_objects where status = 'INVALID';
    dbms_output.put_line('Number of invalid objects in ' || user || ' schema is: ' || v_count);

    for obj in (select * from user_objects where status = 'INVALID')
    loop
    dbms_output.put_line('object: ' || obj.object_name || ' status before compilation: ' || obj.status);
        begin
            if obj.object_type = 'PACKAGE BODY' then
                execute immediate 'alter package ' || obj.object_name || ' compile body';
--                dbms_output.put_line('execute immediate ' || '''alter package ' || obj.object_name || ' compile body;''' || 'STATUS: ' || obj.status);
            elsif obj.object_type = 'PACKAGE' then
                execute immediate 'alter package ' || obj.object_name || ' compile package';
--                dbms_output.put_line('execute immediate ' || '''alter package ' || obj.object_name || ' compile paackage;''');
            else
                execute immediate 'alter ' || obj.object_type || ' ' || obj.object_name || ' compile';
            end if;
        exception
        when others then
            null;
        end;
        
        select status into v_new_status from all_objects where object_id = obj.object_id;
        dbms_output.put_line('===> ' || 'object: ' || obj.object_name || ' status after compilation: ' || v_new_status);
        dbms_output.put_line('--------------------------------------------------------------------------------');
        
        if v_new_status <> 'VALID' then
            dbms_output.put_line('Failure while compiling ' || obj.object_type || ' ' || obj.object_name);
            dbms_output.put_line('--------------------------------------------------------------------------------');
        end if;
    end loop;
    
    select count(object_id) into v_count from user_objects where status = 'INVALID';
    if v_count <> 0 then
        dbms_output.put_line('Number of invalid objects in ' || user || ' schema is: ' || v_count);
        for i in (select * from user_objects where status = 'INVALID') 
        loop
            dbms_output.put_line(i.object_name);
        end loop;
    end if;    
end proc_compile_invalid_obj;

-- funkcja walidująca numer pesel według oficjalnego algorytmu, sprawdza poprawność liczby kontrolnej, płci osoby
FUNCTION f_validate_pesel(p_klient_id number) return varchar2 DETERMINISTIC is
v_pesel klienci.pesel%type;
v_plec klienci.plec%type;
v_liczba_kontrolna number;
v_return varchar2(1 CHAR);
type t_elements is record   (char_1 varchar2(1 CHAR), char_2 varchar2(1 CHAR), char_3 varchar2(1 CHAR),
                            char_4 varchar2(1 CHAR), char_5 varchar2(1 CHAR), char_6 varchar2(1 CHAR), 
                            char_7 varchar2(1 CHAR), char_8 varchar2(1 CHAR), char_9 varchar2(1 CHAR), char_10 varchar2(1 CHAR));
type t_weights is varray(10) of number;
weights constant t_weights := t_weights(1, 3, 7, 9, 1, 3, 7, 9, 1, 3);
pesel_digits t_elements;
multiply_by_weight t_weights;
check_digit number;
sum_mbw number;
invalid_pesel exception;
begin
    select kl.pesel into v_pesel from klienci kl where kl.klient_id = p_klient_id;
    select kl.plec into v_plec from klienci kl where kl.klient_id = p_klient_id;
    select  substr(v_pesel, 1, 1), substr(v_pesel, 2, 1), substr(v_pesel, 3, 1), substr(v_pesel, 4, 1), substr(v_pesel, 5, 1), substr(v_pesel, 6, 1), 
            substr(v_pesel, 7, 1), substr(v_pesel, 8, 1), substr(v_pesel, 9, 1), substr(v_pesel, 10, 1) 
            into pesel_digits from dual;
    multiply_by_weight := t_weights(null, null, null, null, null, null, null, null, null, null);
    
    multiply_by_weight(1) := pesel_digits.char_1 * weights(1);
    multiply_by_weight(2) := pesel_digits.char_2 * weights(2);
    multiply_by_weight(3) := pesel_digits.char_3 * weights(3);
    multiply_by_weight(4) := pesel_digits.char_4 * weights(4);
    multiply_by_weight(5) := pesel_digits.char_5 * weights(5);
    multiply_by_weight(6):= pesel_digits.char_6 * weights(6);
    multiply_by_weight(7) := pesel_digits.char_7 * weights(7);
    multiply_by_weight(8) := pesel_digits.char_8 * weights(8);
    multiply_by_weight(9) := pesel_digits.char_9 * weights(9);
    multiply_by_weight(10) := pesel_digits.char_10 * weights(10);
    
    for i in multiply_by_weight.first..multiply_by_weight.last
    loop
        if length(multiply_by_weight(i)) = 2 then
            multiply_by_weight(i) := substr(multiply_by_weight(i), 2, 1);
        else 
            multiply_by_weight(i) := multiply_by_weight(i);
        end if;
    end loop;
    
    select   multiply_by_weight(1) + multiply_by_weight(2) + multiply_by_weight(3) + multiply_by_weight(4) + multiply_by_weight(5) +
             multiply_by_weight(6) + multiply_by_weight(7) + multiply_by_weight(8) + multiply_by_weight(9) + multiply_by_weight(10) 
             into sum_mbw from dual;
                 
    if length(sum_mbw) = 2 then sum_mbw := substr(sum_mbw, 2, 1); end if;
    select 10 - sum_mbw into check_digit from dual;
    
    if substr(v_pesel, 11, 1) = check_digit then
        if  substr(v_pesel, 10, 1) in (0,2,4,6,8) and v_plec in ('K','N') or
            substr(v_pesel, 10, 1) in (1,3,5,7,9) and v_plec in ('M','N') then
            v_return := 'T'; 
        else
            v_return := 'N';
        end if;
    elsif v_pesel is null then
        v_return := 'T';
    else
        v_return := 'N';
        raise invalid_pesel;
    end if;

return v_return;

exception
when invalid_pesel then return 'N';

end f_validate_pesel;

procedure log(p_log_details varchar2) is PRAGMA AUTONOMOUS_TRANSACTION;
begin
insert into bank.logs_table values(log_id_seq.nextval , sysdate, null, p_log_details, null, user);
commit;
end log;

procedure log(p_log_details varchar2, p_log_source varchar2) is PRAGMA AUTONOMOUS_TRANSACTION;
begin
insert into bank.logs_table values(log_id_seq.nextval, sysdate, p_log_source, p_log_details, null, user);
commit;
end log;

procedure log(p_log_details varchar2, p_log_add_info varchar2, p_log_source varchar2) is PRAGMA AUTONOMOUS_TRANSACTION;
begin
insert into bank.logs_table values(bank.log_id_seq.nextval, sysdate, p_log_source, p_log_details, p_log_add_info, user);
commit;
end log;

BEGIN
log('zainicjalizowano pakiet', 'BANK_PCKG_UTILITIES');
END bank_pckg_utilities;