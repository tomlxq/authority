
DROP TABLE IF EXISTS t_base_module;
DROP TABLE IF EXISTS t_base_role;
DROP TABLE IF EXISTS t_base_role_module;
DROP TABLE IF EXISTS t_base_user;
DROP TABLE IF EXISTS t_base_user_role;
DROP TABLE IF EXISTS t_base_field;


CREATE TABLE t_base_module (
  id bigint generated by default as identity,
  module_name varchar(64) NOT NULL,
  module_url varchar(64) DEFAULT NULL,
  parent_id int(10)  DEFAULT NULL,
  leaf int(1)  DEFAULT NULL,
  expanded int(1)  DEFAULT NULL,
  display_index int(2)  DEFAULT NULL,
  is_display int(1)  DEFAULT NULL,
  en_module_name varchar(64) DEFAULT NULL,
  icon_css varchar(128) DEFAULT NULL,
  information varchar(128) DEFAULT NULL,
  parent_url bigint(20) DEFAULT NULL,
  PRIMARY KEY (id)
);


CREATE TABLE t_base_role (
  id bigint generated by default as identity,
  role_name varchar(64) DEFAULT NULL ,
  role_desc varchar(128) DEFAULT NULL ,
  PRIMARY KEY (id)
);

CREATE TABLE t_base_role_module (
  id bigint generated by default as identity,
  role_id int(10)  DEFAULT NULL ,
  module_id int(10)  DEFAULT NULL ,
  PRIMARY KEY (id)
) ;

CREATE TABLE t_base_user (
  id bigint generated by default as identity,
  account varchar(64) NOT NULL ,
  password varchar(128) NOT NULL ,
  real_name varchar(64) DEFAULT NULL ,
  sex int(1)  DEFAULT NULL ,
  email varchar(64) DEFAULT NULL ,
  mobile varchar(32) DEFAULT NULL ,
  office_phone varchar(32) DEFAULT NULL ,
  error_count int(2)  DEFAULT '0' ,
  last_login_time timestamp NOT NULL ,
  last_login_ip varchar(32) DEFAULT NULL ,
  remark varchar(128) DEFAULT NULL ,
  PRIMARY KEY (id)
);

CREATE TABLE t_base_user_role (
  id bigint generated by default as identity,
  user_id int(10) DEFAULT NULL ,
  role_id int(10) DEFAULT NULL ,
  PRIMARY KEY (id)
);

CREATE TABLE t_base_field (
  id bigint generated by default as identity,
  field varchar(64) DEFAULT NULL,
  field_name varchar(128) DEFAULT NULL,
  value_field varchar(128) DEFAULT NULL,
  display_field varchar(128) DEFAULT NULL,
  enabled int(2) DEFAULT NULL,
  sort int(2) DEFAULT NULL,
  PRIMARY KEY (id)
);
