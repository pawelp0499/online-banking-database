--trigger to secure the correct structure of the logger table, allow only for insert and update of log_add_info column - no deleting data or updating others column
create or replace trigger trg_logs
before update or delete
on logs_table
for each row
begin
if updating('log_id')then
raise_application_error(-20001, 'Only the LOG_ADD_INFO column can be modified.');
elsif updating('log_time')then
raise_application_error(-20001, 'Only the LOG_ADD_INFO column can be modified.');
elsif updating('log_source')then
raise_application_error(-20001, 'Only the LOG_ADD_INFO column can be modified.');
elsif updating('log_details')then
raise_application_error(-20001, 'Only the LOG_ADD_INFO column can be modified.');
elsif updating('log_user')then
raise_application_error(-20001, 'Only the LOG_ADD_INFO column can be modified.');
elsif deleting then
raise_application_error(-20002, 'Cannot delete logs from this table.');
end if;
end;