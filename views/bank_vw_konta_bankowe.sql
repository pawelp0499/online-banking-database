CREATE OR REPLACE VIEW bank.bank_vw_konta_bankowe ("KONTO_ID", "RODZAJ", "IBAN", "KLIENT") AS
--Author: Pawel
--Version: 1
--Changes: dodano kolumnę IBAN

    SELECT
        knt.konto_id,
        'GŁÓWNE' rodzaj,
        bank_pckg_utilities.f_podaj_iban(knt.konto_id) iban,
        kl.imie || ' ' || kl.nazwisko klient
    FROM kody_ue kr
        RIGHT OUTER JOIN konta knt on kr.kraj_id = knt.konto_kr_id
        RIGHT OUTER JOIN klienci kl on kl.klient_id = knt.konto_wlasc_id
    WHERE knt.KONTO_OSZCZ_ID IS NULL

    UNION

    SELECT
        knt.konto_id,
        'OSZCZĘDNOŚCIOWE' rodzaj,
        bank_pckg_utilities.f_podaj_iban(knt.konto_id) iban,
        kl.imie || ' ' || kl.nazwisko klient
    FROM kody_ue kr
        RIGHT OUTER JOIN konta knt on kr.kraj_id = knt.konto_kr_id
        RIGHT OUTER JOIN klienci kl on kl.klient_id = knt.konto_wlasc_id
    WHERE knt.KONTO_OSZCZ_ID IS NOT NULL;
    
