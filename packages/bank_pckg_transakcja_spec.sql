create or replace PACKAGE bank_pckg_transakcja IS

PROCEDURE proc_zmien_status(p_trns_id NUMBER);

PROCEDURE proc_zaktualizuj_transaction_logs (p_id_first number, p_id_last number);

PROCEDURE proc_pobierz_konto_glowne;

PROCEDURE proc_daj_top_transakcji(p_miesiac number, p_rok number, p_top integer);

FUNCTION f_sum_trns_wg_kat_msc_rok (p_kat_id number, p_msc varchar2, p_rok number) return number;

FUNCTION f_sum_trns_wg_sp_plat_msc_rok (p_sp_plat varchar2, p_msc varchar2, p_rok number) return number;

END bank_pckg_transakcja;