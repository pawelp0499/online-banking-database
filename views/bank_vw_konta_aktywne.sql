CREATE OR REPLACE VIEW bank.bank_vw_konta_aktywne ("KONTO_ID", "RODZAJ", "IBAN", "KLIENT", "CZY_OPERACJE") AS
--Author: Pawel
--Version: 2
--Changes: zmieniono kolumnę IBAN
 SELECT
        knt.konto_id konto_id,
        'GŁÓWNE' rodzaj,
        bank_pckg_utilities.f_format_rachunek(knt.konto_id, knt.konto_kr_id) iban,
        kl.imie || ' ' || kl.nazwisko klient,
        CASE WHEN trns.trns_kwota IS NULL THEN 'Nie' ELSE 'Tak' END czy_operacje
    FROM kody_ue kr
        RIGHT OUTER JOIN konta knt on kr.kraj_id = knt.konto_kr_id
        RIGHT OUTER JOIN klienci kl on kl.klient_id = knt.konto_wlasc_id
        LEFT OUTER JOIN transakcje trns on trns.trns_konto_id = knt.konto_id
    WHERE knt.KONTO_OSZCZ_ID IS NULL AND knt.konto_f_czy_aktywne = 'T'
    UNION

    SELECT
        knt.konto_id konto_id,
        'OSZCZĘDNOŚCIOWE' rodzaj,
        bank_pckg_utilities.f_format_rachunek(knt.konto_id, knt.konto_kr_id) iban,
        kl.imie || ' ' || kl.nazwisko klient,
        CASE WHEN trns.trns_kwota IS NULL THEN 'Nie' ELSE 'Tak' END czy_operacje
    FROM kody_ue kr
        RIGHT OUTER JOIN konta knt on kr.kraj_id = knt.konto_kr_id
        RIGHT OUTER JOIN klienci kl on kl.klient_id = knt.konto_wlasc_id
        LEFT  OUTER JOIN transakcje trns on trns.trns_konto_id = knt.konto_id
    WHERE knt.KONTO_OSZCZ_ID IS NOT NULL AND knt.konto_f_czy_aktywne = 'T';
	
	
--comments
COMMENT ON COLUMN bank.bank_vw_konta_aktywne.rodzaj IS 'Znacznik czy konto główne czy oszczędnościowe.';
COMMENT ON COLUMN bank.bank_vw_konta_aktywne.iban IS 'Numer kontaw formacie IBAN.';
COMMENT ON MATERIALIZED VIEW bank.bank_vw_konta_aktywne IS 'Perspektywa z danymi na temat aktywnych kont bankowych.';
COMMENT ON COLUMN bank.bank_vw_konta_aktywne.czy_operacje IS 'Czy odnotowano transakcje dla tego konta.';
	
--synonyms
CREATE PUBLIC SYNONYM bank_vw_konta_aktywne FOR
bank.bank_vw_konta_aktywne;