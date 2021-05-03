insert into DCT_STATUSES(id_status, status_name) values(0, 'INACTIVE');
insert into DCT_STATUSES(id_status, status_name) values(1, 'ACTIVE');
insert into DCT_STATUSES(id_status, status_name) values(8, 'DELETED');
insert into DCT_STATUSES(id_status, status_name) values(9, 'INVALID');

insert into DCT_POLICY_TYPES (ID_POLICY_TYPE, POLICY_TYPE, SHORT_NAME, DESCRIPTION) VALUES (1, 'Polisa na życie', 'LIFE_P', 'Polisa ubezpieczeniowa życiowa, indywidualna na życie.');
insert into DCT_POLICY_TYPES (ID_POLICY_TYPE, POLICY_TYPE, SHORT_NAME, DESCRIPTION) VALUES (2, 'Polisa grupowa', 'LIFE_G', 'Polisa ubezpieczeniowa życiowa, grupowa na życie.');
insert into DCT_POLICY_TYPES (ID_POLICY_TYPE, POLICY_TYPE, SHORT_NAME, DESCRIPTION) VALUES (3, 'Polisa turystyczna', 'TOUR_P', 'Polisa ubezpieczeniowa życiowa, ubezpieczenie podczas podróży.');
insert into DCT_POLICY_TYPES (ID_POLICY_TYPE, POLICY_TYPE, SHORT_NAME, DESCRIPTION) VALUES (4, 'Polisa rodzinna', 'FAMI_P', 'Polisa ubezpieczeniowa życiowa, ubezpieczenie dla członków rodziny.');
insert into DCT_POLICY_TYPES (ID_POLICY_TYPE, POLICY_TYPE, SHORT_NAME, DESCRIPTION) VALUES (5, 'Polisa komunikacyjna', 'MOTO_P', 'Polisa ubezpieczeniowa życiowa, ubzpieczenie komunikacyjne.');
insert into DCT_POLICY_TYPES (ID_POLICY_TYPE, POLICY_TYPE, SHORT_NAME, DESCRIPTION) VALUES (6, 'Polisa studencka', 'STUD_P', 'Polisa ubezpieczeniowa życiowa, dla uczniów i studentów.');

insert into dct_address_types (id_address_type, address_name) VALUES (1, 'Zamieszkania' ); 
insert into dct_address_types (id_address_type, address_name) VALUES (2, 'Zameldowania'); 
insert into dct_address_types (id_address_type, address_name) VALUES (3, 'Korespodencyjny'); 
insert into dct_address_types (id_address_type, address_name) VALUES (4, 'Inne'); 

insert into dct_riders (id_rider, rider_name, rider_description) values (1, 'Z-1', 'Uszkodzenie ciała w wyniku wypadku komunikacyjnego.');
insert into dct_riders (id_rider, rider_name, rider_description) values (2, 'S-1', 'Śmierć ubezpieczonego.');
insert into dct_riders (id_rider, rider_name, rider_description) values (3, 'S-2', 'Śmierć osoby bliskiej ubezpieczonego.');
insert into dct_riders (id_rider, rider_name, rider_description) values (4, 'C-1', 'Zachorowanie na chorobę przewlekłą.');
insert into dct_riders (id_rider, rider_name, rider_description) values (5, 'C-2', 'Zachorowanie na chorobę nieuleczalną.');
insert into dct_riders (id_rider, rider_name, rider_description) values (6, 'A-1', 'Pobyt ubezpieczonego w szpitalu.');

insert into clients(fname, lname, pesel) values('Maciej', 'Makowski', '14052743387');
insert into contacts(email, mobile_phone_1, mobile_phone_2, id_client) values('mako@wp.pl', '611-222-033', '', SEQ_CLIENT.currval);
insert into addresses(city, postal_code, street, home_number, id_client, id_address_type) values('Warszawa', '01-485', 'Marszałkowska', '3B', SEQ_CLIENT.currval, 1);
insert into addresses(city, postal_code, street, home_number, apartment_number, id_client, id_address_type) values('Warszawa', '01-485', 'Jana Pawła', '112', '8', SEQ_CLIENT.currval, 2);
insert into clients(fname, lname, pesel) values('Julia', 'Wrońska', '52011369892');
insert into contacts(email, mobile_phone_1, mobile_phone_2, id_client) values('jullaw@gmail.pl', '512-232-962', '874-965-552', SEQ_CLIENT.currval);
insert into addresses(city, postal_code, street, home_number, apartment_number, id_client, id_address_type) values('Biaystok', '15-100', 'Rzemieślnicza', '12', '3', SEQ_CLIENT.currval, 1);
insert into clients(fname, lname, pesel) values('Szymon', 'Zbrowski', '57112163240');
insert into contacts(email, mobile_phone_1, id_client) values('grzybix@o2.pl', '653-365-785', SEQ_CLIENT.currval);
insert into addresses(city, postal_code, street, home_number, id_client, id_address_type) values('Poznań', '60-005', 'Grzybowska', '89', SEQ_CLIENT.currval, 1);

update addresses set street = 'Wiśniowa', home_number = '88A', apartment_number = '23' where id_address = 1 and status = 1;
delete from addresses where id_address = 2 and status = 1;
update contacts set mobile_phone_2 = '782-219-090' where id_contact = 1 and status = 1;
delete from contacts where id_contact = 2 and status = 1;

insert into policies(policy_no, id_insurer, id_insured, id_policy_type, policy_value, premium_value, premium_frequency, sign_date, start_date) values ('P/07/04LIFE', 1, 1, 3, 20000, 1500, 12, sysdate, sysdate + 1);
insert into policies(policy_no, id_insurer, id_insured, id_policy_type, policy_value, premium_value, premium_frequency, sign_date, start_date) values ('P/07/05LIFE', 2, 3, 4, 20000, 1500, 12, sysdate-10, sysdate-9);
insert into policies(policy_no, id_insurer, id_insured, id_policy_type, policy_value, premium_value, premium_frequency, sign_date, start_date) values ('P/07/04LIFE', 1, 1, 3, 20000, 1500, 2, sysdate, sysdate+1);

insert into claims (claim_no, id_policy, id_rider, event_date, claim_status) values('R/01/07/04', 1, 1, sysdate, 'Paid');
insert into claims (claim_no, id_policy, id_rider, event_date, claim_status) values('R/01/07/05', 20, 1, '2021/06/01', 'Paid');

--test logów
insert into contacts(email, mobile_phone_1, mobile_phone_2, id_client) values('mako@wp.pl', '611-222-033', '', 1);
update contacts set mobile_phone_2 = '778912344' where id_contact = 13;
delete from contacts where id_contact = 13;

insert into addresses(city, postal_code, street, home_number, id_client, id_address_type) values('Warszawa', '01-485', 'Marszałkowska', '3B', 1, 1);
update addresses set apartment_number = '12' where id_address = 4;
delete from addresses where id_address = 4;

insert into clients(fname, lname, pesel) values('Julia', 'Wrońska', '53011369892');
update clients set fname = 'Julita' where pesel = '53011369892';
delete from clients where pesel = '53011369892';
