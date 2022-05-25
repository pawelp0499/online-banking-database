CREATE TABLE bank.klienci_hist
    (   
    klient_id NUMBER PRIMARY KEY,
    login VARCHAR2(15 CHAR),
    email_old VARCHAR2(75) NOT NULL UNIQUE,
    email_new VARCHAR2(75) NOT NULL UNIQUE,
    kto_modyfikowal varchar2(50 CHAR) DEFAULT user,
    kiedy_modyfikowano DATE default sysdate
    );