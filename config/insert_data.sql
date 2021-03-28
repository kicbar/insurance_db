insert into DCT_STATUSES(id_status, status_name) values(0, 'INACTIVE');
insert into DCT_STATUSES(id_status, status_name) values(1, 'ACTIVE');
insert into DCT_STATUSES(id_status, status_name) values(8, 'DELETED');
insert into DCT_STATUSES(id_status, status_name) values(9, 'INVALID');

insert into DCT_POLICY_TYPES (POLICY_TYPE, SHORT_NAME, DESCRIPTION) VALUES ('Polisa na życie', 'LIFE_P', 'Polisa ubezpieczeniowa życiowa, indywidualna na życie.');
insert into DCT_POLICY_TYPES (POLICY_TYPE, SHORT_NAME, DESCRIPTION) VALUES ('Polisa grupowa', 'LIFE_G', 'Polisa ubezpieczeniowa życiowa, grupowa na życie.');
insert into DCT_POLICY_TYPES (POLICY_TYPE, SHORT_NAME, DESCRIPTION) VALUES ('Polisa turystyczna', 'TOUR_P', 'Polisa ubezpieczeniowa życiowa, ubezpieczenie podczas podróży.');
insert into DCT_POLICY_TYPES (POLICY_TYPE, SHORT_NAME, DESCRIPTION) VALUES ('Polisa mieszkaniowa', 'HOUSE_P', 'Polisa ubezpieczeniowa majątkowa, ubezpieczenie mieszkania.');
insert into DCT_POLICY_TYPES (POLICY_TYPE, SHORT_NAME, DESCRIPTION) VALUES ('Polisa motoryzacyjna', 'MOTO_P', 'Polisa ubezpieczeniowa majątkowa, ubezpieczenie pojazdu.');

insert into clients(fname, lname, pesel, address, contact) values('Maciej', 'Makowski', '14052743387', 'Warszawa ul. Marszalkowska 3B', 'email: mako@wp.pl, tel.: 611-222-033');
insert into clients(fname, lname, pesel, address, contact) values('Julia', 'Wrońska', '52011369892', 'Biaystok ul. Rzemieślnicza 12', 'email: jullaw@gmail.pl, tel.: 512-232-962');
insert into clients(fname, lname, pesel, address, contact) values('Szymon', 'Zbrowski', '57112163240', 'Poznań ul. Grzybowska 89/2', 'email: grzybix@o2.pl, tel.: 653-365-785');