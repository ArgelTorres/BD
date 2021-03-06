DROP TABLE ARG.BILLING_E CASCADE CONSTRAINTS;

CREATE TABLE ARG.BILLING_E
(
  BILLING_ADDRESS_LINE_1  VARCHAR2(100 BYTE),
  BILLING_ADDRESS_LINE_2  VARCHAR2(100 BYTE),
  BILLING_CITY            VARCHAR2(100 BYTE),
  BILLING_STATE_PROVINCE  VARCHAR2(100 BYTE),
  BILLING_COUNTRY         VARCHAR2(100 BYTE),
  BILLING_POSTAL_CODE     NUMBER,
  BILLING_ID              INTEGER
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING;


DROP TABLE ARG.CITY CASCADE CONSTRAINTS;

CREATE TABLE ARG.CITY
(
  ADDRESS_ID        INTEGER,
  ADDRESS_TYPE      VARCHAR2(100 BYTE),
  ADDRESS_LINE_1    VARCHAR2(100 BYTE),
  ADDRESS_LINE_2    VARCHAR2(100 BYTE),
  CITY              VARCHAR2(100 BYTE),
  STATE_PROVINCE    VARCHAR2(100 BYTE),
  COUNTRY           VARCHAR2(100 BYTE),
  POSTAL_CODE       NUMBER,
  ADDRESS_LINE_NUM  NUMBER
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING;


ALTER TABLE ARG.CLIENTS_E
 DROP PRIMARY KEY CASCADE;

DROP TABLE ARG.CLIENTS_E CASCADE CONSTRAINTS;

CREATE TABLE ARG.CLIENTS_E
(
  FIRST_NAME     VARCHAR2(100 BYTE),
  LAST_NAME      VARCHAR2(100 BYTE),
  COMPANY_NAME   VARCHAR2(100 BYTE),
  CLIENT_ID      INTEGER,
  EMAIL_ADDRESS  VARCHAR2(100 BYTE),
  ADDRESS_ID     INTEGER,
  BILLING_ID     INTEGER
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING;


DROP TABLE ARG.ORDERS_E CASCADE CONSTRAINTS;

CREATE TABLE ARG.ORDERS_E
(
  ORDERID      INTEGER,
  ORDER_DATE   VARCHAR2(100 BYTE),
  SHIP_METHOD  VARCHAR2(100 BYTE),
  ORDER_QTY    NUMBER,
  CLIENT_ID    INTEGER
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING;


DROP TABLE ARG.PRODUCTS_E CASCADE CONSTRAINTS;

CREATE TABLE ARG.PRODUCTS_E
(
  PRODUCT_ID           INTEGER,
  PRODUCT_NAME         VARCHAR2(100 BYTE),
  PRODUCT_COLOR        VARCHAR2(100 BYTE),
  PRODUCT_SIZE         VARCHAR2(100 BYTE),
  PRODUCT_WEIGHT       VARCHAR2(100 BYTE),
  PRODUCT_CATEGORY     VARCHAR2(100 BYTE),
  LIST_PRICE           NUMBER,
  CULTURE              VARCHAR2(100 BYTE),
  CULTURE_DESCRIPTION  VARCHAR2(100 BYTE)
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING;


DROP TABLE ARG.SALES_PRODUCTS_E CASCADE CONSTRAINTS;

CREATE TABLE ARG.SALES_PRODUCTS_E
(
  PRODUCT_ID  INTEGER,
  UNIT_PRICE  NUMBER,
  TAX_AMOUNT  NUMBER,
  SHIPPING    NUMBER,
  SUBTOTAL    NUMBER
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING;


CREATE UNIQUE INDEX ARG.CONST ON ARG.CLIENTS_E
(CLIENT_ID)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE ARG.CLIENTS_E ADD (
  CONSTRAINT CONST
  PRIMARY KEY
  (CLIENT_ID)
  USING INDEX ARG.CONST
  ENABLE VALIDATE);
