--------------------------------------------------------
--  ������ ������ - �����-12��-29-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_FIND_NO
--------------------------------------------------------

   CREATE SEQUENCE  "KOSTA_PRJ"."SEQ_FIND_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_FREEREPLY_NO
--------------------------------------------------------

   CREATE SEQUENCE  "KOSTA_PRJ"."SEQ_FREEREPLY_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_FREE_NO
--------------------------------------------------------

   CREATE SEQUENCE  "KOSTA_PRJ"."SEQ_FREE_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_MATEREPLY_NO
--------------------------------------------------------

   CREATE SEQUENCE  "KOSTA_PRJ"."SEQ_MATEREPLY_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_MATE_NO
--------------------------------------------------------

   CREATE SEQUENCE  "KOSTA_PRJ"."SEQ_MATE_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_NOTICE_NO
--------------------------------------------------------

   CREATE SEQUENCE  "KOSTA_PRJ"."SEQ_NOTICE_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_QUESTIONS_NO
--------------------------------------------------------

   CREATE SEQUENCE  "KOSTA_PRJ"."SEQ_QUESTIONS_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_REC_NO
--------------------------------------------------------

   CREATE SEQUENCE  "KOSTA_PRJ"."SEQ_REC_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_REPORT_NO
--------------------------------------------------------

   CREATE SEQUENCE  "KOSTA_PRJ"."SEQ_REPORT_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_REVIEWREPLY_NO
--------------------------------------------------------

   CREATE SEQUENCE  "KOSTA_PRJ"."SEQ_REVIEWREPLY_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_REVIEW_NO
--------------------------------------------------------

   CREATE SEQUENCE  "KOSTA_PRJ"."SEQ_REVIEW_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table FREE
--------------------------------------------------------

  CREATE TABLE "KOSTA_PRJ"."FREE" 
   (	"FNO" NUMBER, 
	"TITLE" VARCHAR2(100 BYTE), 
	"CONTENT" VARCHAR2(2000 BYTE), 
	"WRITER" VARCHAR2(100 BYTE), 
	"REGDATE" DATE DEFAULT SYSDATE, 
	"HIT" NUMBER DEFAULT 0, 
	"USER_ID" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table FREE_REPLY
--------------------------------------------------------

  CREATE TABLE "KOSTA_PRJ"."FREE_REPLY" 
   (	"FRNO" NUMBER, 
	"FNO" NUMBER, 
	"CONTENT" VARCHAR2(1000 BYTE), 
	"WRITER" VARCHAR2(50 BYTE), 
	"REGDATE" DATE DEFAULT SYSDATE, 
	"USER_ID" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MANAGER
--------------------------------------------------------

  CREATE TABLE "KOSTA_PRJ"."MANAGER" 
   (	"ID" VARCHAR2(10 BYTE), 
	"PWD" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MATE
--------------------------------------------------------

  CREATE TABLE "KOSTA_PRJ"."MATE" 
   (	"MATE_NO" NUMBER(4,0), 
	"ACTIVITYNAME" VARCHAR2(200 BYTE), 
	"WRITER" VARCHAR2(20 BYTE), 
	"MEETINGPLACE" VARCHAR2(100 BYTE), 
	"MEETINGTIME" NUMBER, 
	"MEETINGDATE" DATE, 
	"PEOPLENUM" NUMBER(3,0) DEFAULT 1, 
	"PEOPLEMAXNUM" NUMBER(3,0), 
	"STARTZONE" VARCHAR2(100 BYTE), 
	"ENDZONE" VARCHAR2(100 BYTE), 
	"STARTTIME" NUMBER(10,0), 
	"ENDTIME" NUMBER(10,0), 
	"CONTENT" VARCHAR2(2000 BYTE), 
	"REGDATE" DATE DEFAULT SYSDATE, 
	"UPDATEDATE" DATE DEFAULT SYSDATE, 
	"REPLYCNT" NUMBER(4,0) DEFAULT 0, 
	"IMAGE" VARCHAR2(1000 BYTE), 
	"REGULAR" NUMBER(1,0), 
	"LIKECNT" NUMBER DEFAULT 0, 
	"TIMESTAMP" TIMESTAMP (6), 
	"USER_ID" VARCHAR2(30 BYTE), 
	"REPORT_COUNT" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MATE_HEART
--------------------------------------------------------

  CREATE TABLE "KOSTA_PRJ"."MATE_HEART" 
   (	"LNO" NUMBER(10,0) DEFAULT 0, 
	"MATE_NO" NUMBER(10,0), 
	"USER_ID" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MATE_JOIN
--------------------------------------------------------

  CREATE TABLE "KOSTA_PRJ"."MATE_JOIN" 
   (	"MATE_NO" NUMBER(10,0), 
	"USER_ID" VARCHAR2(30 BYTE), 
	"JNO" NUMBER(10,0) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "KOSTA_PRJ"."MATE_JOIN"."JNO" IS '0=����,1=������';
--------------------------------------------------------
--  DDL for Table MATE_REPLY
--------------------------------------------------------

  CREATE TABLE "KOSTA_PRJ"."MATE_REPLY" 
   (	"MATE_REPLY_NO" NUMBER(10,0), 
	"MATE_NO" NUMBER(10,0), 
	"REPLY" VARCHAR2(1000 BYTE), 
	"REPLYER" VARCHAR2(50 BYTE), 
	"REPLYDATE" DATE DEFAULT SYSDATE, 
	"UPDATEDATE" DATE DEFAULT SYSDATE -- ������ 
, 
	"USER_ID" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table NOTICE
--------------------------------------------------------

  CREATE TABLE "KOSTA_PRJ"."NOTICE" 
   (	"NNO" NUMBER(4,0), 
	"NAME" VARCHAR2(500 BYTE), 
	"CONTENT" VARCHAR2(2000 BYTE), 
	"REGDATE" DATE DEFAULT SYSDATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table QUESTIONS
--------------------------------------------------------

  CREATE TABLE "KOSTA_PRJ"."QUESTIONS" 
   (	"QNO" NUMBER(4,0), 
	"NAME" VARCHAR2(500 BYTE), 
	"CONTENT" VARCHAR2(2000 BYTE), 
	"REGDATE" DATE DEFAULT SYSDATE, 
	"VALUE" NUMBER(1,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "KOSTA_PRJ"."QUESTIONS"."VALUE" IS '����=0,����=1,����=2,�̿�=3,�Խ���=4';
--------------------------------------------------------
--  DDL for Table RECOMMEND
--------------------------------------------------------

  CREATE TABLE "KOSTA_PRJ"."RECOMMEND" 
   (	"REC_NO" NUMBER, 
	"RECNAME" VARCHAR2(100 BYTE), 
	"ADDRESS" VARCHAR2(100 BYTE), 
	"SIMPLEDESC" VARCHAR2(3000 BYTE), 
	"USER_ID" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table REPORT
--------------------------------------------------------

  CREATE TABLE "KOSTA_PRJ"."REPORT" 
   (	"REPORT_NO" NUMBER, 
	"REPORT_TYPE" NUMBER(1,0), 
	"REPORT_CONTENT" VARCHAR2(1200 BYTE), 
	"MATE_NO" NUMBER, 
	"REPORT_USER_ID" VARCHAR2(100 BYTE), 
	"REPORT_WRITER" VARCHAR2(200 BYTE), 
	"REPORT_MATE_ID" VARCHAR2(100 BYTE), 
	"MATE_REPLY_ID" NUMBER, 
	"REGDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table REVIEW
--------------------------------------------------------

  CREATE TABLE "KOSTA_PRJ"."REVIEW" 
   (	"REV_NO" NUMBER(4,0), 
	"MATE_NO" NUMBER(4,0), 
	"MATE_ACTIVITY" VARCHAR2(500 BYTE), 
	"WRITER" VARCHAR2(50 BYTE), 
	"TITLE" VARCHAR2(500 BYTE), 
	"CONTENT" VARCHAR2(4000 BYTE), 
	"REGDATE" DATE DEFAULT SYSDATE, 
	"REPLYCNT" NUMBER(4,0) DEFAULT 0, 
	"LIKECNT" NUMBER DEFAULT 0, 
	"HIT" NUMBER DEFAULT 0, 
	"THUMBNAIL" VARCHAR2(2000 BYTE), 
	"USER_ID" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table REVIEW_HEART
--------------------------------------------------------

  CREATE TABLE "KOSTA_PRJ"."REVIEW_HEART" 
   (	"LNO" NUMBER(10,0) DEFAULT 0, 
	"REV_NO" NUMBER(10,0), 
	"USER_ID" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table REVIEW_REPLY
--------------------------------------------------------

  CREATE TABLE "KOSTA_PRJ"."REVIEW_REPLY" 
   (	"REV_RNO" NUMBER(10,0), 
	"REV_NO" NUMBER(10,0), 
	"REPLY" VARCHAR2(1000 BYTE), 
	"REPLYER" VARCHAR2(50 BYTE), 
	"REPLYDATE" DATE DEFAULT SYSDATE, 
	"UPDATEDATE" DATE DEFAULT SYSDATE, 
	"USER_ID" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "KOSTA_PRJ"."USERS" 
   (	"ID" VARCHAR2(30 BYTE), 
	"USERNAME" VARCHAR2(30 BYTE), 
	"NICKNAME" VARCHAR2(30 BYTE), 
	"PWD" VARCHAR2(30 BYTE), 
	"EMAIL" VARCHAR2(50 BYTE), 
	"GENDER" VARCHAR2(10 BYTE), 
	"STATUS" VARCHAR2(10 BYTE) DEFAULT '����', 
	"REGDATE" DATE DEFAULT SYSDATE, 
	"UPDATEDATE" DATE DEFAULT SYSDATE, 
	"DELETEDATE" DATE DEFAULT SYSDATE, 
	"PROFILE" VARCHAR2(1000 BYTE), 
	"PROFILE_OPEN" VARCHAR2(1 BYTE), 
	"GRADE" NUMBER DEFAULT 1
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "KOSTA_PRJ"."USERS"."GRADE" IS '1=�⺻ȸ��,2=����ȸ��,3=���ȸ��';
REM INSERTING into KOSTA_PRJ.FREE
SET DEFINE OFF;
Insert into KOSTA_PRJ.FREE (FNO,TITLE,CONTENT,WRITER,REGDATE,HIT,USER_ID) values (1,'dd','<p>dd</p>
','asdf',to_date('22/12/20','RR/MM/DD'),54,'asdf');
Insert into KOSTA_PRJ.FREE (FNO,TITLE,CONTENT,WRITER,REGDATE,HIT,USER_ID) values (3,'dd','<p>dd</p>
','asdf',to_date('22/12/22','RR/MM/DD'),0,'asdf');
Insert into KOSTA_PRJ.FREE (FNO,TITLE,CONTENT,WRITER,REGDATE,HIT,USER_ID) values (4,'asdfasfd','<p>safddsaf</p>
','asdf',to_date('22/12/22','RR/MM/DD'),1,'asdf');
Insert into KOSTA_PRJ.FREE (FNO,TITLE,CONTENT,WRITER,REGDATE,HIT,USER_ID) values (6,'asdf','<p>asdf</p>
','asdf',to_date('22/12/22','RR/MM/DD'),37,'asdf');
REM INSERTING into KOSTA_PRJ.FREE_REPLY
SET DEFINE OFF;
Insert into KOSTA_PRJ.FREE_REPLY (FRNO,FNO,CONTENT,WRITER,REGDATE,USER_ID) values (6,1,'safdadsf','asdf',to_date('22/12/22','RR/MM/DD'),null);
Insert into KOSTA_PRJ.FREE_REPLY (FRNO,FNO,CONTENT,WRITER,REGDATE,USER_ID) values (4,1,'asdfsadf','asdf',to_date('22/12/22','RR/MM/DD'),null);
Insert into KOSTA_PRJ.FREE_REPLY (FRNO,FNO,CONTENT,WRITER,REGDATE,USER_ID) values (5,1,'asdfdsaf','asdf',to_date('22/12/22','RR/MM/DD'),null);
Insert into KOSTA_PRJ.FREE_REPLY (FRNO,FNO,CONTENT,WRITER,REGDATE,USER_ID) values (7,1,'fewfqfew','asdf',to_date('22/12/22','RR/MM/DD'),null);
Insert into KOSTA_PRJ.FREE_REPLY (FRNO,FNO,CONTENT,WRITER,REGDATE,USER_ID) values (9,6,'dd','asdf',to_date('22/12/23','RR/MM/DD'),null);
REM INSERTING into KOSTA_PRJ.MANAGER
SET DEFINE OFF;
Insert into KOSTA_PRJ.MANAGER (ID,PWD) values ('admin','1234');
REM INSERTING into KOSTA_PRJ.MATE
SET DEFINE OFF;
Insert into KOSTA_PRJ.MATE (MATE_NO,ACTIVITYNAME,WRITER,MEETINGPLACE,MEETINGTIME,MEETINGDATE,PEOPLENUM,PEOPLEMAXNUM,STARTZONE,ENDZONE,STARTTIME,ENDTIME,CONTENT,REGDATE,UPDATEDATE,REPLYCNT,IMAGE,REGULAR,LIKECNT,TIMESTAMP,USER_ID,REPORT_COUNT) values (17,'���Ӥ�','asdf','���� ���빮�� �ȾϷ� 6',1105,to_date('22/11/10','RR/MM/DD'),1,2,'���� ���ϱ� �ȾϷ� 5','���� ��õ�� �Ⱦ�õ�������ű� 891',1106,1206,'dd',to_date('22/12/21','RR/MM/DD'),to_date('22/12/21','RR/MM/DD'),0,'�⺻�̹���.jpg',0,0,to_timestamp('22/12/21 11:05:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'asdf',0);
Insert into KOSTA_PRJ.MATE (MATE_NO,ACTIVITYNAME,WRITER,MEETINGPLACE,MEETINGTIME,MEETINGDATE,PEOPLENUM,PEOPLEMAXNUM,STARTZONE,ENDZONE,STARTTIME,ENDTIME,CONTENT,REGDATE,UPDATEDATE,REPLYCNT,IMAGE,REGULAR,LIKECNT,TIMESTAMP,USER_ID,REPORT_COUNT) values (8,'���Ӥ�','asdf','���� ���ϱ� �Ƹ����� 3',2040,to_date('22/12/20','RR/MM/DD'),1,2,'���� ���빮�� �ȾϷ� 6','���� ��õ�� �Ⱦ�õ�������ű� 965',2141,2341,'dd',to_date('22/12/20','RR/MM/DD'),to_date('22/12/20','RR/MM/DD'),0,'20221220%2Fs_585ad55a-8d68-4aee-a8cf-b5cce1bfc1fe_closed.png',0,0,to_timestamp('22/12/20 20:40:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'asdf',0);
Insert into KOSTA_PRJ.MATE (MATE_NO,ACTIVITYNAME,WRITER,MEETINGPLACE,MEETINGTIME,MEETINGDATE,PEOPLENUM,PEOPLEMAXNUM,STARTZONE,ENDZONE,STARTTIME,ENDTIME,CONTENT,REGDATE,UPDATEDATE,REPLYCNT,IMAGE,REGULAR,LIKECNT,TIMESTAMP,USER_ID,REPORT_COUNT) values (10,'���Ӥ�','asdf','���� ��õ�� �Ⱦ�õ�������ű� 891',2242,to_date('22/10/21','RR/MM/DD'),1,2,'���� ���빮�� �ȾϷ� 6','���� ��õ�� �Ⱦ�õ�������ű� 965',2141,2341,'dd',to_date('22/12/20','RR/MM/DD'),to_date('22/12/20','RR/MM/DD'),0,'�⺻�̹���.jpg',0,0,to_timestamp('22/12/20 22:42:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'asdf',0);
Insert into KOSTA_PRJ.MATE (MATE_NO,ACTIVITYNAME,WRITER,MEETINGPLACE,MEETINGTIME,MEETINGDATE,PEOPLENUM,PEOPLEMAXNUM,STARTZONE,ENDZONE,STARTTIME,ENDTIME,CONTENT,REGDATE,UPDATEDATE,REPLYCNT,IMAGE,REGULAR,LIKECNT,TIMESTAMP,USER_ID,REPORT_COUNT) values (11,'���Ӥ�dddd','asdf','���� �߶��� �������4�� 10',2242,to_date('22/06/16','RR/MM/DD'),1,2,'���� ���빮�� �ȾϷ� 6','���� ��õ�� �Ⱦ�õ�������ű� 965',2141,2341,'dd',to_date('22/12/20','RR/MM/DD'),to_date('22/12/20','RR/MM/DD'),0,'20221220%2Fs_10d25d36-9613-40dc-a71e-85461d6dfd8d_closed.png',0,0,to_timestamp('22/12/20 22:42:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'asdf',0);
Insert into KOSTA_PRJ.MATE (MATE_NO,ACTIVITYNAME,WRITER,MEETINGPLACE,MEETINGTIME,MEETINGDATE,PEOPLENUM,PEOPLEMAXNUM,STARTZONE,ENDZONE,STARTTIME,ENDTIME,CONTENT,REGDATE,UPDATEDATE,REPLYCNT,IMAGE,REGULAR,LIKECNT,TIMESTAMP,USER_ID,REPORT_COUNT) values (12,'���Ӥ�','asdf','��� ���� ���籸 �ҿ��� 272',1250,to_date('22/04/29','RR/MM/DD'),1,2,'��� ���� ���籸 �ҿ��� 272','��� ���� ���籸 �ҿ��� 272',1250,1352,'dd',to_date('22/12/20','RR/MM/DD'),to_date('22/12/20','RR/MM/DD'),0,'20221220%2Fs_45e12991-5e31-4c80-a73d-0a44e057c057_thumb_1668155841_7383.jpg',1,0,to_timestamp('22/12/20 12:50:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'asdf',0);
Insert into KOSTA_PRJ.MATE (MATE_NO,ACTIVITYNAME,WRITER,MEETINGPLACE,MEETINGTIME,MEETINGDATE,PEOPLENUM,PEOPLEMAXNUM,STARTZONE,ENDZONE,STARTTIME,ENDTIME,CONTENT,REGDATE,UPDATEDATE,REPLYCNT,IMAGE,REGULAR,LIKECNT,TIMESTAMP,USER_ID,REPORT_COUNT) values (13,'���Ӥ�','asdf','��� ���� ���籸 �ҿ��� 272',1250,to_date('22/03/10','RR/MM/DD'),1,2,'��� ���� ���籸 �ҿ��� 272','��� ���� ���籸 �ҿ��� 272',1250,1352,'dd',to_date('22/12/20','RR/MM/DD'),to_date('22/12/20','RR/MM/DD'),0,'20221220%2Fs_d7e7ce11-adb2-480a-9677-458123603085_thumb_1668155841_7383.jpg',1,0,to_timestamp('22/12/20 12:50:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'asdf',0);
Insert into KOSTA_PRJ.MATE (MATE_NO,ACTIVITYNAME,WRITER,MEETINGPLACE,MEETINGTIME,MEETINGDATE,PEOPLENUM,PEOPLEMAXNUM,STARTZONE,ENDZONE,STARTTIME,ENDTIME,CONTENT,REGDATE,UPDATEDATE,REPLYCNT,IMAGE,REGULAR,LIKECNT,TIMESTAMP,USER_ID,REPORT_COUNT) values (22,'test','asdf','���� ���ϱ� �ȾϷ� 5',2151,to_date('22/11/10','RR/MM/DD'),2,2,'���� ������ ���� 532','���� ��õ�� �Ⱦ�õ�� 663',1148,148,'dd',to_date('22/12/22','RR/MM/DD'),to_date('22/12/22','RR/MM/DD'),1,'�⺻�̹���.jpg',0,0,to_timestamp('22/12/22 21:51:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'asdf',0);
Insert into KOSTA_PRJ.MATE (MATE_NO,ACTIVITYNAME,WRITER,MEETINGPLACE,MEETINGTIME,MEETINGDATE,PEOPLENUM,PEOPLEMAXNUM,STARTZONE,ENDZONE,STARTTIME,ENDTIME,CONTENT,REGDATE,UPDATEDATE,REPLYCNT,IMAGE,REGULAR,LIKECNT,TIMESTAMP,USER_ID,REPORT_COUNT) values (23,'zxcv1','asdf','���� ���ϱ� �ȾϷ� 5',2151,to_date('22/10/14','RR/MM/DD'),2,2,'���� ������ ���� 532','���� ��õ�� �Ⱦ�õ�� 663',1148,148,'dd',to_date('22/12/22','RR/MM/DD'),to_date('22/12/22','RR/MM/DD'),1,'20221222%2Fs_53d5d753-3ce9-47b8-a89c-5ae764d70005_thumb_1668155841_7383.jpg',0,0,to_timestamp('22/12/22 21:51:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'asdf',0);
Insert into KOSTA_PRJ.MATE (MATE_NO,ACTIVITYNAME,WRITER,MEETINGPLACE,MEETINGTIME,MEETINGDATE,PEOPLENUM,PEOPLEMAXNUM,STARTZONE,ENDZONE,STARTTIME,ENDTIME,CONTENT,REGDATE,UPDATEDATE,REPLYCNT,IMAGE,REGULAR,LIKECNT,TIMESTAMP,USER_ID,REPORT_COUNT) values (24,'sadf','asdf','���� ��õ�� �Ⱦ�õ�������ű� 965',1146,to_date('22/11/17','RR/MM/DD'),1,2,'���� ������ ������� 2-1','���� ���ϱ� �ȾϷ� 5',50,1151,'dd',to_date('22/12/22','RR/MM/DD'),to_date('22/12/22','RR/MM/DD'),0,'�⺻�̹���.jpg',1,0,to_timestamp('22/12/22 11:46:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'asdf',0);
Insert into KOSTA_PRJ.MATE (MATE_NO,ACTIVITYNAME,WRITER,MEETINGPLACE,MEETINGTIME,MEETINGDATE,PEOPLENUM,PEOPLEMAXNUM,STARTZONE,ENDZONE,STARTTIME,ENDTIME,CONTENT,REGDATE,UPDATEDATE,REPLYCNT,IMAGE,REGULAR,LIKECNT,TIMESTAMP,USER_ID,REPORT_COUNT) values (25,'���Ӥ�','asdf','���� ���ϱ� �ȾϷ� 5',1428,to_date('22/09/09','RR/MM/DD'),1,2,'���� ���ϱ� �ȾϷ� 5','���� ��õ�� �Ⱦ�õ�������ű� 965',1428,1528,'dd',to_date('22/12/22','RR/MM/DD'),to_date('22/12/22','RR/MM/DD'),0,'�⺻�̹���.jpg',0,0,to_timestamp('22/12/22 14:28:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'asdf',0);
Insert into KOSTA_PRJ.MATE (MATE_NO,ACTIVITYNAME,WRITER,MEETINGPLACE,MEETINGTIME,MEETINGDATE,PEOPLENUM,PEOPLEMAXNUM,STARTZONE,ENDZONE,STARTTIME,ENDTIME,CONTENT,REGDATE,UPDATEDATE,REPLYCNT,IMAGE,REGULAR,LIKECNT,TIMESTAMP,USER_ID,REPORT_COUNT) values (26,'���Ӥ�','asdf','���� ��õ�� �Ⱦ�õ�� 669',1731,to_date('22/08/18','RR/MM/DD'),1,2,'���� ���ϱ� �ȾϷ� 5','���� ��õ�� �Ⱦ�õ�������ű� 965',1428,1528,'dd',to_date('22/12/22','RR/MM/DD'),to_date('22/12/22','RR/MM/DD'),1,'�⺻�̹���.jpg',0,0,to_timestamp('22/12/22 17:31:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'asdf',0);
Insert into KOSTA_PRJ.MATE (MATE_NO,ACTIVITYNAME,WRITER,MEETINGPLACE,MEETINGTIME,MEETINGDATE,PEOPLENUM,PEOPLEMAXNUM,STARTZONE,ENDZONE,STARTTIME,ENDTIME,CONTENT,REGDATE,UPDATEDATE,REPLYCNT,IMAGE,REGULAR,LIKECNT,TIMESTAMP,USER_ID,REPORT_COUNT) values (27,'���� �׸� Green SEOUL Plogging','asdf','���� ���빮�� �ȾϷ� 6',1754,to_date('22/12/23','RR/MM/DD'),1,5,'����','�ѿ� ���̸���',1854,1958,'�ȵ�! ������ �����ǰ� �־�..!
û�ʹ� ���� ���� ��������� �պ�� �湮������ �����ϴ� ��ŭ ������ �����⵵ �����߾��!
���� �߽ɺ� �Ÿ��� �������� �����ϱ� ���ؼ��� �÷α��� �ʿ��� ����!',to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),0,'20221223%2Fs_4654ff25-a438-4aa8-80e2-741c2cc4a64f_thumb_1668179461_4979.png',0,0,to_timestamp('22/12/23 17:54:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'asdf',0);
Insert into KOSTA_PRJ.MATE (MATE_NO,ACTIVITYNAME,WRITER,MEETINGPLACE,MEETINGTIME,MEETINGDATE,PEOPLENUM,PEOPLEMAXNUM,STARTZONE,ENDZONE,STARTTIME,ENDTIME,CONTENT,REGDATE,UPDATEDATE,REPLYCNT,IMAGE,REGULAR,LIKECNT,TIMESTAMP,USER_ID,REPORT_COUNT) values (30,'�ٴ���� ���� ������ ! ���� �÷α�','asdf','���� ���ϱ� ������37�� 32',1800,to_date('22/12/23','RR/MM/DD'),1,2,'����','�����ؼ�����',2201,1202,'�����ؼ������� ���� �ٴ���� ���� ������ ���� ���� �÷α��ڽ��Դϴ�.',to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),0,'20221223%2Fs_7b881f56-1331-41d4-b68f-b730f2c5985a_thumb_1668155841_7383.jpg',0,0,to_timestamp('22/12/23 18:00:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'asdf',0);
Insert into KOSTA_PRJ.MATE (MATE_NO,ACTIVITYNAME,WRITER,MEETINGPLACE,MEETINGTIME,MEETINGDATE,PEOPLENUM,PEOPLEMAXNUM,STARTZONE,ENDZONE,STARTTIME,ENDTIME,CONTENT,REGDATE,UPDATEDATE,REPLYCNT,IMAGE,REGULAR,LIKECNT,TIMESTAMP,USER_ID,REPORT_COUNT) values (31,'��̴���� �÷α� & ��ǻ��� �ڽ�','asdf','���� ������ �ɵ��� ���� 210',1004,to_date('23/12/23','RR/MM/DD'),1,10,'���� ������ �ɵ��� ���� 210','��� ���� ������ �߾ӷ� 10',1104,104,'�ڸ��� �÷α� �ڽ� ��õ! �ڿ����絵 �ϰ� ��ǳ���浵 �Ϸ� ��̴������ �����. �Ƹ��ٿ� ǳ�� �ӿ� ���� �����⸦ ����ã���ϵ��� ã�� ��̰� �־���ϴ�.
������ �����⸦ �ֿ��� ��������� ������ ����/�Ĺ�/���ǹ����κ��� 10�� �Ÿ��� ��� ������ ���!',to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),0,'20221223%2Fs_b5f01e2d-03a7-4cd2-bb80-4b0892811d98_thumb_1668190883_1752.jpg',1,0,to_timestamp('23/12/23 10:04:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'asdf',0);
Insert into KOSTA_PRJ.MATE (MATE_NO,ACTIVITYNAME,WRITER,MEETINGPLACE,MEETINGTIME,MEETINGDATE,PEOPLENUM,PEOPLEMAXNUM,STARTZONE,ENDZONE,STARTTIME,ENDTIME,CONTENT,REGDATE,UPDATEDATE,REPLYCNT,IMAGE,REGULAR,LIKECNT,TIMESTAMP,USER_ID,REPORT_COUNT) values (34,'�Ѹ����� �÷α�','asdf','��� ��õ�� û��� ����� 17',1004,to_date('23/07/23','RR/MM/DD'),1,2,'��� ���� ����� ��Ƽ����1�� 4','��� ���� ����� ��Ƽ����1�� 10',1104,104,'�ȳ��ϼ���, ������Ű���б� �л����Դϴ�!
����� �̹��� ���� �б����� �����Ͽ��� �Ѹ��������� �̾����� �÷α� Ȱ���� ��ȹ�Ͽ��µ���.
��ҿ� �б����� ģ����� �÷α��� �ϴٰ� ���� �б��� ���� �л���� �� �����ֹβ��� ���� ������ �� �ִ� �÷α��� �����ڴ� �������� �ڽ��� ��ȹ�Ͽ� ���ҽ��ϴ�.
�����̳� ģ����� �Բ� ������ �츮 ������ ���������� ����� ����մϴ�!',to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),0,'20221223%2Fs_87a95bfc-6566-4955-91ef-db57ac3d7da8_thumb_1669855517_5390.jpg',1,0,to_timestamp('23/07/23 10:04:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'asdf',0);
Insert into KOSTA_PRJ.MATE (MATE_NO,ACTIVITYNAME,WRITER,MEETINGPLACE,MEETINGTIME,MEETINGDATE,PEOPLENUM,PEOPLEMAXNUM,STARTZONE,ENDZONE,STARTTIME,ENDTIME,CONTENT,REGDATE,UPDATEDATE,REPLYCNT,IMAGE,REGULAR,LIKECNT,TIMESTAMP,USER_ID,REPORT_COUNT) values (35,'�ü��� �������� �÷α�','asdf','�泲 â���� ���������� ������ 1',1010,to_date('23/06/23','RR/MM/DD'),1,7,'���� ������ ���� �������� 681','���� ������ ���� ���ͱ� 3-7',1110,1210,'â���� �߽ɿ� ��ġ�� ���������� ����� �پ ����� �Բ� ������ǰ�� ������ �� �ְ�, ���� �Ǹ� ���� ����� �Բ� ���Ǻм�, ���佺�� ���� ��� �� �ֽ��ϴ�. �ùε��� �־֢������������� ���� �÷α� �Բ� �Ͻ���!',to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),0,'20221223%2Fs_96b63483-2240-441a-ab8c-9a5c04a616fc_thumb_1668156949_4831.png',1,1,to_timestamp('23/06/23 10:10:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'asdf',0);
Insert into KOSTA_PRJ.MATE (MATE_NO,ACTIVITYNAME,WRITER,MEETINGPLACE,MEETINGTIME,MEETINGDATE,PEOPLENUM,PEOPLEMAXNUM,STARTZONE,ENDZONE,STARTTIME,ENDTIME,CONTENT,REGDATE,UPDATEDATE,REPLYCNT,IMAGE,REGULAR,LIKECNT,TIMESTAMP,USER_ID,REPORT_COUNT) values (36,'���蹮ȭ������ ����ִ� �÷α� �ڽ�','asdf','��� �����ֽ� �ͺ��� �氭�� 864',2012,to_date('23/07/23','RR/MM/DD'),1,2,'���� ������ ��ȭ���� 424','��� ������ ���뱸 �ſ����40���� 69',2118,2218,'�ֱ� ���� ��� �Կ����� �����鼭 �����ް� �ִ� ''����'' !
�ȴް����� �������� â�湮���� �� 3.7km�� �ڽ��Դϴ�.
���蹮ȭ�������� ������ ����ȭ������ ������ ������ ��ȭ���������� ������ �� ������, �������� ��22�� �� ������ ������ �ް� ������ ȿ���� ���� �� �ִ� �ڽ��Դϴ�.
�÷α� �߰��߰� �پ��� ���ο��̽�Ʈ���� ��� �������� �� !
������ �÷α��� ���ÿ� �� �� �ִ� ���� ã���Ŵٸ� ���� �÷α� �ڽ��� ��õ�մϴ� !',to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),1,'20221223%2Fs_bba7fecf-469b-4a54-9ba3-2de9fae32a49_thumb_1668167571_2318.png',1,0,to_timestamp('23/07/23 20:12:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'asdf',0);
Insert into KOSTA_PRJ.MATE (MATE_NO,ACTIVITYNAME,WRITER,MEETINGPLACE,MEETINGTIME,MEETINGDATE,PEOPLENUM,PEOPLEMAXNUM,STARTZONE,ENDZONE,STARTTIME,ENDTIME,CONTENT,REGDATE,UPDATEDATE,REPLYCNT,IMAGE,REGULAR,LIKECNT,TIMESTAMP,USER_ID,REPORT_COUNT) values (37,'���������� ���繮ȭ �÷α�','asdf','��� ���ν� ���ﱸ ������ 64-3',1321,to_date('23/07/23','RR/MM/DD'),2,6,'��� ���ν� ���ﱸ �������� 84','��� ���׽� �ϱ� �ű��� ���ϱ� 221',1519,1619,'���ν� ���������� ������ ���繮ȭ �ڿ��� �ִٴ� ��� �˰� ��̳���?
������� ���� �� ��������� ������ �ΰ� �ִ� ���������� ���� ��ȣ�� ���� û����� ���� ���繮ȭ �÷α� �ڽ��� �Ұ��մϴ�!
�ȱ⸸ �ϴ� �÷α��� ���� �׸�!
���繮ȭ Ž��, ���� ȯ�� ����, ���� ����� ���� �� �Բ� ���������? GO GO!',to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),0,'20221223%2Fs_d434f8b6-12f9-4469-b2b9-b0bbb7b0eb15_thumb_1668146534_2819.png',1,0,to_timestamp('23/07/23 13:21:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'asdf',0);
Insert into KOSTA_PRJ.MATE (MATE_NO,ACTIVITYNAME,WRITER,MEETINGPLACE,MEETINGTIME,MEETINGDATE,PEOPLENUM,PEOPLEMAXNUM,STARTZONE,ENDZONE,STARTTIME,ENDTIME,CONTENT,REGDATE,UPDATEDATE,REPLYCNT,IMAGE,REGULAR,LIKECNT,TIMESTAMP,USER_ID,REPORT_COUNT) values (38,'�ݺ����� �÷α�','asdf','��� ������ �ݿ��� �ݺ�����2�� 2',2019,to_date('22/12/23','RR/MM/DD'),1,5,'��� 6����������','��������̰���',2120,2220,'��� �����ÿ� ��ġ�� ''�󺣴�ü''�� �ΰ������� ''�ݺ�����''�� ���� ������ �󰡰Ÿ��̴�.
���θ� �������� ���ʿ� �󰡵��� ������ �ڸ��ϴ� �̰��� �����Ÿ�, ���Ÿ�, ���Ÿ��� �پ��� ���̸�
Ư��, ������ ���� ���� ǳ���� �̱����̶� ������ �Ӹ� �ƴ϶� ���� ������ �پ��� ������� �� ���� ���ã�´�.
�����ÿ��� �����ϴ� �پ��� ���� ����ŷ ����, �ø������� ��� �� �ִ� ������ ��å�� �ϰ�, �����⸦ ������ ȯ�溸ȣ���� ������ ����.',to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),0,'20221223%2Fs_17f1d6dd-b676-4aef-a586-d6c40e282e63_thumb_1668143184_8541.jpg',0,0,to_timestamp('22/12/23 20:19:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'asdf',0);
Insert into KOSTA_PRJ.MATE (MATE_NO,ACTIVITYNAME,WRITER,MEETINGPLACE,MEETINGTIME,MEETINGDATE,PEOPLENUM,PEOPLEMAXNUM,STARTZONE,ENDZONE,STARTTIME,ENDTIME,CONTENT,REGDATE,UPDATEDATE,REPLYCNT,IMAGE,REGULAR,LIKECNT,TIMESTAMP,USER_ID,REPORT_COUNT) values (39,'����ȭ�� �Ƹ��ٿ� ������','asdf','���� ������ ������� ���� 100',1832,to_date('22/12/23','RR/MM/DD'),1,5,'������','����������',2033,2333,'�̸� ����ȭ�� ���ڰ� �Ǿ� �ִ� �����̴� ��κΰ� ���پ� ���� �Ƹ��ٿ� �ڿ���� �Դϴ�
�����غ��� ŹƮ�� �ٴ������� ���� �ѷ����� Ž���ϴ� ��ſ��� �ֽ��ϴ�',to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),0,'20221223%2Fs_6dc6c8a9-7c29-4a9d-b9eb-adb428714e86_thumb_1668150639_1334.jpg',0,0,to_timestamp('22/12/23 18:32:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'asdf',0);
Insert into KOSTA_PRJ.MATE (MATE_NO,ACTIVITYNAME,WRITER,MEETINGPLACE,MEETINGTIME,MEETINGDATE,PEOPLENUM,PEOPLEMAXNUM,STARTZONE,ENDZONE,STARTTIME,ENDTIME,CONTENT,REGDATE,UPDATEDATE,REPLYCNT,IMAGE,REGULAR,LIKECNT,TIMESTAMP,USER_ID,REPORT_COUNT) values (40,'���������ؾ�ģ���ü�','asdf','�泲 â���� ���������� �����ؾȱ� 12',1745,to_date('22/12/23','RR/MM/DD'),2,2,'�����ؾȻ�å��','����õ',1834,1934,'�ؾȰ� ��, �ٴٰ� ������ �� #�����ؾȻ�å��

#���� �ؾȺ����� #�ؾ������� #�ؾȻ�å��',to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),0,'20221223%2Fs_354c943c-16c2-451b-aba3-5bc0960c5120_thumb_1668154583_2449.jpg',0,0,to_timestamp('22/12/23 17:45:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'asdf',0);
Insert into KOSTA_PRJ.MATE (MATE_NO,ACTIVITYNAME,WRITER,MEETINGPLACE,MEETINGTIME,MEETINGDATE,PEOPLENUM,PEOPLEMAXNUM,STARTZONE,ENDZONE,STARTTIME,ENDTIME,CONTENT,REGDATE,UPDATEDATE,REPLYCNT,IMAGE,REGULAR,LIKECNT,TIMESTAMP,USER_ID,REPORT_COUNT) values (41,'���� ����õ �÷α�','asdf','����Ư����ġ�� �������� ������ 14',35,to_date('24/06/23','RR/MM/DD'),2,20,'����Ư����ġ�� �������� ������ 15','����Ư����ġ�� �������� ������ 28-24',1435,1635,'���� ����õ �÷α� �ڽ��� �Ұ��մϴ�! ''���� �ִ� ���� �帣�� ��''��� ���� ���� ����õ�� ���� �÷� 18�ڽ��� �������̱⵵ �մϴ�. ����õ ��õ���� �帣�� ���� ���� ������ �ڿ��� �����ϸ� �÷α��� �ϴٺ��� �ٻ� �ϻ� �� �����ִ� ������ ȸ���� �ſ���. ������ ����� �ڿ��� ���� ���ֹμ��ڿ���ڹ���, ������ �ϴñ� ��ȭ�Ÿ�, ����õ �÷�18�ڽ�, ������ �������� �̷���� ����õ �÷α� �ڽ��� ��õ�մϴ�.',to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),6,'20221223%2Fs_57bc9c77-9e4e-4bd4-a8c2-5e3d62e1f08a_thumb_1668248158_4563.png',1,1,to_timestamp('24/06/23 00:35:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'asdf',1);
Insert into KOSTA_PRJ.MATE (MATE_NO,ACTIVITYNAME,WRITER,MEETINGPLACE,MEETINGTIME,MEETINGDATE,PEOPLENUM,PEOPLEMAXNUM,STARTZONE,ENDZONE,STARTTIME,ENDTIME,CONTENT,REGDATE,UPDATEDATE,REPLYCNT,IMAGE,REGULAR,LIKECNT,TIMESTAMP,USER_ID,REPORT_COUNT) values (42,'������ �÷α�!','asdf','���� ������ ���ط� 133',1837,to_date('22/12/23','RR/MM/DD'),2,2,'����â����','�����ʵ��б�',1938,2138,'����� �ڿ��� �ູ�� ����Ʈ��Ƽ, �ѱ� �������� �Բ� �ϴ� ������ �÷α� �ڽ��� �Ұ��մϴ�.

�����꿪 ��ó, �ѱ� ��������� ������ ��ϰ� ������ �����ϸ� �ڿ�ģȭ���� ���°����� ���� �ִ� �÷α� ��Ҹ� �Ұ��մϴ�. ����ü��� ��ȣ�ü��� ������ȭ��������, �ѱ� ����ȭ�� ������ �� ����¾��� ������ ���� ����ϰ� �ִ� ����±�䵵����, �ײ� ������ ���°��� â���� �� ������ �÷α� �ڽ��� �������ƿ�.',to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),2,'20221223%2Fs_b81602e7-bda2-4d28-9b3b-e7e3ccb36431_thumb_1668153667_3724.jpg',0,1,to_timestamp('22/12/23 18:37:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'asdf',0);
REM INSERTING into KOSTA_PRJ.MATE_HEART
SET DEFINE OFF;
Insert into KOSTA_PRJ.MATE_HEART (LNO,MATE_NO,USER_ID) values (1,42,'asdf');
Insert into KOSTA_PRJ.MATE_HEART (LNO,MATE_NO,USER_ID) values (1,35,'asdf');
Insert into KOSTA_PRJ.MATE_HEART (LNO,MATE_NO,USER_ID) values (1,41,'zxcv');
Insert into KOSTA_PRJ.MATE_HEART (LNO,MATE_NO,USER_ID) values (0,41,'asdf');
REM INSERTING into KOSTA_PRJ.MATE_JOIN
SET DEFINE OFF;
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (42,'asdf',1);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (42,'forsomeday97',1);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (17,'asdf',1);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (41,'qwer',0);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (41,'zxcv',0);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (8,'asdf',1);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (10,'asdf',1);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (11,'asdf',1);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (12,'asdf',1);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (13,'asdf',1);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (42,'zxcv',0);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (40,'zxcv',1);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (39,'zxcv',0);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (38,'zxcv',0);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (41,'1111',1);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (37,'qwer',1);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (22,'asdf',1);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (23,'asdf',1);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (24,'asdf',1);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (25,'asdf',1);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (26,'asdf',1);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (23,'1111',1);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (22,'2222',1);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (27,'asdf',1);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (36,'asdf',1);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (30,'asdf',1);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (31,'asdf',1);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (34,'asdf',1);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (35,'asdf',1);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (37,'asdf',1);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (38,'asdf',1);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (39,'asdf',1);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (40,'asdf',1);
Insert into KOSTA_PRJ.MATE_JOIN (MATE_NO,USER_ID,JNO) values (41,'asdf',0);
REM INSERTING into KOSTA_PRJ.MATE_REPLY
SET DEFINE OFF;
Insert into KOSTA_PRJ.MATE_REPLY (MATE_REPLY_NO,MATE_NO,REPLY,REPLYER,REPLYDATE,UPDATEDATE,USER_ID) values (48,42,'����Դϴ٤���!','asdf',to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),'asdf');
Insert into KOSTA_PRJ.MATE_REPLY (MATE_REPLY_NO,MATE_NO,REPLY,REPLYER,REPLYDATE,UPDATEDATE,USER_ID) values (53,41,'zxvzxcv����','zxcv',to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),'zxcv');
Insert into KOSTA_PRJ.MATE_REPLY (MATE_REPLY_NO,MATE_NO,REPLY,REPLYER,REPLYDATE,UPDATEDATE,USER_ID) values (51,41,'qwer','��������',to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),'qwer');
Insert into KOSTA_PRJ.MATE_REPLY (MATE_REPLY_NO,MATE_NO,REPLY,REPLYER,REPLYDATE,UPDATEDATE,USER_ID) values (49,42,'���ð��ϴ٤�����
','asdf',to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),'asdf');
Insert into KOSTA_PRJ.MATE_REPLY (MATE_REPLY_NO,MATE_NO,REPLY,REPLYER,REPLYDATE,UPDATEDATE,USER_ID) values (45,26,'asdf','asdf',to_date('22/12/22','RR/MM/DD'),to_date('22/12/22','RR/MM/DD'),'asdf');
Insert into KOSTA_PRJ.MATE_REPLY (MATE_REPLY_NO,MATE_NO,REPLY,REPLYER,REPLYDATE,UPDATEDATE,USER_ID) values (46,23,'1111','1111',to_date('22/12/22','RR/MM/DD'),to_date('22/12/22','RR/MM/DD'),'1111');
Insert into KOSTA_PRJ.MATE_REPLY (MATE_REPLY_NO,MATE_NO,REPLY,REPLYER,REPLYDATE,UPDATEDATE,USER_ID) values (47,22,'sadfadsf','2222',to_date('22/12/22','RR/MM/DD'),to_date('22/12/22','RR/MM/DD'),'2222');
Insert into KOSTA_PRJ.MATE_REPLY (MATE_REPLY_NO,MATE_NO,REPLY,REPLYER,REPLYDATE,UPDATEDATE,USER_ID) values (52,41,'qwera','��������',to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),'qwer');
Insert into KOSTA_PRJ.MATE_REPLY (MATE_REPLY_NO,MATE_NO,REPLY,REPLYER,REPLYDATE,UPDATEDATE,USER_ID) values (54,41,'sdaffdsfad','zxcv',to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),'zxcv');
Insert into KOSTA_PRJ.MATE_REPLY (MATE_REPLY_NO,MATE_NO,REPLY,REPLYER,REPLYDATE,UPDATEDATE,USER_ID) values (55,41,'1111','1111',to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),'1111');
Insert into KOSTA_PRJ.MATE_REPLY (MATE_REPLY_NO,MATE_NO,REPLY,REPLYER,REPLYDATE,UPDATEDATE,USER_ID) values (56,41,'�Ȥ����ϼ���','zxcv',to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),'zxcv');
Insert into KOSTA_PRJ.MATE_REPLY (MATE_REPLY_NO,MATE_NO,REPLY,REPLYER,REPLYDATE,UPDATEDATE,USER_ID) values (57,36,'����~!','asdf',to_date('22/12/28','RR/MM/DD'),to_date('22/12/28','RR/MM/DD'),'asdf');
REM INSERTING into KOSTA_PRJ.NOTICE
SET DEFINE OFF;
Insert into KOSTA_PRJ.NOTICE (NNO,NAME,CONTENT,REGDATE) values (4,'ȸ�� ���� �� ���������� Ȯ�����ּ���.','<p><img alt="" src="/review/ckImgSubmit?uid=2d76c97d-ba23-4ed2-a383-fa591b14295f&amp;fileName=logo2.png" style="height:222px; width:388px" /></p>

<p>&nbsp;</p>

<p>�ȳ��ϼ���.</p>

<p>ZupGoZupUp �Դϴ�.</p>

<p>?</p>

<p>ZupGoZupUp ���񽺿� ����Ǿ� �ִ� ���� �÷����� timeout ������ ����</p>

<p>���� ���� &nbsp;����Ʈ ã��, ����Ʈ ���� �� �Ϻ� �˻� �������� ������ �� �ǰų�, ���� ������ �����Ǵ� ��ְ� �߻��߽��ϴ�.<br />
?</p>

<p>&middot; ��ֽð� : 10:51~11:39</p>

<p>&middot; ��ֿ��� : ZupGoZupUp���񽺿� ����� ����(�����̳�) �÷��� ������</p>

<p>?</p>

<p>����� ���������� �̿��Ͻ� �� �ֽ��ϴ�.</p>

<p>���� �������� ���� ������ ���� ö���ϰ� �����ϰ� �����ϰڽ��ϴ�.</p>

<p>?</p>

<p>�ٽ� �ѹ� �̿뿡 ������ ��� �˼��մϴ�.</p>

<p>ZupGoZupUp &nbsp;�帲.</p>
',to_date('22/12/23','RR/MM/DD'));
Insert into KOSTA_PRJ.NOTICE (NNO,NAME,CONTENT,REGDATE) values (2,'ȸ������� ����� �߰��Ǿ����ϴ�.','<p>ȸ��������� 3�ܰ�� �����Ǹ�, Ȱ���� 10�� �Ϸ��� �� ���� ����� 1�ܰ辿 �ö󰩴ϴ�.</p>

<p>�������� ������ ������ ����� ���� ��µ˴ϴ�.</p>

<p>ȯ���� ���� ������ּż� �����մϴ�.&nbsp;</p>
',to_date('22/12/23','RR/MM/DD'));
Insert into KOSTA_PRJ.NOTICE (NNO,NAME,CONTENT,REGDATE) values (3,'?9�� 5�� ���� ZupGoZupUp ���� ���� ������ ���� ��� ���� �帳�ϴ�.','<p>�ȳ��ϼ���.</p>

<p>ZupGoZupUp �Դϴ�.</p>

<p>?</p>

<p>ZupGoZupUp ���񽺿� ����Ǿ� �ִ� ���� �÷����� timeout ������ ����</p>

<p>���� ���� &nbsp;����Ʈ ã��, ����Ʈ ���� �� �Ϻ� �˻� �������� ������ �� �ǰų�, ���� ������ �����Ǵ� ��ְ� �߻��߽��ϴ�.<br />
?</p>

<p>&middot; ��ֽð� : 10:51~11:39</p>

<p>&middot; ��ֿ��� : ZupGoZupUp���񽺿� ����� ����(�����̳�) �÷��� ������</p>

<p>?</p>

<p>����� ���������� �̿��Ͻ� �� �ֽ��ϴ�.</p>

<p>���� �������� ���� ������ ���� ö���ϰ� �����ϰ� �����ϰڽ��ϴ�.</p>

<p>?</p>

<p>�ٽ� �ѹ� �̿뿡 ������ ��� �˼��մϴ�.</p>

<p>ZupGoZupUp &nbsp;�帲.</p>
',to_date('22/12/23','RR/MM/DD'));
REM INSERTING into KOSTA_PRJ.QUESTIONS
SET DEFINE OFF;
Insert into KOSTA_PRJ.QUESTIONS (QNO,NAME,CONTENT,REGDATE,VALUE) values (2,'�Ϲ� ȸ������ ���','ZupGoZupUp Ȩ���������� ȸ�� ���� �������� �����Ͽ� �����Ͻ� �� �ֽ��ϴ�.',to_date('22/12/23','RR/MM/DD'),0);
Insert into KOSTA_PRJ.QUESTIONS (QNO,NAME,CONTENT,REGDATE,VALUE) values (3,'SNS �α��� ���','ZupGoZupUp Ȩ���������� �α��� Ŭ�� ��, �ϴܿ� īī�� �α��� Ŭ�� �� �����Ͻ� �� �ֽ��ϴ�.',to_date('22/12/23','RR/MM/DD'),0);
Insert into KOSTA_PRJ.QUESTIONS (QNO,NAME,CONTENT,REGDATE,VALUE) values (4,'���� �߻� �� ��ó ���','��й�ȣ ã�� ��, ZupGoZupUp���� ������ ��й�ȣ�� ���� �� �̿��� �ּ���.',to_date('22/12/23','RR/MM/DD'),1);
Insert into KOSTA_PRJ.QUESTIONS (QNO,NAME,CONTENT,REGDATE,VALUE) values (5,'��û���� ���� �������� ���� �� ��ó ���','Ÿ���� ȸ������ �� �����ּҸ� �߸� �Է��Ͽ� ���������� �߼۵Ǿ��� �� �ֽ��ϴ�.',to_date('22/12/23','RR/MM/DD'),1);
Insert into KOSTA_PRJ.QUESTIONS (QNO,NAME,CONTENT,REGDATE,VALUE) values (6,'���������̶�?','�����ο� 2�� ~ 6���� ������ �÷α븸 ������ ������ �����Դϴ�.',to_date('22/12/23','RR/MM/DD'),2);
Insert into KOSTA_PRJ.QUESTIONS (QNO,NAME,CONTENT,REGDATE,VALUE) values (7,'��������̶�?','�����ο� 2�� ~ 30���� ���� �� ������ ��¥���� �÷α��� ������ �����Դϴ�.',to_date('22/12/23','RR/MM/DD'),2);
Insert into KOSTA_PRJ.QUESTIONS (QNO,NAME,CONTENT,REGDATE,VALUE) values (8,'���� �µ��� �� ������.','ZupGoZupUp������ �̿����� ��ġ ���� �޾ƿͼ� ���� �µ��� �����ݴϴ�. ����Ʈ�� ��ġ �׼����� ������ּ���.',to_date('22/12/23','RR/MM/DD'),3);
Insert into KOSTA_PRJ.QUESTIONS (QNO,NAME,CONTENT,REGDATE,VALUE) values (9,'�Խù� �ߴ�','ZupGoZupUp���� �ߴ� ������ �Ǵ� ��, Ÿ���� �ٰŶ�� �Խù��� �ߴܵ˴ϴ�. �ߴ� ������ ���� �ۼ��ڿ��� �뺸�� �˴ϴ�.',to_date('22/12/23','RR/MM/DD'),4);
REM INSERTING into KOSTA_PRJ.RECOMMEND
SET DEFINE OFF;
Insert into KOSTA_PRJ.RECOMMEND (REC_NO,RECNAME,ADDRESS,SIMPLEDESC,USER_ID) values (1,'�ξ����ȣ��','�λ걤���� �߱�','< ���� >



�ξ� ����ȣ���� �λ���� �߽� ��λ� ������ ������� ��λ� �⽾�� ��ġ�ϰ� ������ �Ķ� �ϴð� Ǫ�� �ٴ��� �۵� �ؾ� �ϴ밡 ������ ���̴� ���� ���� ���� �Ǹ��Ǿ� ������ ������ ǳ��� �ٴ��� ���� �ǹ��̴�. ȣ���� ���� �ü��� �Ϻ��ϰ� ���� ��ȭ�� ������ �ϴ��� �������� �ٷ� �տ� �ΰ� �־� ����Ͻ�, ���ο��� ���ϸ� ������ �ڽ��ε� �����ϴ�.



< ���� �� ���� >



�� 1982. 03. 15 ����...���� ���� ����...','asdf');
Insert into KOSTA_PRJ.RECOMMEND (REC_NO,RECNAME,ADDRESS,SIMPLEDESC,USER_ID) values (2,'�����뱸�����а�','�뱸������ ����','�����а��� ��󡤱���, ���ĺ�ȭ � ���� ���ظ� ���̰� �츮���� �������� ����� ���������� �Ѵ��� ��...���� ���� ����...','asdf');
REM INSERTING into KOSTA_PRJ.REPORT
SET DEFINE OFF;
Insert into KOSTA_PRJ.REPORT (REPORT_NO,REPORT_TYPE,REPORT_CONTENT,MATE_NO,REPORT_USER_ID,REPORT_WRITER,REPORT_MATE_ID,MATE_REPLY_ID,REGDATE) values (28,1,'�׳ɱ���̳����� �Ф�',42,null,'qwer',null,null,to_date('22/12/23','RR/MM/DD'));
Insert into KOSTA_PRJ.REPORT (REPORT_NO,REPORT_TYPE,REPORT_CONTENT,MATE_NO,REPORT_USER_ID,REPORT_WRITER,REPORT_MATE_ID,MATE_REPLY_ID,REGDATE) values (29,1,'������ �Ǵ� û�ҳ⿡�� �������� ����',41,null,'qwer',null,null,to_date('22/12/23','RR/MM/DD'));
Insert into KOSTA_PRJ.REPORT (REPORT_NO,REPORT_TYPE,REPORT_CONTENT,MATE_NO,REPORT_USER_ID,REPORT_WRITER,REPORT_MATE_ID,MATE_REPLY_ID,REGDATE) values (31,2,'���ϳ����� ��� �ݺ�(����)',null,null,'zxcv',null,55,to_date('22/12/23','RR/MM/DD'));
Insert into KOSTA_PRJ.REPORT (REPORT_NO,REPORT_TYPE,REPORT_CONTENT,MATE_NO,REPORT_USER_ID,REPORT_WRITER,REPORT_MATE_ID,MATE_REPLY_ID,REGDATE) values (32,1,'�Ҽ��մϴ�.',41,null,'zxcv',null,null,to_date('22/12/23','RR/MM/DD'));
Insert into KOSTA_PRJ.REPORT (REPORT_NO,REPORT_TYPE,REPORT_CONTENT,MATE_NO,REPORT_USER_ID,REPORT_WRITER,REPORT_MATE_ID,MATE_REPLY_ID,REGDATE) values (27,1,'��Ÿ����',27,null,'qwer',null,null,to_date('22/12/23','RR/MM/DD'));
REM INSERTING into KOSTA_PRJ.REVIEW
SET DEFINE OFF;
Insert into KOSTA_PRJ.REVIEW (REV_NO,MATE_NO,MATE_ACTIVITY,WRITER,TITLE,CONTENT,REGDATE,REPLYCNT,LIKECNT,HIT,THUMBNAIL,USER_ID) values (1,8,'���Ӥ�','asdf','dddaaaaa','<p><img alt="" src="/review/ckImgSubmit?uid=fc6fa8e8-0c72-4b80-810b-338009df1a8a&amp;fileName=thumb_1668156949_4831.png" style="height:279px; width:458px" />dddaaaaaz</p>

<p><img alt="" src="/review/ckImgSubmit?uid=03717443-c346-4245-8183-5360bb009b74&amp;fileName=replace.jpg" style="height:212px; width:238px" /><img alt="" src="/review/ckImgSubmit?uid=6bd5070a-4941-4899-a41f-34193853d076&amp;fileName=���.jpg" style="height:123px; width:185px" /></p>
',to_date('22/12/22','RR/MM/DD'),4,2,96,'<img alt="" src="/review/ckImgSubmit?uid=fc6fa8e8-0c72-4b80-810b-338009df1a8a&amp;fileName=thumb_1668156949_4831.png" style="height:279px; width:458px" />','asdf');
Insert into KOSTA_PRJ.REVIEW (REV_NO,MATE_NO,MATE_ACTIVITY,WRITER,TITLE,CONTENT,REGDATE,REPLYCNT,LIKECNT,HIT,THUMBNAIL,USER_ID) values (4,8,'���Ӥ�','asdf','�÷α� �ı�!','<p><img alt="" src="/review/ckImgSubmit?uid=549f6716-0e67-4bdd-ba51-7d4bc152e353&amp;fileName=thumb_1668143184_8541.jpg" style="height:279px; width:458px" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>�����꿪 ��ó, �ѱ� ��������� ������ ��ϰ� ������ �����ϸ� �ڿ�ģȭ���� ���°����� ���� �ִ� �÷α� ��Ҹ� �Ұ��մϴ�.<br />
<br />
����ü��� ��ȣ�ü��� ������ȭ��������, �ѱ� ����ȭ�� ������ �� ����¾��� ������ ���� ����ϰ� �ִ� ����±�䵵����,<br />
<br />
�ײ� ������ ���°��� â���� �� ������ �÷α� �ڽ��� �������ƿ�.</p>

<p>&nbsp;</p>

<p><img alt="" src="/review/ckImgSubmit?uid=d4256ff8-6340-4ca6-9d64-22313f9e5fd2&amp;fileName=thumb_1668150639_1334.jpg" style="height:279px; width:458px" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>���� ���� ���� ���� ����� ��䵵�����Դϴ�.<br />
<br />
�� ���� �������� ��ϰ�, �ڹ����� ������ �ϴ� �������� �α� Ưȭ �������Դϴ�.<br />
<br />
������ ������ 340m ������ �Ÿ��� ������ 10�� ���� �ɸ��ϴ�.<br />
<br />
����� ��䵵������ �츮���� �������� ������ ū ������ ���� �� ������� ������ ���� ����ϰ� �ִ� ��ϰ��� �α� ���� å��<br />
<br />
������ ������ �����ϰ� �ִ� ������,<br />
<br />
�׸��� �����۰��� ���ý� ���� �ֽ��ϴ�.</p>

<p>&nbsp;</p>

<p><img alt="" src="/review/ckImgSubmit?uid=3c5829d1-1bc1-4ba5-a299-a0245d0feba9&amp;fileName=thumb_1669855517_5390.jpg" style="height:279px; width:458px" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>����, �α�, ��ȭ�� ����� ������ ����� �̿��� ���� �з����� ���� ��ϴ�.<br />
<br />
�������� &#39;������&#39;�̶�� Ī�ϰ�,&nbsp;���ý��� &#39;����&#39;���� Ī�� �͵� Ư���ֽ��ϴ�.<br />
<br />
�������� ������� �� ���� ���� ������ �����ΰ� �����鿡�� Ź���߽��ϴ�.<br />
<br />
������ �����ϴ� ���� �ϳ��� �����鼭 ���� �������� ������ ���� �ʾƼ� �λ����̾����ϴ�.<br />
<br />
��ϰ� 1������ 2022 �αǱ�ϰ� �缺���α׷� ��� ����ȸ�� �־��µ� �����ǿ� ���� ��ϳ����� ���õǾ� �־� �λ����̾����ϴ�.</p>
',to_date('22/12/23','RR/MM/DD'),1,1,8,'<img alt="" src="/review/ckImgSubmit?uid=549f6716-0e67-4bdd-ba51-7d4bc152e353&amp;fileName=thumb_1668143184_8541.jpg" style="height:279px; width:458px" />','asdf');
Insert into KOSTA_PRJ.REVIEW (REV_NO,MATE_NO,MATE_ACTIVITY,WRITER,TITLE,CONTENT,REGDATE,REPLYCNT,LIKECNT,HIT,THUMBNAIL,USER_ID) values (5,10,'���Ӥ�','asdf','�ȵ� ������ �÷α� �ı�~','<p>�Ա����� ���� �����Ǿ��ִ� ������ ���� ��µ���.&nbsp;�Ա����� �����⸦ �������ִ� ����(�и����ű����� �ȵ��ִ� �� �ƽ�����)�� �ְ�,&nbsp;������� �о�� �ִ� �����������Ű� �ֽ��ϴ�<br />
<br />
��� ������~&nbsp;���~<br />
&nbsp;</p>

<p><br />
<br />
<br />
<br />
50m�� ������ ������ ���� ���� ���� ���� ��&nbsp;�ᰩ��&nbsp;���ڰ� ���Դϴ�.<br />
<br />
�׸��� ������ �ȴ� ���� ��ȭ���Ĺ�&nbsp;������ �ڻ����� ���̰��,</p>

<p>&nbsp;</p>

<p><img alt="" src="/review/ckImgSubmit?uid=53160104-0a8c-4133-8c16-ce7b5ad91bae&amp;fileName=thumb_1668155841_7383.jpg" style="height:279px; width:458px" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>�ᰩ���������� �������� �ֻ��� �ᰩ�� ���� ��ġ�� �̼�������&nbsp;300������ ������ �̾�� �������� ���Դϴ�.&nbsp;�ᰩ�������� ������� �ų� ����&nbsp;8�� ������&nbsp;1�ÿ� ������ �ȳ�� ǳ���� ���� ������ ���� �ø���,&nbsp;���縦 ������ ���� ���ݸ� �ö󰡸� ���Դϴ�.<br />
<br />
���⼭ �� ���������� �ݴ�������� �������ε� ȸ����� �ȳ��� �ٽ� �Ա����� ���ϰ� �������� �̵��մϴ�.</p>

<p>&nbsp;</p>

<p><img alt="" src="/review/ckImgSubmit?uid=2ae11f92-07a2-4d67-b2e1-c42781cf9664&amp;fileName=thumb_1668154583_2449.jpg" style="height:279px; width:458px" /></p>

<p>&nbsp;</p>

<p>���±濡 ���̴� �볪���� ������ ��� �ڻ����� �ִٰ� �մϴ�.<br />
<br />
�ᰩ������ ���� ���Ĵٿ� ǳ���� �� �� �ִ� ��!<br />
&nbsp;</p>
',to_date('22/12/23','RR/MM/DD'),0,0,7,'<img alt="" src="/review/ckImgSubmit?uid=53160104-0a8c-4133-8c16-ce7b5ad91bae&amp;fileName=thumb_1668155841_7383.jpg" style="height:279px; width:458px" />','asdf');
Insert into KOSTA_PRJ.REVIEW (REV_NO,MATE_NO,MATE_ACTIVITY,WRITER,TITLE,CONTENT,REGDATE,REPLYCNT,LIKECNT,HIT,THUMBNAIL,USER_ID) values (6,17,'���Ӥ�','asdf','����','<p>��������</p>
',to_date('22/12/23','RR/MM/DD'),1,1,4,'<img src="/resources/img/logo2.png">','asdf');
REM INSERTING into KOSTA_PRJ.REVIEW_HEART
SET DEFINE OFF;
Insert into KOSTA_PRJ.REVIEW_HEART (LNO,REV_NO,USER_ID) values (1,1,'asdf');
Insert into KOSTA_PRJ.REVIEW_HEART (LNO,REV_NO,USER_ID) values (1,4,'asdf');
Insert into KOSTA_PRJ.REVIEW_HEART (LNO,REV_NO,USER_ID) values (1,1,'1234');
Insert into KOSTA_PRJ.REVIEW_HEART (LNO,REV_NO,USER_ID) values (1,6,'asdf');
Insert into KOSTA_PRJ.REVIEW_HEART (LNO,REV_NO,USER_ID) values (0,5,'qwer');
REM INSERTING into KOSTA_PRJ.REVIEW_REPLY
SET DEFINE OFF;
Insert into KOSTA_PRJ.REVIEW_REPLY (REV_RNO,REV_NO,REPLY,REPLYER,REPLYDATE,UPDATEDATE,USER_ID) values (13,1,'dsafasdfafdsadfafd','asdf',to_date('22/12/21','RR/MM/DD'),to_date('22/12/21','RR/MM/DD'),'asdf');
Insert into KOSTA_PRJ.REVIEW_REPLY (REV_RNO,REV_NO,REPLY,REPLYER,REPLYDATE,UPDATEDATE,USER_ID) values (11,1,'asdf','asdf',to_date('22/12/21','RR/MM/DD'),to_date('22/12/21','RR/MM/DD'),'asdf');
Insert into KOSTA_PRJ.REVIEW_REPLY (REV_RNO,REV_NO,REPLY,REPLYER,REPLYDATE,UPDATEDATE,USER_ID) values (12,1,'asdfa','asdf',to_date('22/12/21','RR/MM/DD'),to_date('22/12/21','RR/MM/DD'),'asdf');
Insert into KOSTA_PRJ.REVIEW_REPLY (REV_RNO,REV_NO,REPLY,REPLYER,REPLYDATE,UPDATEDATE,USER_ID) values (20,1,'asfdzz','1234',to_date('22/12/21','RR/MM/DD'),to_date('22/12/21','RR/MM/DD'),'1234');
Insert into KOSTA_PRJ.REVIEW_REPLY (REV_RNO,REV_NO,REPLY,REPLYER,REPLYDATE,UPDATEDATE,USER_ID) values (21,4,'�ʹ����ƿ�~','asdf',to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),'asdf');
Insert into KOSTA_PRJ.REVIEW_REPLY (REV_RNO,REV_NO,REPLY,REPLYER,REPLYDATE,UPDATEDATE,USER_ID) values (22,6,'dd','asdf',to_date('22/12/29','RR/MM/DD'),to_date('22/12/29','RR/MM/DD'),'asdf');
REM INSERTING into KOSTA_PRJ.USERS
SET DEFINE OFF;
Insert into KOSTA_PRJ.USERS (ID,USERNAME,NICKNAME,PWD,EMAIL,GENDER,STATUS,REGDATE,UPDATEDATE,DELETEDATE,PROFILE,PROFILE_OPEN,GRADE) values ('asdf','asdf','asdf','asdf','asdf1@naver.com','man','����',to_date('22/12/20','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),to_date('22/12/20','RR/MM/DD'),'20221221%2Fs_f62c2940-aad4-4ec3-9c7d-bad6e37214a2_thumb_1668155841_7383.jpg','Y',2);
Insert into KOSTA_PRJ.USERS (ID,USERNAME,NICKNAME,PWD,EMAIL,GENDER,STATUS,REGDATE,UPDATEDATE,DELETEDATE,PROFILE,PROFILE_OPEN,GRADE) values ('qwer','����','��������','qwer','qwer@naver.com','woman','Ż��',to_date('22/12/20','RR/MM/DD'),to_date('22/12/20','RR/MM/DD'),to_date('22/12/20','RR/MM/DD'),'20221222%2Fs_0b93fc23-16dd-4076-8035-ba2e12c2ae0e_replace.jpg','Y',1);
Insert into KOSTA_PRJ.USERS (ID,USERNAME,NICKNAME,PWD,EMAIL,GENDER,STATUS,REGDATE,UPDATEDATE,DELETEDATE,PROFILE,PROFILE_OPEN,GRADE) values ('4321','4321','4321','4321','forsomeday979797@naver.com','man','����',to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),'�⺻������.png','N',1);
Insert into KOSTA_PRJ.USERS (ID,USERNAME,NICKNAME,PWD,EMAIL,GENDER,STATUS,REGDATE,UPDATEDATE,DELETEDATE,PROFILE,PROFILE_OPEN,GRADE) values ('forsomeday97','����','����','k+forsomeday97','forsomeday97@naver.com','male','����',to_date('22/12/21','RR/MM/DD'),to_date('22/12/21','RR/MM/DD'),to_date('22/12/21','RR/MM/DD'),'�⺻�̹���.jpg','1',1);
Insert into KOSTA_PRJ.USERS (ID,USERNAME,NICKNAME,PWD,EMAIL,GENDER,STATUS,REGDATE,UPDATEDATE,DELETEDATE,PROFILE,PROFILE_OPEN,GRADE) values ('zxcv','zxcv','zxcv','zxcv','forsomeday97@naver.com','man','����',to_date('22/12/22','RR/MM/DD'),to_date('22/12/22','RR/MM/DD'),to_date('22/12/22','RR/MM/DD'),'�⺻������.png','N',1);
Insert into KOSTA_PRJ.USERS (ID,USERNAME,NICKNAME,PWD,EMAIL,GENDER,STATUS,REGDATE,UPDATEDATE,DELETEDATE,PROFILE,PROFILE_OPEN,GRADE) values ('xcvb','xcvb','xcvb','xcvb','forsomeday97@naver.com','man','����',to_date('22/12/22','RR/MM/DD'),to_date('22/12/22','RR/MM/DD'),to_date('22/12/22','RR/MM/DD'),'�⺻������.png','N',1);
Insert into KOSTA_PRJ.USERS (ID,USERNAME,NICKNAME,PWD,EMAIL,GENDER,STATUS,REGDATE,UPDATEDATE,DELETEDATE,PROFILE,PROFILE_OPEN,GRADE) values ('1111','1111','1111','1111','forsomeday97@naver.com','man','����',to_date('22/12/22','RR/MM/DD'),to_date('22/12/22','RR/MM/DD'),to_date('22/12/22','RR/MM/DD'),'20221223%2Fs_36f3c308-a29d-48f7-9aa7-c085ae890f46_%EB%8C%95%EB%8C%95.jpg','Y',1);
Insert into KOSTA_PRJ.USERS (ID,USERNAME,NICKNAME,PWD,EMAIL,GENDER,STATUS,REGDATE,UPDATEDATE,DELETEDATE,PROFILE,PROFILE_OPEN,GRADE) values ('2222','2222','2222','2222','forsomeday97@naver.com','man','����',to_date('22/12/22','RR/MM/DD'),to_date('22/12/22','RR/MM/DD'),to_date('22/12/22','RR/MM/DD'),'�⺻������.png','N',1);
Insert into KOSTA_PRJ.USERS (ID,USERNAME,NICKNAME,PWD,EMAIL,GENDER,STATUS,REGDATE,UPDATEDATE,DELETEDATE,PROFILE,PROFILE_OPEN,GRADE) values ('aaaa','aaaa','aaaa','aaaa','forsomeday97@naver.com','woman','Ż��',to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),to_date('22/12/26','RR/MM/DD'),'�⺻������.png','N',1);
Insert into KOSTA_PRJ.USERS (ID,USERNAME,NICKNAME,PWD,EMAIL,GENDER,STATUS,REGDATE,UPDATEDATE,DELETEDATE,PROFILE,PROFILE_OPEN,GRADE) values ('ssss','ssss','asdf','ssss','forsomeday97@naver.com','man','����',to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),'�⺻������.png','N',1);
Insert into KOSTA_PRJ.USERS (ID,USERNAME,NICKNAME,PWD,EMAIL,GENDER,STATUS,REGDATE,UPDATEDATE,DELETEDATE,PROFILE,PROFILE_OPEN,GRADE) values ('dddd','dddd','asdf','dddd','forsomeday97@naver.com','man','����',to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),'�⺻������.png','N',1);
Insert into KOSTA_PRJ.USERS (ID,USERNAME,NICKNAME,PWD,EMAIL,GENDER,STATUS,REGDATE,UPDATEDATE,DELETEDATE,PROFILE,PROFILE_OPEN,GRADE) values ('wwww','wwww','asdf','wwww','forsomeday97@naver.com','man','����',to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'),'�⺻������.png','N',1);
Insert into KOSTA_PRJ.USERS (ID,USERNAME,NICKNAME,PWD,EMAIL,GENDER,STATUS,REGDATE,UPDATEDATE,DELETEDATE,PROFILE,PROFILE_OPEN,GRADE) values ('abcd','abcd','abcd','abcd','forsomeday97@naver.com','man','����',to_date('22/12/26','RR/MM/DD'),to_date('22/12/26','RR/MM/DD'),to_date('22/12/26','RR/MM/DD'),'�⺻������.png','N',1);
--------------------------------------------------------
--  DDL for Index FRREP_FRNO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KOSTA_PRJ"."FRREP_FRNO_PK" ON "KOSTA_PRJ"."FREE_REPLY" ("FRNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index RVREPLY_REV_RNO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KOSTA_PRJ"."RVREPLY_REV_RNO_PK" ON "KOSTA_PRJ"."REVIEW_REPLY" ("REV_RNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MRE_MATE_REPLY_NO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KOSTA_PRJ"."MRE_MATE_REPLY_NO_PK" ON "KOSTA_PRJ"."MATE_REPLY" ("MATE_REPLY_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REHRT_RNO_UID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KOSTA_PRJ"."REHRT_RNO_UID_PK" ON "KOSTA_PRJ"."REVIEW_HEART" ("REV_NO", "USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index NOTICE_NNO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KOSTA_PRJ"."NOTICE_NNO_PK" ON "KOSTA_PRJ"."NOTICE" ("NNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MG_MANAGER_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KOSTA_PRJ"."MG_MANAGER_ID_PK" ON "KOSTA_PRJ"."MANAGER" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MHRT_MNO_UID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KOSTA_PRJ"."MHRT_MNO_UID_PK" ON "KOSTA_PRJ"."MATE_HEART" ("MATE_NO", "USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MATE_MATE_NO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KOSTA_PRJ"."MATE_MATE_NO_PK" ON "KOSTA_PRJ"."MATE" ("MATE_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPORT_REPORT_NO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KOSTA_PRJ"."REPORT_REPORT_NO_PK" ON "KOSTA_PRJ"."REPORT" ("REPORT_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index FREE_FNO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KOSTA_PRJ"."FREE_FNO_PK" ON "KOSTA_PRJ"."FREE" ("FNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index USERS_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KOSTA_PRJ"."USERS_ID_PK" ON "KOSTA_PRJ"."USERS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index QUEST_QNO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KOSTA_PRJ"."QUEST_QNO_PK" ON "KOSTA_PRJ"."QUESTIONS" ("QNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index RECOMMEND_REC_NO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KOSTA_PRJ"."RECOMMEND_REC_NO_PK" ON "KOSTA_PRJ"."RECOMMEND" ("REC_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MJ_MNO_UID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KOSTA_PRJ"."MJ_MNO_UID_PK" ON "KOSTA_PRJ"."MATE_JOIN" ("MATE_NO", "USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REVIEW_REV_NO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KOSTA_PRJ"."REVIEW_REV_NO_PK" ON "KOSTA_PRJ"."REVIEW" ("REV_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table MATE_JOIN
--------------------------------------------------------

  ALTER TABLE "KOSTA_PRJ"."MATE_JOIN" ADD CONSTRAINT "MJ_MNO_UID_PK" PRIMARY KEY ("MATE_NO", "USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "KOSTA_PRJ"."MATE_JOIN" MODIFY ("JNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table NOTICE
--------------------------------------------------------

  ALTER TABLE "KOSTA_PRJ"."NOTICE" ADD CONSTRAINT "NOTICE_NNO_PK" PRIMARY KEY ("NNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "KOSTA_PRJ"."NOTICE" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."NOTICE" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."NOTICE" MODIFY ("NNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPORT
--------------------------------------------------------

  ALTER TABLE "KOSTA_PRJ"."REPORT" ADD CONSTRAINT "REPORT_REPORT_NO_PK" PRIMARY KEY ("REPORT_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MATE_HEART
--------------------------------------------------------

  ALTER TABLE "KOSTA_PRJ"."MATE_HEART" ADD CONSTRAINT "MHRT_MNO_UID_PK" PRIMARY KEY ("MATE_NO", "USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "KOSTA_PRJ"."MATE_HEART" MODIFY ("LNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MATE_REPLY
--------------------------------------------------------

  ALTER TABLE "KOSTA_PRJ"."MATE_REPLY" ADD CONSTRAINT "MRE_MATE_REPLY_NO_PK" PRIMARY KEY ("MATE_REPLY_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "KOSTA_PRJ"."MATE_REPLY" MODIFY ("REPLYER" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."MATE_REPLY" MODIFY ("REPLY" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."MATE_REPLY" MODIFY ("MATE_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REVIEW
--------------------------------------------------------

  ALTER TABLE "KOSTA_PRJ"."REVIEW" ADD CONSTRAINT "REVIEW_REV_NO_PK" PRIMARY KEY ("REV_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "KOSTA_PRJ"."REVIEW" MODIFY ("MATE_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MATE
--------------------------------------------------------

  ALTER TABLE "KOSTA_PRJ"."MATE" ADD CONSTRAINT "MATE_MATE_NO_PK" PRIMARY KEY ("MATE_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "KOSTA_PRJ"."MATE" MODIFY ("LIKECNT" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."MATE" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."MATE" MODIFY ("ENDTIME" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."MATE" MODIFY ("STARTTIME" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."MATE" MODIFY ("ENDZONE" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."MATE" MODIFY ("STARTZONE" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."MATE" MODIFY ("PEOPLEMAXNUM" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."MATE" MODIFY ("PEOPLENUM" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."MATE" MODIFY ("MEETINGDATE" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."MATE" MODIFY ("MEETINGTIME" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."MATE" MODIFY ("MEETINGPLACE" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."MATE" MODIFY ("WRITER" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."MATE" MODIFY ("ACTIVITYNAME" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."MATE" MODIFY ("MATE_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table QUESTIONS
--------------------------------------------------------

  ALTER TABLE "KOSTA_PRJ"."QUESTIONS" ADD CONSTRAINT "QUEST_QNO_PK" PRIMARY KEY ("QNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "KOSTA_PRJ"."QUESTIONS" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."QUESTIONS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."QUESTIONS" MODIFY ("QNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MANAGER
--------------------------------------------------------

  ALTER TABLE "KOSTA_PRJ"."MANAGER" ADD CONSTRAINT "MG_MANAGER_ID_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REVIEW_REPLY
--------------------------------------------------------

  ALTER TABLE "KOSTA_PRJ"."REVIEW_REPLY" ADD CONSTRAINT "RVREPLY_REV_RNO_PK" PRIMARY KEY ("REV_RNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "KOSTA_PRJ"."REVIEW_REPLY" MODIFY ("REPLYER" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."REVIEW_REPLY" MODIFY ("REPLY" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."REVIEW_REPLY" MODIFY ("REV_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REVIEW_HEART
--------------------------------------------------------

  ALTER TABLE "KOSTA_PRJ"."REVIEW_HEART" ADD CONSTRAINT "REHRT_RNO_UID_PK" PRIMARY KEY ("REV_NO", "USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "KOSTA_PRJ"."REVIEW_HEART" MODIFY ("LNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "KOSTA_PRJ"."USERS" ADD CONSTRAINT "USERS_ID_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "KOSTA_PRJ"."USERS" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."USERS" MODIFY ("PWD" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."USERS" MODIFY ("NICKNAME" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."USERS" MODIFY ("USERNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FREE_REPLY
--------------------------------------------------------

  ALTER TABLE "KOSTA_PRJ"."FREE_REPLY" ADD CONSTRAINT "FRREP_FRNO_PK" PRIMARY KEY ("FRNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "KOSTA_PRJ"."FREE_REPLY" MODIFY ("WRITER" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."FREE_REPLY" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."FREE_REPLY" MODIFY ("FNO" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."FREE_REPLY" MODIFY ("FRNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RECOMMEND
--------------------------------------------------------

  ALTER TABLE "KOSTA_PRJ"."RECOMMEND" ADD CONSTRAINT "RECOMMEND_REC_NO_PK" PRIMARY KEY ("REC_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "KOSTA_PRJ"."RECOMMEND" MODIFY ("SIMPLEDESC" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."RECOMMEND" MODIFY ("ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."RECOMMEND" MODIFY ("RECNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FREE
--------------------------------------------------------

  ALTER TABLE "KOSTA_PRJ"."FREE" ADD CONSTRAINT "FREE_FNO_PK" PRIMARY KEY ("FNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "KOSTA_PRJ"."FREE" MODIFY ("WRITER" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."FREE" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."FREE" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "KOSTA_PRJ"."FREE" MODIFY ("FNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table FREE
--------------------------------------------------------

  ALTER TABLE "KOSTA_PRJ"."FREE" ADD CONSTRAINT "FREE_USERS_ID_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES "KOSTA_PRJ"."USERS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FREE_REPLY
--------------------------------------------------------

  ALTER TABLE "KOSTA_PRJ"."FREE_REPLY" ADD CONSTRAINT "FRPLY_FREE_FNO_FK" FOREIGN KEY ("FNO")
	  REFERENCES "KOSTA_PRJ"."FREE" ("FNO") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MATE_HEART
--------------------------------------------------------

  ALTER TABLE "KOSTA_PRJ"."MATE_HEART" ADD CONSTRAINT "MHR_MATE_MATE_NO_FK" FOREIGN KEY ("MATE_NO")
	  REFERENCES "KOSTA_PRJ"."MATE" ("MATE_NO") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MATE_JOIN
--------------------------------------------------------

  ALTER TABLE "KOSTA_PRJ"."MATE_JOIN" ADD CONSTRAINT "MJ_MATE_MATE_NO_FK" FOREIGN KEY ("MATE_NO")
	  REFERENCES "KOSTA_PRJ"."MATE" ("MATE_NO") ON DELETE CASCADE ENABLE;
  ALTER TABLE "KOSTA_PRJ"."MATE_JOIN" ADD CONSTRAINT "MJ_USERS_ID_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES "KOSTA_PRJ"."USERS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MATE_REPLY
--------------------------------------------------------

  ALTER TABLE "KOSTA_PRJ"."MATE_REPLY" ADD CONSTRAINT "MRPLY_MATE_MATE_NO_FK" FOREIGN KEY ("MATE_NO")
	  REFERENCES "KOSTA_PRJ"."MATE" ("MATE_NO") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RECOMMEND
--------------------------------------------------------

  ALTER TABLE "KOSTA_PRJ"."RECOMMEND" ADD CONSTRAINT "REC_USERS_ID_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES "KOSTA_PRJ"."USERS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPORT
--------------------------------------------------------

  ALTER TABLE "KOSTA_PRJ"."REPORT" ADD CONSTRAINT "REP_MATE_MATE_NO_FK" FOREIGN KEY ("MATE_NO")
	  REFERENCES "KOSTA_PRJ"."MATE" ("MATE_NO") ON DELETE CASCADE ENABLE;
  ALTER TABLE "KOSTA_PRJ"."REPORT" ADD CONSTRAINT "REP_USERS_ID_FK" FOREIGN KEY ("REPORT_USER_ID")
	  REFERENCES "KOSTA_PRJ"."USERS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REVIEW
--------------------------------------------------------

  ALTER TABLE "KOSTA_PRJ"."REVIEW" ADD CONSTRAINT "REVIEW_MJ_MNO_UID_FK" FOREIGN KEY ("MATE_NO", "USER_ID")
	  REFERENCES "KOSTA_PRJ"."MATE_JOIN" ("MATE_NO", "USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REVIEW_HEART
--------------------------------------------------------

  ALTER TABLE "KOSTA_PRJ"."REVIEW_HEART" ADD CONSTRAINT "RVHRT_REV_REV_NO_FK" FOREIGN KEY ("REV_NO")
	  REFERENCES "KOSTA_PRJ"."REVIEW" ("REV_NO") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REVIEW_REPLY
--------------------------------------------------------

  ALTER TABLE "KOSTA_PRJ"."REVIEW_REPLY" ADD CONSTRAINT "RVPLY_REV_REV_NO_FK" FOREIGN KEY ("REV_NO")
	  REFERENCES "KOSTA_PRJ"."REVIEW" ("REV_NO") ON DELETE CASCADE ENABLE;
