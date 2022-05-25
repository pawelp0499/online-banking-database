CREATE OR REPLACE PACKAGE BODY bank_pckg_konto IS
/*******************************************************************************
Author: Pawel
Version: 3
Changes: stworzenie wyjatku kontoNieaktywneExc, obsluga
*******************************************************************************/

-- procedura do zakladania nowego konta, po uprzednim zweryfikowaniu pelnoletnosci klienta
PROCEDURE proc_zaloz_konto (p_id IN NUMBER, p_nr IN NUMBER, p_oszcz_id IN NUMBER,
p_f_akt IN VARCHAR2, p_kr_id IN NUMBER, p_wlasc_id IN NUMBER, p_data_urodzenia IN DATE)  IS

v_nowe_konto konta%ROWTYPE;

BEGIN

v_nowe_konto.konto_id := p_id;
v_nowe_konto.konto_nr := p_nr;
v_nowe_konto.konto_oszcz_id := p_oszcz_id;
v_nowe_konto.konto_f_czy_aktywne := p_f_akt;
v_nowe_konto.konto_kr_id := p_kr_id;
v_nowe_konto.konto_wlasc_id := p_wlasc_id;

IF bank_pckg_utilities.f_sprawdz_wiek_kl(p_data_urodzenia) >= 18 THEN
    INSERT INTO konta 
    values(
    v_nowe_konto.konto_id,
    v_nowe_konto.konto_nr,
    v_nowe_konto.konto_oszcz_id,
    v_nowe_konto.konto_f_czy_aktywne,
    v_nowe_konto.konto_kr_id,
    v_nowe_konto.konto_wlasc_id);
    COMMIT;
ELSE
    dbms_output.put_line('Tylko pełnoletni użytkownicy mogą zakładać konta.');
END IF;
END proc_zaloz_konto;

-- procedura zmiany statusu konta na nieaktywne, modyfikuje takze informacje
-- o koncie oszczednosciowym oraz odklada je do tabeli konta_hist
PROCEDURE proc_zamknij_konto (p_id IN NUMBER) IS
kontoNieaktywneExc EXCEPTION;
v_czy_wyst_id NUMBER;
BEGIN
    SELECT konto_id into v_czy_wyst_id FROM konta WHERE konto_id = p_id;
    IF v_czy_wyst_id IS NOT NULL
    THEN RAISE kontoNieaktywneExc;
    END IF;
    UPDATE konta SET konto_f_czy_aktywne = 'N' WHERE konto_id = p_id;
    UPDATE konta SET konto_f_czy_aktywne = 'N' WHERE konto_oszcz_id = p_id;
    INSERT INTO konta_hist SELECT * FROM konta WHERE konto_oszcz_id = p_id;
    UPDATE konta SET konto_kr_id = NULL WHERE konto_oszcz_id = p_id;
    UPDATE konta SET konto_wlasc_id = NULL WHERE konto_oszcz_id = p_id;
    COMMIT;
    EXCEPTION
    WHEN kontoNieaktywneExc THEN 
    dbms_output.put_line('To konto zostało już zdezaktywowane. Operacja nie jest dozwolona.');
END proc_zamknij_konto;

END bank_pckg_konto;