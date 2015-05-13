DROP TABLE IF EXISTS shirts;
CREATE TABLE shirts (
	id INTEGER PRIMARY KEY,
	name TEXT, 
  	image TEXT,
	quantity INTEGER,
	price REAL
);

DROP TABLE IF EXISTS buyers;
CREATE TABLE buyers (
	id INTEGER PRIMARY KEY,
	email TEXT, 
  	p_quantity INTEGER,
 	s_id INTEGER
);