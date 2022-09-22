create or replace PACKAGE bank_pckg_transakcja IS

--procedura zmieniajaca status transakcji z niezrealizowanej na zrealizowana
PROCEDURE proc_zmien_status(p_trns_id NUMBER);

--procedura zapisujaca logi transakcji dla wybranych TRNS_ID, pozwalajaca przechowywac tylko aktualne szczegoly transakcji
PROCEDURE proc_zaktualizuj_transaction_logs (p_id_first number, p_id_last number);

/* procedura nadpisujaca konto oszczednosciowe odpowiadajacym mu kontem glownym
   w przypadku odnotowania platnosci */
PROCEDURE proc_pobierz_konto_glowne;

--procedura generuje i przechowuje zestawienie transakcji o najwyższej kwocie według wprowadzonych przez użytkownika parametrów msc, rok, ilosc pozycji
PROCEDURE proc_daj_top_transakcji(p_miesiac number, p_rok number, p_top integer);

--funkcja wyliczajaca sume transakcji w danej kategorii na dany miesiac i rok
FUNCTION f_sum_trns_wg_kat_msc_rok (p_kat_id number, p_msc varchar2, p_rok number) return number;

--funkcja wyliczajaca sume transakcji o danym sposobie platnosci na dany miesiac i rok
FUNCTION f_sum_trns_wg_sp_plat_msc_rok (p_sp_plat varchar2, p_msc varchar2, p_rok number) return number;

END bank_pckg_transakcja;