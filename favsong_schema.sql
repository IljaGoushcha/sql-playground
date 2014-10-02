DROP DATABASE IF EXISTS favsongs;
CREATE DATABASE favsongs;
\c favsongs

CREATE TABLE artists(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  alive BOOLEAN
);

CREATE INDEX ON artists (name);

CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  song TEXT NOT NULL,
  album TEXT NOT NULL,
  time TIME,
  rating INTEGER,
  artist_id INTEGER REFERENCES artists
);

CREATE INDEX ON songs (song);
CREATE INDEX ON songs (album);
CREATE INDEX ON songs (time);
CREATE INDEX ON songs (rating);

