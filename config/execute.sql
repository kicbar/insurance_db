create sequence SEQ_LOG
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

create sequence SEQ_POLICY
start with 1 increment by 1
minvalue 1 maxvalue 100000
cycle cache 2 order;

create sequence SEQ_CLAIM
start with 1 increment by 1
minvalue 1 maxvalue 100000
cycle cache 2 order;

CREATE TABLE LOGS
(
  ID_LOG INTEGER DEFAULT SEQ_LOG.NEXTVAL PRIMARY KEY NOT NULL
, TABLE_NAME VARCHAR2(20) NOT NULL
, OPERATION VARCHAR2(60)
, OLD_VALUE VARCHAR2(300)
, NEW_VALUE VARCHAR2(300)
, EVENT_DATE TIMESTAMP default sysdate 
, INSERT_DATE TIMESTAMP default sysdate 
);

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
  ID_POLICY_TYPE integer constraint id_dct_policy_type_pk primary key not null
, POLICY_TYPE varchar2(30) not null
, SHORT_NAME varchar2(8) not null
, DESCRIPTION varchar2(100)
, VERSION number(2,0) default 1
, UPDATE_DATE timestamp default sysdate
, INSERT_DATE timestamp default sysdate
, STATUS integer default 1
);

create table DCT_RIDERS
(
  ID_RIDER integer constraint id_rider_pk primary key not null
, RIDER_NAME varchar2(5) not null
, RIDER_DESCRIPTION varchar2(200) not null
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
  ID_ADDRESS integer default SEQ_ADDRESS.nextval constraint id_address_pk primary key not null
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

create table POLICIES
(
  ID_POLICY integer default SEQ_POLICY.nextval constraint id_policy_pk primary key not null
, POLICY_NO varchar2(20) not null
, ID_INSURER integer not null
, ID_INSURED integer not null
, POLICY_VALUE number(9,2)
, PREMIUM_VALUE number(9,2)
, PREMIUM_FREQUENCY integer
, TOTAL_PREMIUM number(10,2)
, SIGN_DATE date
, START_DATE date
, VERSION number(2,0) default 1
, UPDATE_DATE timestamp default sysdate
, INSERT_DATE timestamp default sysdate
, STATUS integer default 1
, constraint id_policy_insurer_fk foreign key (ID_INSURER) references CLIENTS(ID_CLIENT)
, constraint id_policy_insured_fk foreign key (ID_INSURED) references CLIENTS(ID_CLIENT)
);


create table CLAIMS
(
  ID_CLAIM integer default SEQ_CLAIM.nextval constraint id_claim_pk primary key not null
, CLAIM_NO varchar2(20) not null
, ID_POLICY integer not null
, ID_RIDER integer not null
, EVENT_DATE date
, CLAIM_STATUS varchar2(10) default 'Register' check (CLAIM_STATUS IN ('Register', 'To pay', 'Paid', 'Refused')) 
, VERSION number(2,0) default 1
, UPDATE_DATE timestamp default sysdate
, INSERT_DATE timestamp default sysdate
, STATUS integer default 1
, constraint id_claim_policy_fk foreign key (ID_POLICY) references POLICIES(ID_POLICY)
, constraint id_claim_rider_fk foreign key (ID_RIDER) references DCT_RIDERS(ID_RIDER)
);

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

insert into address_types (id_address_type, address_name) VALUES (1, 'Zamieszkania' ); 
insert into address_types (id_address_type, address_name) VALUES (2, 'Zameldowania'); 
insert into address_types (id_address_type, address_name) VALUES (3, 'Korespodencyjny'); 
insert into address_types (id_address_type, address_name) VALUES (4, 'Inne'); 

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

insert into policies(policy_no, id_insurer, id_insured, policy_value, premium_value, premium_frequency, sign_date, start_date) values ('P/07/04LIFE', 1, 1, 20000, 1500, 12, sysdate, sysdate + 1);

insert into claims (claim_no, id_policy, id_rider, event_date, claim_status) values('R/01/07/04', 1, 1, sysdate, 'Paid');