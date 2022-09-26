--trigger to secure the correct structure of the transactions historical table, allow only for inserting
create or replace trigger trg_trns_hist
before update or delete 
on transakcje_logs
for each row
begin
if updating then
raise_application_error(-20003, 'Cannot modify any data in this table.');
elsif deleting then
raise_application_error(-20004, 'Cannot delete any data from this table.');
end if;
end;