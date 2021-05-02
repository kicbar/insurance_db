CREATE VIEW v_active_policies 
AS  
    SELECT p.policy_no                         AS "Numer polisy",
           pt.description                      AS "Rodzaj polisy",
           p.policy_value              AS "Wartość ubezpieczenia",
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
             ON p.id_insurer = insurer.id_client AND insurer.status = 1
           JOIN clients insured
             ON p.id_insured = insured.id_client AND insured.status = 1
           JOIN dct_policy_types pt
             ON p.id_policy_type = pt.id_policy_type AND pt.status = 1
    WHERE  sysdate BETWEEN start_date AND end_date and p.status = 1; 

CREATE VIEW v_clients
AS
    SELECT c.fname || ' ' || c.lname      AS "Imię i nazwisko",
         CASE
           WHEN cn.email IS NULL THEN 'Brak Danych'
           ELSE cn.email
         END                              AS "Adres Email",
         CASE
           WHEN cn.mobile_phone_1 IS NULL THEN 'Brak Danych'
           ELSE cn.mobile_phone_1
         END                              AS "Numer telefonu 1 ",
         CASE
           WHEN cn.mobile_phone_2 IS NULL THEN 'Brak Danych'
           ELSE cn.mobile_phone_2
         END                              AS "Numer telefonu 2",
         CASE
           WHEN a.apartment_number IS NULL THEN a.city || ' ul. ' || a.street || ' ' || a.home_number
           ELSE a.city || ' ul. ' || a.street || ' ' || a.home_number || '/' || a.apartment_number
         END                              AS "Adres",
         at.address_name                  AS "Typ adresu"
    FROM   clients c
         LEFT JOIN contacts cn
                ON cn.id_client = c.id_client AND cn.status = 1
         LEFT JOIN addresses a
                ON a.id_client = c.id_client AND a.status = 1
         JOIN dct_address_types at
           ON at.id_address_type = a.id_address_type AND at.status = 1
    WHERE  c.status = 1; 