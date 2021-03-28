insert into DCT_STATUSES(id_status, status_name) values(0, 'INACTIVE');
insert into DCT_STATUSES(id_status, status_name) values(1, 'ACTIVE');
insert into DCT_STATUSES(id_status, status_name) values(8, 'DELETED');
insert into DCT_STATUSES(id_status, status_name) values(9, 'INVALID');

insert into DCT_POLICY_TYPES (POLICY_TYPE, SHORT_NAME, DESCRIPTION) VALUES ('Polisa na życie', 'LIFE_P', 'Polisa ubezpieczeniowa życiowa, indywidualna na życie.');
insert into DCT_POLICY_TYPES (POLICY_TYPE, SHORT_NAME, DESCRIPTION) VALUES ('Polisa grupowa', 'LIFE_G', 'Polisa ubezpieczeniowa życiowa, grupowa na życie.');
insert into DCT_POLICY_TYPES (POLICY_TYPE, SHORT_NAME, DESCRIPTION) VALUES ('Polisa turystyczna', 'TOUR_P', 'Polisa ubezpieczeniowa życiowa, ubezpieczenie podczas podróży.');
insert into DCT_POLICY_TYPES (POLICY_TYPE, SHORT_NAME, DESCRIPTION) VALUES ('Polisa mieszkaniowa', 'HOUSE_P', 'Polisa ubezpieczeniowa majątkowa, ubezpieczenie mieszkania.');
insert into DCT_POLICY_TYPES (POLICY_TYPE, SHORT_NAME, DESCRIPTION) VALUES ('Polisa motoryzacyjna', 'MOTO_P', 'Polisa ubezpieczeniowa majątkowa, ubezpieczenie pojazdu.');

insert into address_types (id_address_type, address_name) VALUES (1, 'Zamieszkania' ); 
insert into address_types (id_address_type, address_name) VALUES (2, 'Zameldowania'); 
insert into address_types (id_address_type, address_name) VALUES (3, 'Korespodencyjny'); 
insert into address_types (id_address_type, address_name) VALUES (4, 'Inne'); 

insert into clients(fname, lname, pesel) values('Maciej', 'Makowski', '14052743387');
insert into contacts(email, mobile_phone_1, mobile_phone_2, id_client) values('mako@wp.pl', '611-222-033', '', SEQ_CLIENT.currval);
insert into addresses(city, postal_code, street, home_number, id_client, id_address_type) values('Warszawa', '01-485', 'Marszałkowska', '3B', SEQ_CLIENT.currval, 1);
insert into addresses(city, postal_code, street, home_number, apartment_number, id_client, id_address_type) values('Warszawa', '01-485', 'Jana Pawła', '112', '8', SEQ_CLIENT.currval, 1);
insert into clients(fname, lname, pesel) values('Julia', 'Wrońska', '52011369892');
insert into contacts(email, mobile_phone_1, mobile_phone_2, id_client) values('jullaw@gmail.pl', '512-232-962', '874-965-552', SEQ_CLIENT.currval);
insert into addresses(city, postal_code, street, home_number, apartment_number, id_client, id_address_type) values('Biaystok', '15-100', 'Rzemieślnicza', '12', '3', SEQ_CLIENT.currval, 1);
insert into clients(fname, lname, pesel) values('Szymon', 'Zbrowski', '57112163240');
insert into contacts(email, mobile_phone_1, id_client) values('grzybix@o2.pl', '653-365-785', SEQ_CLIENT.currval);
insert into addresses(city, postal_code, street, home_number, id_client, id_address_type) values('Poznań', '60-005', 'Grzybowska', '89', SEQ_CLIENT.currval, 1);

