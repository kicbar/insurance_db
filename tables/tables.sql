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
, ADDRESS varchar2(100)
, CONTACT varchar2(100)
, VERSION number(2,0) default 1
, UPDATE_DATE timestamp default sysdate
, INSERT_DATE timestamp default sysdate
, STATUS integer default 1
);