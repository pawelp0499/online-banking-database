CREATE OR REPLACE VIEW bank.trans_msc_kat_raport ("LOGIN", "DATA", "KATEGORIA", "RAZEM") AS

--Author: Pawel
--Version: 1
--Changes: stworzono widok

WITH
transakcje_w_p AS 
(
	SELECT 
		trns_rodzaj rodzaj,
		kat.nazwa kategoria,
		to_char(data_zaks, 'month yyyy', 'NLS_DATE_LANGUAGE = polish') data,
		trns.trns_kwota kwota,
		kl.login login
	FROM transakcje trns
		left outer join kategorie kat on trns.trns_kat_id = kat.kat_id
		inner join konta knt on knt.konto_id = trns.trns_konto_id
		inner join klienci kl on kl.klient_id = knt.konto_wlasc_id
)
		SELECT 
		login,
		data,
		kategoria,
		NVL(SUM(CASE WHEN rodzaj = 'P' THEN +KWOTA WHEN rodzaj = 'W' THEN -KWOTA ELSE 0 END),0) razem
	FROM transakcje_w_p
	GROUP BY login, data, kategoria;