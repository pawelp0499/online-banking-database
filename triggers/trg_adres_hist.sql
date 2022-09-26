--trigger to secure the correct structure of the adresses historical table, allow only for inserting
create or replace trigger trg_adres_hist
before update or delete 
on adresy_hist
for each row
begin
if updating then
raise_application_error(-20003, 'Cannot modify any data in this table.');
elsif deleting then
raise_application_error(-20004, 'Cannot delete any data from this table.');
end if;
end;