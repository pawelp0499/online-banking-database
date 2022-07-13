--trigger for storing history of customer e-mail changes
CREATE OR REPLACE TRIGGER trg_kl_upd_hist
BEFORE UPDATE OF email on klienci
FOR EACH ROW
BEGIN
INSERT INTO klienci_hist 
	(
		klient_id
	, 	login
	, 	email_old
	, 	email_new
	) 
VALUES 
	(
		:NEW.klient_id
	,	:NEW.login
	,	:OLD.email
	,	:NEW.email
	);
END;