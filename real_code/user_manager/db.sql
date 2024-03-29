CREATE DATABASE IF NOT EXISTS usermgt;

USE usermgt;

CREATE TABLE IF NOT EXISTS groups(
	GNAME varchar(256) NOT NULL,
	TAG varchar(256),
	PRIMARY KEY(GNAME, TAG)
);

CREATE TABLE IF NOT EXISTS users(
	FNAME varchar(256) NOT NULL,
	LNAME varchar(256),
	EMAIL varchar(256) NOT NULL,
	PRIMARY KEY(EMAIL)
);

CREATE TABLE IF NOT EXISTS mappings(
	GNAME varchar(256) NOT NULL,
	EMAIL varchar(256) NOT NULL,
	PRIMARY KEY(GNAME, EMAIL),
	FOREIGN KEY(EMAIL) REFERENCES users(EMAIL)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY(GNAME) REFERENCES groups(GNAME) 
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

INSERT IGNORE INTO groups(GNAME) values('default');
