create or replace trigger bank_trg_adr_hist
before update 
on bank.adresy
referencing new as new old as old
for each row

declare
    v_kraj_new adresy.kraj%type := :new.kraj;
    v_miasto_new adresy.miasto%type := :new.miasto;
    v_ulica_new adresy.ulica%type := :new.ulica;
    v_nr_bud_new adresy.nr_bud%type := :new.nr_bud;
    v_nr_miesz_new adresy.nr_miesz%type := :new.nr_miesz;
    v_kod_pocztowy_new adresy.kod_pocztowy%type := :new.kod_pocztowy;

begin

    if :old.kraj = :new.kraj then v_kraj_new := null; end if;
    if :old.miasto = :new.miasto then v_miasto_new := null; end if;
    if :old.ulica = :new.ulica then v_ulica_new := null; end if;
    if :old.nr_bud = :new.nr_bud then v_nr_bud_new := null; end if;
    if :old.nr_miesz = :new.nr_miesz then v_nr_miesz_new := null; end if;
    if :old.kod_pocztowy = :new.kod_pocztowy then v_kod_pocztowy_new := null; end if;

    insert into bank.adresy_hist values
    (       ADR_HIST_ID_SEQ.nextval
        ,   sysdate
        ,   :old.kraj
        ,   :old.miasto
        ,   :old.ulica
        ,   :old.nr_bud
        ,   :old.nr_miesz
        ,   :old.kod_pocztowy
        ,   v_kraj_new
        ,   v_miasto_new
        ,   v_ulica_new
        ,   v_nr_bud_new
        ,   v_nr_miesz_new
        ,   v_kod_pocztowy_new
    );
end;