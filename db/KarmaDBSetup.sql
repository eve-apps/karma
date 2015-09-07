create user "karma_app_db" with password '!@jjS234ffJ';

CREATE DATABASE "Karma"
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'English_United States.1252'
       LC_CTYPE = 'English_United States.1252'
       CONNECTION LIMIT = -1;


grant all privileges on database "Karma" to "karma_app_db";