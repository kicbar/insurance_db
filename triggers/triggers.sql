create or replace trigger trg_policies before
    insert or update on policies
    for each row
begin
    if (:new.sign_date >= :new.start_date) then 
        raise_application_error(-20110, 'Data rozpoczecia obowiazywania musi byc wieksza od daty podpisania!');
    end if;
    
    :new.end_date := f_calculate_end_date(:new.start_date, :new.premium_frequency);
    :new.total_premium := f_calculate_total_premium(:new.premium_frequency, :new.premium_value);
end;
/