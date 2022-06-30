CREATE OR REPLACE VIEW bank.bank_vw_trans_raport 	("LOGIN", "MSC", "ROK", "KATEGORIA", "RAZEM") AS 
--Author: Pawel
--Version: 3
--Changes: having <> 0
	WITH
	transakcje_w_p AS 
	(
	SELECT 
			trns_rodzaj rodzaj
		,	kat.nazwa kategoria
		,	to_char(data_zaks, 'month', 'NLS_DATE_LANGUAGE = polish') msc
		,	to_char(data_zaks, 'yyyy', 'NLS_DATE_LANGUAGE = polish') rok
		,	trns.trns_kwota kwota
		,	kl.login login
	FROM transakcje trns
		left outer join kategorie kat 
			on trns.trns_kat_id = kat.kat_id
		inner join konta knt 
			on knt.konto_id = trns.trns_konto_id
		inner join klienci kl 
			on kl.klient_id = knt.konto_wlasc_id
	WHERE trns.data_realiz IS NOT NULL
	)
	SELECT 
	login
	,	msc
	,	rok
	,	kategoria
	,	NVL(SUM(CASE WHEN rodzaj = 'P' THEN +KWOTA WHEN rodzaj = 'W' THEN -KWOTA ELSE 0 END),0) razem
	FROM transakcje_w_p
	GROUP BY login, msc, rok, kategoria
	HAVING NVL(SUM(CASE WHEN rodzaj = 'P' THEN +KWOTA WHEN rodzaj = 'W' THEN -KWOTA ELSE 0 END),0) <> 0;