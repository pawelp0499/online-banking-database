create or replace PACKAGE bank_pckg_utilities
IS

FUNCTION f_format_rachunek (p_konto_id IN NUMBER) RETURN VARCHAR2;

FUNCTION f_format_rachunek (p_konto_id IN NUMBER, p_kraj_id IN NUMBER) RETURN VARCHAR2;

FUNCTION f_sprawdz_wiek_kl (p_data_urodzenia IN DATE) RETURN NUMBER;


END bank_pckg_utilities;