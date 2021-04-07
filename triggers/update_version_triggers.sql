/*this triggers run every time when row in table is updating*/

create or replace trigger version_status before
    update on DCT_STATUSES
    for each row
begin
    if updating('INSERT_DATE') then 
        raise_application_error(-20100, 'Kolumny INSERT_DATE nie można aktualizować! ERROR: '||SQLERRM||' '||SQLCODE);
    end if;    
    :new.version := nvl(:old.version,1) + 1;
    :new.update_date := SYSDATE;
end;
/

create or replace trigger version_policy_type before
    update on DCT_POLICY_TYPES
    for each row
begin
    if updating('INSERT_DATE') then 
        raise_application_error(-20100, 'Kolumny INSERT_DATE nie można aktualizować! ERROR: '||SQLERRM||' '||SQLCODE);
    end if;    
    :new.version := nvl(:old.version,1) + 1;
    :new.update_date := SYSDATE;
end;
/

create or replace trigger version_client before
    update on CLIENTS
    for each row
begin
    if updating('INSERT_DATE') then 
        raise_application_error(-20100, 'Kolumny INSERT_DATE nie można aktualizować! ERROR: '||SQLERRM||' '||SQLCODE);
    end if;    
    :new.version := nvl(:old.version,1) + 1;
    :new.update_date := SYSDATE;
end;
/

create or replace trigger version_contact before
    update on CONTACTS
    for each row
begin
    if updating('INSERT_DATE') then 
        raise_application_error(-20100, 'Kolumny INSERT_DATE nie można aktualizować! ERROR: '||SQLERRM||' '||SQLCODE);
    end if;    
    :new.version := nvl(:old.version,1) + 1;
    :new.update_date := SYSDATE;
end;
/

create or replace trigger version_address before
    update on ADDRESSES
    for each row
begin
    if updating('INSERT_DATE') then 
        raise_application_error(-20100, 'Kolumny INSERT_DATE nie można aktualizować! ERROR: '||SQLERRM||' '||SQLCODE);
    end if;    
    :new.version := nvl(:old.version,1) + 1;
    :new.update_date := SYSDATE;
end;
/

create or replace trigger policy_address before
    update on POLICIES
    for each row
begin
    if updating('INSERT_DATE') then 
        raise_application_error(-20100, 'Kolumny INSERT_DATE nie można aktualizować! ERROR: '||SQLERRM||' '||SQLCODE);
    end if;    
    :new.version := nvl(:old.version,1) + 1;
    :new.update_date := SYSDATE;
end;
/