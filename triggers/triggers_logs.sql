/*this triggers create logs history*/

CREATE OR REPLACE TRIGGER trg_log_client
  AFTER INSERT OR UPDATE OR DELETE
  ON clients
  FOR EACH ROW
BEGIN
  IF INSERTING THEN
    pr_insert_log('CLIENTS', 
                  'Insert on client with id: ' || :new.id_client, 
                  'UNCHANGED',
                  'FNAME: |'||:new.fname||'| LNAME: |'||:new.lname||'| PESEL: |'||:new.pesel||'| STATUS: |'||:new.status||'|.');
  ELSIF UPDATING THEN
    pr_insert_log('CLIENTS', 
                  'Update on client with id: ' || :new.id_client, 
                  'FNAME: |'||:old.fname||'| LNAME: |'||:old.lname||'| PESEL: |'||:old.pesel||'| STATUS: |'||:new.status||'|.',
                  'FNAME: |'||:new.fname||'| LNAME: |'||:new.lname||'| PESEL: |'||:new.pesel||'| STATUS: |'||:new.status||'|.');
  ELSIF DELETING THEN
    pr_insert_log('CLIENTS', 
                  'Delete on client with id: ' || :old.id_client, 
                  'FNAME: |'||:old.fname||'| LNAME: |'||:old.lname||'| PESEL: |'||:old.pesel||'| STATUS: |'||:new.status||'|.',
                  'UNCHANGED');
  ELSE
    DBMS_OUTPUT.PUT_LINE('This code is not reachable.');
  END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_log_contact
  AFTER INSERT OR UPDATE OR DELETE
  ON contacts
  FOR EACH ROW
BEGIN
  IF INSERTING THEN
    pr_insert_log('CONTACTS', 
                  'Insert on contact with id: ' || :new.id_contact, 
                  'UNCHANGED',
                  'EMAIL: |'||:new.email||'| MOBILE_PHONE_1: |'||:new.mobile_phone_1||'| MOBILE_PHONE_2: |'||:new.mobile_phone_2||'| STATUS: |'||:new.status||'|.');
  ELSIF UPDATING THEN
    pr_insert_log('CONTACTS', 
                  'Update on contact with id: ' || :new.id_contact,
                  'EMAIL: |'||:old.email||'| MOBILE_PHONE_1: |'||:old.mobile_phone_1||'| MOBILE_PHONE_2: |'||:old.mobile_phone_2||'| STATUS: |'||:old.status||'|.', 
                  'EMAIL: |'||:new.email||'| MOBILE_PHONE_1: |'||:new.mobile_phone_1||'| MOBILE_PHONE_2: |'||:new.mobile_phone_2||'| STATUS: |'||:new.status||'|.');
  ELSIF DELETING THEN
    pr_insert_log('CONTACTS', 
                  'Delete on contact with id: ' || :old.id_contact,
                  'EMAIL: |'||:old.email||'| MOBILE_PHONE_1: |'||:old.mobile_phone_1||'| MOBILE_PHONE_2: |'||:old.mobile_phone_2||'| STATUS: |'||:old.status||'|.', 
                  'UNCHANGED');    
  ELSE
    DBMS_OUTPUT.PUT_LINE('This code is not reachable.');
  END IF;
END;

CREATE OR REPLACE TRIGGER trg_log_address
  AFTER INSERT OR UPDATE OR DELETE
  ON addresses
  FOR EACH ROW
BEGIN
  IF INSERTING THEN
    pr_insert_log('ADDRESSES',
                   'Insert on address with id: ' || :new.id_address,
                   'UNCHANGED',
                   'CITY: |'||:new.city||'| STREET: |'||:new.street||'| POSTAL_CODE: |'||:new.postal_code||'| HOME_NUMBER: |'||:new.home_number||'| COUNTRY: |'||:new.country||'| STATUS: |'||:new.status||'|.');
  ELSIF UPDATING THEN
    pr_insert_log('ADDRESSES',
                  'Update on address with id: ' || :new.id_address,
                  'CITY: |'||:old.city||'| STREET: |'||:old.street||'| POSTAL_CODE: |'||:old.postal_code||'| HOME_NUMBER: |'||:old.home_number||'| COUNTRY: |'||:old.country||'| STATUS: |'||:new.status||'|.',
                  'CITY: |'||:new.city||'| STREET: |'||:new.street||'| POSTAL_CODE: |'||:new.postal_code||'| HOME_NUMBER: |'||:new.home_number||'| COUNTRY: |'||:new.country||'| STATUS: |'||:new.status||'|.');
  ELSIF DELETING THEN
    pr_insert_log('ADDRESSES',
                  'Delete on address with id: ' || :old.id_address,
                  'CITY: |'||:old.city||'| STREET: |'||:old.street||'| POSTAL_CODE: |'||:old.postal_code||'| HOME_NUMBER: |'||:old.home_number||'| COUNTRY: |'||:old.country||'| STATUS: |'||:new.status||'|.',
                  'UNCHANGED');
  ELSE
    DBMS_OUTPUT.PUT_LINE('This code is not reachable.');
  END IF;
END;
/