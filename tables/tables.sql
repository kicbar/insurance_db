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