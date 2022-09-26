-- trigger for manage DML operations by bank_vw_klienci_pelny  views
create or replace trigger trg_kl_all
instead of insert or update or delete
on bank_vw_klienci_pelny 
for each row
begin
if inserting then
insert into klienci values(:new.klient_id
                        , :new.imie
                        , :new.nazwisko
                        , :new.plec
                        , :new.login
                        , :new.email
                        , null
                        , 'T'
                        , :new.kl_adres_id
                        , bank_pckg_utilities.f_validate_pesel(:new.klient_id));
insert into adresy values(:new.kl_adres_id
                        , :new.kraj
                        , :new.miasto
                        , :new.ulica
                        , substr(:new.adres_pelny, 1, instr(:new.adres_pelny, '/') - 1)
                        , substr(:new.adres_pelny, instr(:new.adres_pelny, '/') + 1)
                        , :new.kod_pocztowy);
commit;
elsif updating then
update klienci set imie = :new.imie
                 , nazwisko = :new.nazwisko
                 , plec = :new.plec
                 , login = :new.login
                 , email = :new.email
                 , f_czy_aktywny = :new.status
                 , kl_adres_id = :new.kl_adres_id;
update adresy set ulica = :new.ulica
                 , nr_bud = substr(:new.adres_pelny, 1, instr(:new.adres_pelny, '/') - 1)
                 , nr_miesz = substr(:new.adres_pelny, instr(:new.adres_pelny, '/') + 1)
                 , kraj = :new.kraj
                 , miasto = :new.miasto
                 , kod_pocztowy = :new.kod_pocztowy;
commit;
elsif deleting then
delete from klienci where klient_id = :old.klient_id;
commit;
end if;
end;