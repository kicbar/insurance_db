/*this trigger runs every time when row in table is updating*/

create or replace trigger version_status before
    update on DCT_STATUSES
    for each row
begin
    if updating('INSERT_DATE') then 
        raise_application_error(-20100, 'Kolumny INSERT_DATE nie można aktualizować! ERROR: '||SQLERRM||' '||sqlcode);
    end if;    
    :new.version := nvl(:old.version,1) + 1;
    :new.update_date := SYSDATE;
end;
/