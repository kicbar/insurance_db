drop table DCT_STATUSES cascade constraints;
drop table DCT_POLICY_TYPES cascade constraints;
drop table DCT_RIDERS cascade constraints;
drop table DCT_ADDRESS_TYPES cascade constraints;
drop table CLIENTS cascade constraints;
drop table CONTACTS cascade constraints;
drop table ADDRESSES cascade constraints;
drop table POLICIES cascade constraints;
drop table CLAIMS cascade constraints;
drop table LOGS cascade constraints;

drop sequence SEQ_LOG;
drop sequence SEQ_CLIENT;
drop sequence SEQ_CONTACT;
drop sequence SEQ_ADDRESS;
drop sequence SEQ_POLICY;
drop sequence SEQ_CLAIM;

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

CREATE TABLE DCT_ADDRESS_TYPES
(
  ID_ADDRESS_TYPE integer constraint id_address_type_pk primary key not null
, ADDRESS_NAME VARCHAR2(20)  NOT NULL
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
, constraint id_address_type_fk foreign key (ID_ADDRESS_TYPE) references DCT_ADDRESS_TYPES(ID_ADDRESS_TYPE)
);

create table POLICIES
(
  ID_POLICY integer default SEQ_POLICY.nextval constraint id_policy_pk primary key not null
, POLICY_NO varchar2(20) not null
, ID_INSURER integer not null
, ID_INSURED integer not null
, ID_POLICY_TYPE integer not null
, POLICY_VALUE number(9,2)
, PREMIUM_VALUE number(9,2)
, PREMIUM_FREQUENCY integer
, TOTAL_PREMIUM number(10,2)
, SIGN_DATE date
, START_DATE date
, END_DATE date
, VERSION number(2,0) default 1
, UPDATE_DATE timestamp default sysdate
, INSERT_DATE timestamp default sysdate
, STATUS integer default 1
, constraint id_policy_insurer_fk foreign key (ID_INSURER) references CLIENTS(ID_CLIENT)
, constraint id_policy_insured_fk foreign key (ID_INSURED) references CLIENTS(ID_CLIENT)
, constraint id_policy_type_fk foreign key (ID_POLICY_TYPE) references DCT_POLICY_TYPES(ID_POLICY_TYPE)
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