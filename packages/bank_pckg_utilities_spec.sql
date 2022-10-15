create or replace PACKAGE bank_pckg_utilities
IS

-- funkcja wstawia separatory w celu dostosowania do powszechnego formatu nr konta
FUNCTION f_format_rachunek (p_konto_id IN NUMBER) RETURN VARCHAR2;

-- funkcja formatuje nr konta do międzynarodowego standardu IBAN
FUNCTION f_format_rachunek (p_konto_id IN NUMBER, p_kraj_id IN NUMBER) RETURN VARCHAR2;

-- funkcja informuje o aktualnym wieku klienta na podstawie parametru data ur
FUNCTION f_sprawdz_wiek_kl (p_data_urodzenia IN DATE) RETURN NUMBER;

-- funkcja sprawdzajaca istnienie obiektu tbl w db
FUNCTION f_is_tbl_exist (p_name varchar2) return number;

-- funkcja wylicza procent liczby x z liczby y
FUNCTION f_daj_procent (p_x number, p_y number) return number;

-- procedura do kompilacji obiektów
PROCEDURE proc_compile_invalid_obj;

-- funkcja walidująca numer pesel według oficjalnego algorytmu, sprawdza poprawność liczby kontrolnej, płci osoby
FUNCTION f_validate_pesel(p_klient_id number) return varchar2 DETERMINISTIC;

-- funkcja do logowania w tabelu logs_table - parametr p_log_details
procedure log(p_log_details varchar2);

-- funkcja do logowania w tabelu logs_table - parametr p_log_details, p_log_source
PROCEDURE log(p_log_details varchar2, p_log_source varchar2);

-- funkcja do logowania w tabelu logs_table - parametr p_log_details, p_log_add_info, p_log_source
PROCEDURE log(p_log_details varchar2, p_log_add_info varchar2, p_log_source varchar2);

-- f_parser() - funkcja do parsowania tekstu
-- @p_input_string - any varchar2 string
-- @v_return_string - string after parsing - currently deletes Polish characters 
--                                            and returns text without capital letters,
--      
FUNCTION f_parser(p_input_string varchar2) return varchar2 DETERMINISTIC;

END bank_pckg_utilities;