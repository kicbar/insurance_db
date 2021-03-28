insert into DCT_STATUSES(id_status, status_name) values(0, 'INACTIVE');
insert into DCT_STATUSES(id_status, status_name) values(1, 'ACTIVE');
insert into DCT_STATUSES(id_status, status_name) values(8, 'DELETED');
insert into DCT_STATUSES(id_status, status_name) values(9, 'INVALID');

insert into DCT_POLICY_TYPES (POLICY_TYPE, SHORT_NAME, DESCRIPTION) VALUES ('Polisa na życie', 'LIFE_P', 'Polisa ubezpieczeniowa życiowa, indywidualna na życie.');
insert into DCT_POLICY_TYPES (POLICY_TYPE, SHORT_NAME, DESCRIPTION) VALUES ('Polisa grupowa', 'LIFE_G', 'Polisa ubezpieczeniowa życiowa, grupowa na życie.');
insert into DCT_POLICY_TYPES (POLICY_TYPE, SHORT_NAME, DESCRIPTION) VALUES ('Polisa turystyczna', 'TOUR_P', 'Polisa ubezpieczeniowa życiowa, ubezpieczenie podczas podróży.');
insert into DCT_POLICY_TYPES (POLICY_TYPE, SHORT_NAME, DESCRIPTION) VALUES ('Polisa mieszkaniowa', 'HOUSE_P', 'Polisa ubezpieczeniowa majątkowa, ubezpieczenie mieszkania.');
insert into DCT_POLICY_TYPES (POLICY_TYPE, SHORT_NAME, DESCRIPTION) VALUES ('Polisa motoryzacyjna', 'MOTO_P', 'Polisa ubezpieczeniowa majątkowa, ubezpieczenie pojazdu.');