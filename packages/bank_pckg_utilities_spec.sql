create or replace PACKAGE bank_pckg_utilities
IS

FUNCTION f_format_rachunek (p_konto_id IN NUMBER) RETURN VARCHAR2;

FUNCTION f_format_rachunek (p_konto_id IN NUMBER, p_kraj_id IN NUMBER) RETURN VARCHAR2;

FUNCTION f_sprawdz_wiek_kl (p_data_urodzenia IN DATE) RETURN NUMBER;

FUNCTION f_is_tbl_exist (p_name varchar2) return number;

FUNCTION f_daj_procent (p_x number, p_y number) return number;

PROCEDURE proc_compile_invalid_obj;

FUNCTION f_validate_pesel(p_klient_id number) return varchar2 DETERMINISTIC;

procedure log(p_log_details varchar2);

PROCEDURE log(p_log_details varchar2, p_log_source varchar2);

PROCEDURE log(p_log_details varchar2, p_log_add_info varchar2, p_log_source varchar2);

END bank_pckg_utilities;