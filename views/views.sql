CREATE VIEW v_active_policies 
AS  
    SELECT p.policy_no                         AS "Numer polisy",
           p.total_premium                     AS "Wartość ubezpieczenia",
           To_char(p.sign_date, 'DD/MM/YYYY')  AS "Data podpisania",
           To_char(p.start_date, 'DD/MM/YYYY') AS "Data rozpoczęcia obowiązywania",
           To_char(p.end_date, 'DD/MM/YYYY')   AS "Data zakończenia obowiązywania",
           insurer.fname
           || ' '
           || insurer.lname                    AS "Ubezpieczający",
           insured.fname
           || ' '
           || insured.lname                    AS "Ubezpieczony"
    FROM   policies p
           JOIN clients insurer
             ON p.id_insurer = insurer.id_client
           JOIN clients insured
             ON p.id_insured = insured.id_client
    WHERE  sysdate BETWEEN start_date AND end_date; 