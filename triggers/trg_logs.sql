--trigger to secure the correct structure of the logger table, allow only for insert - not update and delete data
create or replace trigger trg_logs
before update or delete
on logs_table
for each row
begin
if updating then
raise_application_error(-20001, 'Brak opcji modyfikowania logów.');
elsif deleting then
raise_application_error(-20002, 'Brak opcji usuwania logów.');
end if;
end;