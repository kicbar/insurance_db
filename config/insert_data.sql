insert into DCT_STATUSES(id_status, status_name) values(0, 'INACTIVE');
insert into DCT_STATUSES(id_status, status_name) values(1, 'ACTIVE');
insert into DCT_STATUSES(id_status, status_name) values(8, 'DELETED');
insert into DCT_STATUSES(id_status, status_name) values(9, 'INVALID');

insert into DCT_POLICY_TYPES (POLICY_TYPE, SHORT_NAME, DESCRIPTION) VALUES ('Polisa na życie', 'LIFE_P', 'Polisa ubezpieczeniowa życiowa, indywidualna na życie.');
insert into DCT_POLICY_TYPES (POLICY_TYPE, SHORT_NAME, DESCRIPTION) VALUES ('Polisa grupowa', 'LIFE_G', 'Polisa ubezpieczeniowa życiowa, grupowa na życie.');
insert into DCT_POLICY_TYPES (POLICY_TYPE, SHORT_NAME, DESCRIPTION) VALUES ('Polisa turystyczna', 'TOUR_P', 'Polisa ubezpieczeniowa życiowa, ubezpieczenie podczas podróży.');
insert into DCT_POLICY_TYPES (POLICY_TYPE, SHORT_NAME, DESCRIPTION) VALUES ('Polisa mieszkaniowa', 'HOUSE_P', 'Polisa ubezpieczeniowa majątkowa, ubezpieczenie mieszkania.');
insert into DCT_POLICY_TYPES (POLICY_TYPE, SHORT_NAME, DESCRIPTION) VALUES ('Polisa motoryzacyjna', 'MOTO_P', 'Polisa ubezpieczeniowa majątkowa, ubezpieczenie pojazdu.');

insert into clients(fname, lname, pesel, address) values('Maciej', 'Makowski', '14052743387', 'Warszawa ul. Marszalkowska 3B');
insert into contacts(email, mobile_phone_1, mobile_phone_2, id_client) values('mako@wp.pl', '611-222-033', '', SEQ_CLIENT.currval);
insert into clients(fname, lname, pesel, address) values('Julia', 'Wrońska', '52011369892', 'Biaystok ul. Rzemieślnicza 12');
insert into contacts(email, mobile_phone_1, mobile_phone_2, id_client) values('jullaw@gmail.pl', '512-232-962', '874-965-552', SEQ_CLIENT.currval);
insert into clients(fname, lname, pesel, address) values('Szymon', 'Zbrowski', '57112163240', 'Poznań ul. Grzybowska 89/2');
insert into contacts(email, mobile_phone_1, id_client) values('grzybix@o2.pl', '653-365-785', SEQ_CLIENT.currval);