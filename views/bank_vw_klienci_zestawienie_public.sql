CREATE OR REPLACE VIEW bank.bank_vw_trans_status ("TRNS_ID", "DATA_ZAKS", "DATA_REALIZ", "STATUS") AS
--Author: Pawel
--Version: 1
--Changes:
    SELECT
			trns.trns_id
		,	trns.data_zaks
		,	trns.data_realiz
		,	DECODE(trns.data_realiz, NULL, 'NIEZREALIZOWANA', 'ZREALIZOWANA') status
    FROM transakcje trns
	WITH READ ONLY;
	
	
create or replace view BANK.BANK_VW_KLIENCI_ZESTAWIENIE_PUBLIC as 
	SELECT
		  klient_id
		, imie
		, nazwisko
		, plec
		, login
		, email
		, nvl(regexp_replace( pesel,
		  '(^\d{6})(.*)(\d{1}$)', '\1**********\3' ), '***********') PESEL
		, ulica || ' ' || nr_miesz || '/' || nr_bud || ' ' || kod_pocztowy || ', ' || miasto ADRES
	FROM
	  klienci kl inner join adresy adr on kl.kl_adres_id = adr.adres_id
	WHERE kl.f_czy_aktywny = 'T' and exists (select trns.trns_id 
											from transakcje trns inner join konta knt
											on trns.trns_konto_id = knt.konto_id 
											where knt.konto_wlasc_id = klient_id)
WITH READ ONLY;

create public synonym BANK_VW_KLIENCI_ZESTAWIENIE_PUBLIC for BANK.BANK_VW_KLIENCI_ZESTAWIENIE_PUBLIC;
create public synonym KLIENCI_ZESTAWIENIE for BANK.BANK_VW_KLIENCI_ZESTAWIENIE_PUBLIC;

/**
The current list of customers for whom any transaction was found, with masked data sensitive as pesel.
In the future it will be available from the level of other users of database when the functionality is developed.
**/