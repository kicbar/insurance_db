/*this triggers create logs history*/

CREATE OR REPLACE TRIGGER trg_log_client
  AFTER INSERT OR UPDATE OR DELETE
  ON clients
  FOR EACH ROW
DECLARE
  log_action       LOGS.OPERATION%TYPE;
  v_new_value      LOGS.NEW_VALUE%TYPE := 'UNCHANGED';
  v_old_value      LOGS.OLD_VALUE%TYPE := 'UNCHANGED';
  v_id_table       INTEGER  := :new.id_client;
BEGIN
   IF INSERTING THEN
    log_action := 'Insert';
    v_new_value := 'FNAME: |'||:new.fname||'| LNAME: |'||:new.lname||'| PESEL: |'||:new.pesel||'| STATUS: |'||:new.status||'|.';
  ELSIF UPDATING THEN
    log_action := 'Update';
    v_old_value := 'FNAME: |'||:old.fname||'| LNAME: |'||:old.lname||'| PESEL: |'||:old.pesel||'| STATUS: |'||:new.status||'|.';
    v_new_value := 'FNAME: |'||:new.fname||'| LNAME: |'||:new.lname||'| PESEL: |'||:new.pesel||'| STATUS: |'||:new.status||'|.';
  ELSIF DELETING THEN
    log_action := 'Delete';
    v_id_table := :old.id_client;
    v_old_value := 'FNAME: |'||:old.fname||'| LNAME: |'||:old.lname||'| PESEL: |'||:old.pesel||'| STATUS: |'||:new.status||'|.';
  ELSE
    DBMS_OUTPUT.PUT_LINE('This code is not reachable.');
  END IF;
  log_action := log_action || ' on client with id: ' || v_id_table;
  INSERT INTO LOGS (table_name, operation, old_value, new_value) VALUES ('CLIENTS', log_action, v_old_value, v_new_value);
END;
/

CREATE OR REPLACE TRIGGER trg_log_contact
  AFTER INSERT OR UPDATE OR DELETE
  ON contacts
  FOR EACH ROW
DECLARE
  log_action       LOGS.OPERATION%TYPE;
  v_new_value      LOGS.NEW_VALUE%TYPE := 'UNCHANGED';
  v_old_value      LOGS.OLD_VALUE%TYPE := 'UNCHANGED';
  v_id_table       INTEGER  := :new.id_contact;
BEGIN
   IF INSERTING THEN
    log_action := 'Insert';
    v_new_value := 'EMAIL: |'||:new.email||'| MOBILE_PHONE_1: |'||:new.mobile_phone_1||'| MOBILE_PHONE_2: |'||:new.mobile_phone_2||'| STATUS: |'||:new.status||'|.';
  ELSIF UPDATING THEN
    log_action := 'Update';
    v_new_value := 'EMAIL: |'||:new.email||'| MOBILE_PHONE_1: |'||:new.mobile_phone_1||'| MOBILE_PHONE_2: |'||:new.mobile_phone_2||'| STATUS: |'||:new.status||'|.';
    v_old_value := 'EMAIL: |'||:old.email||'| MOBILE_PHONE_1: |'||:old.mobile_phone_1||'| MOBILE_PHONE_2: |'||:old.mobile_phone_2||'| STATUS: |'||:old.status||'|.';
  ELSIF DELETING THEN
    log_action := 'Delete';
    v_id_table := :old.id_contact;        
    v_old_value := 'EMAIL: |'||:old.email||'| MOBILE_PHONE_1: |'||:old.mobile_phone_1||'| MOBILE_PHONE_2: |'||:old.mobile_phone_2||'| STATUS: |'||:old.status||'|.';
  ELSE
    DBMS_OUTPUT.PUT_LINE('This code is not reachable.');
  END IF;
  log_action := log_action || ' on contact with id: ' || v_id_table;
  INSERT INTO LOGS (table_name, operation, old_value, new_value) VALUES ('CONTACTS', log_action, v_old_value, v_new_value);
END;
/

CREATE OR REPLACE TRIGGER trg_log_address
  AFTER INSERT OR UPDATE OR DELETE
  ON addresses
  FOR EACH ROW
DECLARE
  log_action       LOGS.OPERATION%TYPE;
  v_new_value      LOGS.NEW_VALUE%TYPE := 'UNCHANGED';
  v_old_value      LOGS.OLD_VALUE%TYPE := 'UNCHANGED';
  v_id_table       INTEGER  := :new.id_address;
BEGIN
   IF INSERTING THEN
    log_action := 'Insert';
    v_new_value := 'CITY: |'||:new.city||'| STREET: |'||:new.street||'| POSTAL_CODE: |'||:new.postal_code||'| HOME_NUMBER: |'||:new.home_number||'| COUNTRY: |'||:new.country||'| STATUS: |'||:new.status||'|.';
  ELSIF UPDATING THEN
    log_action := 'Update';
    v_new_value := 'CITY: |'||:new.city||'| STREET: |'||:new.street||'| POSTAL_CODE: |'||:new.postal_code||'| HOME_NUMBER: |'||:new.home_number||'| COUNTRY: |'||:new.country||'| STATUS: |'||:new.status||'|.';
    v_old_value := 'CITY: |'||:old.city||'| STREET: |'||:old.street||'| POSTAL_CODE: |'||:old.postal_code||'| HOME_NUMBER: |'||:old.home_number||'| COUNTRY: |'||:old.country||'| STATUS: |'||:new.status||'|.';
  ELSIF DELETING THEN
    log_action := 'Delete';
    v_id_table := :old.id_address;        
    v_old_value := 'CITY: |'||:old.city||'| STREET: |'||:old.street||'| POSTAL_CODE: |'||:old.postal_code||'| HOME_NUMBER: |'||:old.home_number||'| COUNTRY: |'||:old.country||'| STATUS: |'||:new.status||'|.';
  ELSE
    DBMS_OUTPUT.PUT_LINE('This code is not reachable.');
  END IF;
  log_action := log_action || ' on address with id: ' || v_id_table;
  INSERT INTO LOGS (table_name, operation, old_value, new_value) VALUES ('ADDRESSES', log_action, v_old_value, v_new_value);
END;
/