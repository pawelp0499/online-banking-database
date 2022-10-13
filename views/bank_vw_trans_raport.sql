CREATE OR REPLACE VIEW "BANK"."BANK_VW_TRANS_RAPORT" (
    "RP_LOGIN",
    "RP_MSC",
    "RP_ROK",
    "RP_KAT",
    "RP_SP_PLAT",
    "RP_RAZEM",
    "RP_KAT_MSC_ROK_RAZEM",
    "RP_UDZIAL_W_KAT_OKRES",
    "RP_SP_PLAT_MSC_ROK_RAZEM",
    "RP_UDZIAL_W_SP_PLAT_OKRES"
) AS 
--Author: Pawel
--Version: 5
--Changes: to_char(coalesce(trns.data_realiz, trns.data_zaks), 'mon')
    WITH transakcje_all AS (
        SELECT
            trns.trns_id,
            kat.kat_id,
            trns.trns_rodzaj                                            rodzaj,
            kat.nazwa                                                   kategoria,
            trns.trns_sp_plat                                           sp_plat,
            to_char(coalesce(trns.data_realiz, trns.data_zaks), 'mon')  msc,
            to_char(coalesce(trns.data_realiz, trns.data_zaks), 'yyyy') rok,
            trns.trns_kwota                                             kwota,
            kl.login                                                    login
        FROM
            transakcje trns
            LEFT OUTER JOIN kategorie  kat ON trns.trns_kat_id = kat.kat_id
            INNER JOIN konta      knt ON knt.konto_id = trns.trns_konto_id
            INNER JOIN klienci    kl ON kl.klient_id = knt.konto_wlasc_id
    ), trns_sum AS (
        SELECT
            login                                                                         rp_login,
            msc                                                                           rp_msc,
            rok                                                                           rp_rok,
            kategoria                                                                     rp_kat,
            decode(sp_plat, 'K', 'Karta', 'A', 'Aplikacja',
                   'S', 'Strona internetowa')                                             rp_sp_plat,
            nvl(SUM(
                CASE
                    WHEN rodzaj = 'P' THEN
                        + kwota
                    WHEN rodzaj = 'W' THEN
                        - kwota
                    ELSE
                        0
                END
            ), 0)                                                                         rp_razem,
            nvl(bank_pckg_transakcja.f_sum_trns_wg_kat_msc_rok(kat_id, msc, rok), 0)      rp_kat_msc_rok_razem,
            nvl(bank_pckg_transakcja.f_sum_trns_wg_sp_plat_msc_rok(sp_plat, msc, rok), 0) rp_sp_plat_msc_rok_razem
        FROM
            transakcje_all
        GROUP BY
            kat_id,
            login,
            msc,
            rok,
            kategoria,
            sp_plat
        HAVING
            nvl(SUM(
                CASE
                    WHEN rodzaj = 'P' THEN
                        + kwota
                    WHEN rodzaj = 'W' THEN
                        - kwota
                    ELSE
                        0
                END
            ), 0) <> 0
        ORDER BY
            rok,
            msc
    ), trns_sum_procent AS (
        SELECT
            trnss.*,
            bank_pckg_utilities.f_daj_procent(rp_razem, rp_kat_msc_rok_razem)     AS rp_udzial_w_kat_okres,
            bank_pckg_utilities.f_daj_procent(rp_razem, rp_sp_plat_msc_rok_razem) AS rp_udzial_w_sp_plat_okres
        FROM
            trns_sum trnss
    )
    SELECT
        *
    FROM
        trns_sum_procent;