create or replace PACKAGE bank_pckg_transakcja IS

FUNCTION f_sprawdz_status(p_trns_id NUMBER) RETURN BOOLEAN;

PROCEDURE proc_zmien_status(p_trns_id NUMBER);

PROCEDURE proc_zaktualizuj_transaction_logs (p_id_first number, p_id_last number);

PROCEDURE proc_pobierz_konto_glowne;

FUNCTION f_is_tbl_exist (p_name varchar2) return number;

PROCEDURE proc_daj_top_transakcji(p_miesiac number, p_rok number, p_top integer);

END bank_pckg_transakcja;