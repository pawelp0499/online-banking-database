--trigger to secure the correct structure of the customers historical table, allow only for inserting
create or replace trigger trg_kl_hist
before update or delete 
on klienci_hist
for each row
begin
if updating then
raise_application_error(-20003, 'Cannot modify any data in this table.');
elsif deleting then
raise_application_error(-20004, 'Cannot delete any data from this table.');
end if;
end;