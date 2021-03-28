create table DCT_STATUSES
(
  ID_STATUS integer constraint id_dct_statuses_pk primary key not null
, STATUS_NAME varchar2(20) not null
, VERSION number(2,0) default 1
, UPDATE_DATE timestamp default sysdate
, INSERT_DATE timestamp default sysdate
);