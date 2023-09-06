CREATE DATABASE estudent_database;

\c estudent_database;

CREATE TABLE course (
 id SERIAL,
 name_course CHARACTER VARYING(50) NOT NULL,
 last_name CHARACTER VARYING(50) NOT NULL,
 start_date TIMESTAMP NOT NULL,
 complete_date TIMESTAMP NOT NULL
);

CREATE TABLE student ( 
 id SERIAL,
 name CHARACTER VARYING(50) NOT NULL,
 last_name CHARACTER VARYING(50) NOT NULL,
 gender CHARACTER VARYING(50) NOT NULL,
 address CHARACTER VARYING(50) NOT NULL
);

CREATE TABLE professor (
 id SERIAL,
 name CHARACTER VARYING(50) NOT NULL,
 last_name CHARACTER VARYING(50) NOT NULL,
 specialization CHARACTER VARYING(50) NOT NULL,
 email CHARACTER VARYING(50) NOT NULL
);
