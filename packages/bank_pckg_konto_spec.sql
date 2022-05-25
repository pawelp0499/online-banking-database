CREATE OR REPLACE PACKAGE bank_pckg_konto IS


PROCEDURE proc_zaloz_konto (p_id IN NUMBER, p_nr IN NUMBER, p_oszcz_id IN NUMBER,p_f_akt IN VARCHAR2, p_kr_id IN NUMBER, p_wlasc_id IN NUMBER, p_data_urodzenia IN DATE);

PROCEDURE proc_zamknij_konto (p_id IN NUMBER);

kontoNieaktywneExc EXCEPTION;

END bank_pckg_konto;