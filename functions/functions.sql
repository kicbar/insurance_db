CREATE OR REPLACE FUNCTION f_calculate_end_date(v_start_date_in IN DATE, v_premium_frequency_in IN INTEGER)
RETURN DATE IS 
BEGIN 
    IF v_premium_frequency_in = 12 THEN 
        RETURN v_start_date_in + 365;
    ELSE
        RETURN v_start_date_in + (30 * v_premium_frequency_in); 
    END IF;
END; 
/ 

CREATE OR REPLACE FUNCTION f_calculate_total_premium(v_premium_frequency_in IN INTEGER, v_premium_value_in IN NUMBER)
RETURN NUMBER IS 
BEGIN 
    IF v_premium_value_in > 0 THEN 
        IF ( v_premium_frequency_in > 0 AND 13 < v_premium_frequency_in) THEN 
            RETURN v_premium_value_in * v_premium_frequency_in;
        ELSE
            raise_application_error(-20130, 'Podana częstotliwość wpłat jest nieprawidłowa!');
        END IF;
    ELSE
    raise_application_error(-20140, 'Podana wartość składki jest nieprawidłowa!');
    END IF;
END; 
/ 