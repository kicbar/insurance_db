/*this script connect all others file and create db objects*/

drop table DCT_STATUSES cascade constraints;
drop table DCT_POLICY_TYPES cascade constraints;
drop table CLIENTS cascade constraints;
drop table CONTACTS cascade constraints;
drop table ADDRESS_TYPES cascade constraints;
drop table ADDRESSES cascade constraints;

drop sequence SEQ_DCT_POLICY_TYPE;
drop sequence SEQ_CLIENT;
drop sequence SEQ_CONTACT;
drop sequence SEQ_ADDRESS;

create sequence SEQ_DCT_POLICY_TYPE
start with 1 increment by 1
minvalue 1 maxvalue 100000
cycle cache 2 order;

create sequence SEQ_CLIENT
start with 1 increment by 1
minvalue 1 maxvalue 100000
cycle cache 2 order;

create sequence SEQ_CONTACT
start with 1 increment by 1
minvalue 1 maxvalue 100000
cycle cache 2 order;

create sequence SEQ_ADDRESS
start with 1 increment by 1
minvalue 1 maxvalue 100000
cycle cache 2 order;

create table DCT_STATUSES
(
  ID_STATUS integer constraint id_dct_statuses_pk primary key not null
, STATUS_NAME varchar2(20) not null
, VERSION number(2,0) default 1
, UPDATE_DATE timestamp default sysdate
, INSERT_DATE timestamp default sysdate
);

create table DCT_POLICY_TYPES
(
  ID_POLICY_TYPE integer default seq_dct_policy_type.nextval constraint id_dct_policy_type_pk primary key not null
, POLICY_TYPE varchar2(30) not null
, SHORT_NAME varchar2(8) not null
, DESCRIPTION varchar2(100)
, VERSION number(2,0) default 1
, UPDATE_DATE timestamp default sysdate
, INSERT_DATE timestamp default sysdate
, STATUS integer default 1
);

create table CLIENTS
(
  ID_CLIENT integer default SEQ_CLIENT.nextval constraint id_client_pk primary key not null
, FNAME varchar2(50) not null
, LNAME varchar2(50) not null
, PESEL varchar2(11) unique
, VERSION number(2,0) default 1
, UPDATE_DATE timestamp default sysdate
, INSERT_DATE timestamp default sysdate
, STATUS integer default 1
);

create table CONTACTS
(
  ID_CONTACT integer default SEQ_CONTACT.nextval constraint id_contact_pk primary key not null
, EMAIL varchar2(40) check(regexp_like (EMAIL,'^[A-Za-z]+[A-Za-z0-9.]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'))
, MOBILE_PHONE_1 varchar2(13) 
, MOBILE_PHONE_2 varchar2(13)
, ID_CLIENT integer not null
, VERSION number(2,0) default 1
, UPDATE_DATE timestamp default sysdate
, INSERT_DATE timestamp default sysdate
, STATUS integer default 1
, constraint id_contact_client_fk foreign key (ID_CLIENT) references CLIENTS(ID_CLIENT)
);

CREATE TABLE ADDRESS_TYPES
(
  ID_ADDRESS_TYPE integer constraint id_address_type_pk primary key not null
, ADDRESS_NAME VARCHAR2(20)  NOT NULL
, VERSION number(2,0) default 1
, UPDATE_DATE timestamp default sysdate
, INSERT_DATE timestamp default sysdate
, STATUS integer default 1
);

create table ADDRESSES
(
  ID_CONTACT integer default SEQ_ADDRESS.nextval constraint id_address_pk primary key not null
, CITY varchar2(40) NOT NULL
, POSTAL_CODE varchar2(6)
, STREET varchar2(40) NOT NULL 
, HOME_NUMBER varchar2(5)
, APARTMENT_NUMBER varchar2(5)
, COUNTRY varchar2(20) DEFAULT 'PL'
, ID_CLIENT integer not null
, ID_ADDRESS_TYPE integer default 1 not null
, VERSION number(2,0) default 1
, UPDATE_DATE timestamp default sysdate
, INSERT_DATE timestamp default sysdate
, STATUS integer default 1
, constraint id_address_client_fk foreign key (ID_CLIENT) references CLIENTS(ID_CLIENT)
, constraint id_address_type_fk foreign key (ID_ADDRESS_TYPE) references ADDRESS_TYPES(ID_ADDRESS_TYPE)
);

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
