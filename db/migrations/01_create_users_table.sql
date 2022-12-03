CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR ( 30 ) UNIQUE,
  name text,
  email VARCHAR ( 60 ) UNIQUE,
  password VARCHAR ( 30 ));

