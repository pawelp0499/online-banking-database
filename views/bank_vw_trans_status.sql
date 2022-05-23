CREATE OR REPLACE VIEW bank.bank_vw_trans_status ("TRNS_ID", "DATA_ZAKS", "DATA_REALIZ", "STATUS") AS
    SELECT
        trns.trns_id,  
        trns.data_zaks,
        trns.data_realiz,
        DECODE(trns.data_realiz, NULL, 'NIEZREALIZOWANA', 'ZREALIZOWANA') status
    FROM transakcje trns;