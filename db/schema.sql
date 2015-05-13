CREATE TABLE IF NOT EXISTS shirts (
	id INTEGER PRIMARY KEY,
	name TEXT, 
  	image TEXT,
	quantity INTEGER,
	price TEXT
);

CREATE TABLE IF NOT EXISTS buyers (
	id INTEGER PRIMARY KEY,
	email TEXT, 
  	p_quantity INTEGER,
 	s_id INTEGER
);