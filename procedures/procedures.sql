CREATE OR REPLACE procedure pr_check_policy_date(v_id_policy IN INTEGER, v_claim_date date)
IS 
    CURSOR c_policy_search 
    IS
        SELECT *
        FROM policies
        WHERE id_policy = v_id_policy
        AND status = 1;
    v_temp_policy   policies%rowtype;
    v_flag_out boolean;
BEGIN 
    DBMS_OUTPUT.PUT_LINE('Data roszczenia: ' || v_claim_date);
    OPEN c_policy_search;
    FETCH c_policy_search INTO v_temp_policy;
    DBMS_OUTPUT.PUT_LINE('Polisa: ' || v_temp_policy.policy_no || ', data rozpoczecia obowiazywania ' || v_temp_policy.start_date);
    DBMS_OUTPUT.PUT_LINE('Polisa: ' || v_temp_policy.policy_no || ', data zakończenia obowiazywania ' || v_temp_policy.end_date);
		IF c_policy_search%found THEN
			IF (v_claim_date BETWEEN v_temp_policy.start_date AND v_temp_policy.end_date) THEN
                DBMS_OUTPUT.PUT_LINE('Data roszczenia jest poprawna dla wskazanej polisy!');
            ELSE
                raise_application_error(-20160, 'Data roszczenie nie znajduje się w okresie obowiazywania wskazanej polisy!');
            END IF;
		ELSE
            raise_application_error(-20150, 'Nie znaleziono wskazanej polisy!');
		END IF;
    CLOSE c_policy_search;
END pr_check_policy_date; 
/

CREATE OR REPLACE PROCEDURE pr_insert_log(v_table_name IN VARCHAR2, v_operation IN VARCHAR2, v_old_value IN VARCHAR2, v_new_value IN VARCHAR2)
IS 
BEGIN 
    INSERT INTO LOGS (table_name, operation, old_value, new_value) VALUES (v_table_name, v_operation, v_old_value, v_new_value);
    DBMS_OUTPUT.PUT_LINE('Dodano log do tabeli: ' || v_table_name);
END pr_insert_log; 
/