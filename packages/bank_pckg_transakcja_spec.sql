create or replace PACKAGE bank_pckg_transakcja IS

FUNCTION f_sprawdz_status(p_trns_id NUMBER) RETURN BOOLEAN;

PROCEDURE proc_zmien_status(p_trns_id NUMBER);

END bank_pckg_transakcja;