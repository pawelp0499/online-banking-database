create or replace PACKAGE BODY bank_pckg_utilities
IS
/*******************************************************************************
Author: Pawel
Version: 1
Changes: dodano definicję funkcji f_podaj_iban
*******************************************************************************/

-- funkcja do formatu nr konta do standardu IBAN
FUNCTION f_podaj_iban (v_konto_id IN NUMBER) RETURN VARCHAR2 IS
v_iban VARCHAR2(40);
BEGIN

    SELECT
        kd.kraj_kod || ' ' ||
        ' ' || substr(knt.konto_nr, 1,2)||
        ' ' || substr(knt.konto_nr, 3,4) ||
        ' ' || substr(knt.konto_nr, 7,4) ||
        ' ' || substr(knt.konto_nr, 11,4) ||
        ' ' || substr(knt.konto_nr, 15,4) ||
        ' ' || substr(knt.konto_nr, 19,4) ||
        ' ' || substr(knt.konto_nr, 23,4) into v_iban
        FROM konta knt join kody_ue kd
        on knt.konto_kr_id = kd.kraj_id
        WHERE knt.konto_id = v_konto_id;
    RETURN v_iban;
    EXCEPTION
        when no_data_found then null;
END f_podaj_iban;

END bank_pckg_utilities;