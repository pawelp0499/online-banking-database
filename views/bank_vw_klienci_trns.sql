CREATE OR REPLACE VIEW bank.bank_vw_klienci_trns ("KLIENT_ID", "IMIE", "NAZWISKO", "LOGIN", "EMAIL", "STATUS", "PLEC", "KL_ADRES_ID", "ULICA", "ADRES_PELNY", "KOD_POCZTOWY", "MIASTO", "KRAJ") AS
--Author: Pawel
--Version: 1
--Changes: 

    SELECT 
			kl.klient_id
		, 	kl.imie
		,	kl.nazwisko
		,	kl.login
		, 	kl.email
		, 	DECODE(kl.f_czy_aktywny, 'T', 'Aktywny', 'Nieaktywny') status
		,	kl.plec
        ,   adr.adres_id
		, 	adr.ulica
		,	adr.nr_bud || '/' || adr.nr_miesz
		,	adr.kod_pocztowy
		,	adr.miasto
		,	adr.kraj
    FROM klienci kl inner join adresy adr
        on kl.kl_adres_id = adr.adres_id
    WHERE EXISTS 
        (select null 
         from transakcje trns inner join konta knt on knt.konto_id = trns.trns_konto_id
         where knt.konto_wlasc_id = kl.klient_id);
    
    
--comments 
COMMENT ON TABLE bank.bank_vw_klienci_trns IS 'Perspektywa z informacjami o klientach z odnotowanymi transakcjami.';
COMMENT ON COLUMN bank.bank_vw_klienci_trns.adres_pelny IS 'Kompletny adres - ulica, numer budynku, numer mieszkania, kod pocztowy klienta.';
    
	
--synonym
CREATE PUBLIC SYNONYM bank_vw_klienci_trns
FOR bank.bank_vw_klienci_trns;
