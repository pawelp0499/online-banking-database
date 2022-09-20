	create table bank.logs_table
	(
		log_id number(10) unique not null
	, 	log_time timestamp default sysdate not null
	, 	log_source varchar2(400 CHAR) not null
	, 	log_details clob not null
	,	log_add_info varchar2(400 CHAR) default null
	, 	log_user varchar2(30 CHAR) default user not null
	);
    
--comments
COMMENT ON TABLE bank.logs_table IS 'Tabela przechowująca logi.';
COMMENT ON COLUMN bank.logs_table.log_id IS 'LOG ID';
COMMENT ON COLUMN bank.logs_table.log_time IS 'Data i czas zalogowania.';
COMMENT ON COLUMN bank.logs_table.log_source IS 'Źródło logu';
COMMENT ON COLUMN bank.logs_table.log_details IS 'LOG MESSAGE';
COMMENT ON COLUMN bank.logs_table.log_add_info IS 'ADDITIONAL MSG';
COMMENT ON COLUMN bank.logs_table.log_user IS 'Użytkownik';

--synonym
CREATE PUBLIC SYNONYM logs_table
FOR bank.logs_table;
