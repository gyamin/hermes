-- users テーブル
CREATE TABLE users (
  id SERIAL PRIMARY KEY ,
  first_name CHAR VARYING NOT NULL ,
  last_name CHAR VARYING NOT NULL ,
  mail_address CHAR VARYING NOT NULL ,
  password CHAR VARYING NOT NULL,
  company_id BIGINT ,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP ,
  UNIQUE(mail_address)
);