CREATE OR REPLACE PACKAGE bank_pckg_utilities
IS

FUNCTION f_podaj_iban (v_konto_id IN NUMBER) RETURN VARCHAR2;

END bank_pckg_utilities;