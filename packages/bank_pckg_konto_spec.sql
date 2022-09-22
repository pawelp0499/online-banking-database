CREATE OR REPLACE PACKAGE bank_pckg_konto IS

-- procedura do zakladania nowego konta, po uprzednim zweryfikowaniu pelnoletnosci klienta
PROCEDURE proc_zaloz_konto (p_id IN NUMBER, p_nr IN NUMBER, p_oszcz_id IN NUMBER,p_f_akt IN VARCHAR2, p_kr_id IN NUMBER, p_wlasc_id IN NUMBER, p_data_urodzenia IN DATE);

-- procedura zmiany statusu konta na nieaktywne, modyfikuje takze informacje
-- o koncie oszczednosciowym oraz odklada je do tabeli konta_hist
PROCEDURE proc_zamknij_konto (p_id IN NUMBER);

kontoNieaktywneExc EXCEPTION;

END bank_pckg_konto;