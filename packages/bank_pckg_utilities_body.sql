create or replace PACKAGE BODY bank_pckg_utilities
IS
/*******************************************************************************
Author: Pawel
Version: 2
Changes: przeciążenie funkcji f_format_rachunek
*******************************************************************************/

-- funkcja wstawia separatory w celu dostosowania do powszechnego formatu nr konta
FUNCTION f_format_rachunek (p_konto_id IN NUMBER) RETURN VARCHAR2 IS
v_rachunek VARCHAR2(40);
BEGIN

    SELECT
        substr(knt.konto_nr, 1,2)||
        ' ' || substr(knt.konto_nr, 3,4) ||
        ' ' || substr(knt.konto_nr, 7,4) ||
        ' ' || substr(knt.konto_nr, 11,4) ||
        ' ' || substr(knt.konto_nr, 15,4) ||
        ' ' || substr(knt.konto_nr, 19,4) ||
        ' ' || substr(knt.konto_nr, 23,4) into v_rachunek
        FROM konta knt join kody_ue kd
        on knt.konto_kr_id = kd.kraj_id
        WHERE knt.konto_id = p_konto_id;
    RETURN v_rachunek;
    EXCEPTION
        when no_data_found then null;
END f_format_rachunek;

-- funkcja formatuje nr konta do międzynarodowego standardu IBAN
FUNCTION f_format_rachunek (p_konto_id IN NUMBER, p_kraj_id IN NUMBER) RETURN VARCHAR2 IS
v_rachunek VARCHAR2(40);
BEGIN

    SELECT
        kd.kraj_kod || ' ' ||
        ' ' || substr(knt.konto_nr, 1,2)||
        ' ' || substr(knt.konto_nr, 3,4) ||
        ' ' || substr(knt.konto_nr, 7,4) ||
        ' ' || substr(knt.konto_nr, 11,4) ||
        ' ' || substr(knt.konto_nr, 15,4) ||
        ' ' || substr(knt.konto_nr, 19,4) ||
        ' ' || substr(knt.konto_nr, 23,4) into v_rachunek
        FROM konta knt join kody_ue kd
        on knt.konto_kr_id = kd.kraj_id
        WHERE knt.konto_id = p_konto_id
        and knt.konto_kr_id = p_kraj_id;
    RETURN v_rachunek;
    EXCEPTION
        when no_data_found then null;
END f_format_rachunek;

END bank_pckg_utilities;