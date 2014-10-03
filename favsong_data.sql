-- find one record from a table by id
-- select all the records from a table
-- need to know how to create a table
-- need to know how to delete records
-- update records on a table

\c favsongs

INSERT INTO artists (name,alive)
  VALUES 
  ('Adelle',true),
  ('Al Green',true),
  ('The Album Leaf',true),
  ('Alicia Keys',true),
  ('Amy Winehouse',false),
  ('The Animals',false),
  ('Anthony Hamilton',true),
  ('Aphex Twin',true),
  ('Arcade Fire',true),
  ('Aretha Franklin',true),
  ('Arturo Sandoval',true),
  ('Atoms for Peace',true),
  ('Audioslave',true),
  ('Barenaked Ladies',true),
  ('Beastie Boys',true),
  ('The Beatles',true),
  ('Ben Folds Five',true),
  ('Billie Holiday',false),
  ('The Black Keys',true),
  ('Black Sabbath',true),
  ('Bob Dylan',true),
  ('Bob Marley',false),
  ('Bon Iver',true),
  ('Cee Lo Green',true),
  ('Coldplay',true),
  ('Cream',true),
  ('Crystal Method',true),
  ('Daft Punk',true),
  ('David Bowie',true),
  ('The Doors',false),
  ('El Ten Eleven',true),
  ('Florence + The Machine',true),
  ('Franz Ferdinand',true),
  ('Gary Clark Jr.',true),
  ('Gorillaz',true),
  ('Grouplove',true),
  ('Imagine Dragons',true),
  ('Jack White',true),
  ('Jay Z',true),
  ('Jimmy Cliff',true),
  ('John Coltrane',false),
  ('John Lee Hooker',false),
  ('John Lennon',false),
  ('Johnny Cash',false),
  ('Justin Timberlake',true),
  ('Kanye West',true),
  ('Kings Of Leon',true),
  ('The Killers',true),
  ('Led Zeppelin',true),
  ('Maroon 5',true),
  ('MGMT',true),
  ('Miles Davis',false),
  ('Moby',true),
  ('Mos Def',true),
  ('Nirvana',true),
  ('Pato Banton',true),
  ('Pearl Jam',true),
  ('Peter Tosh',false),
  ('The Police',true),
  ('The Postal Service',true),
  ('Radiohead',true),
  ('Raphael Saadiq',true),
  ('Red Hot Chili Peppers',true),
  ('The Rolling Stones',true),
  ('The Roots',true),
  ('The Shins',true),
  ('The Smiths',true),
  ('Talib Kweli',true),
  ('Thom Yorke',true),
  ('Van Morrison',true),
  ('Wu Tang Clan',true);

WITH ins (artist, song, album, time, rating) AS
(VALUES
  ('Led Zeppelin','Bron-Y-Aur Stomp','Led Zeppelin III','00:04:16',4),
  ('Led Zeppelin','Ten Years Gone','Physical Graffiti','00:06:33',5),
  ('Arcade Fire','Wake Up','Funeral','00:05:35',5),
  ('Radiohead','Jigsaw Falling Into Place','In Rainbows','00:04:09',5),
  ('Van Morrison','Virgo Clowns','His Band And The Street Choir','00:04:14',5),
  ('Arcade Fire','Ocean of Noise','Neon Bible','00:04:54',4),
  ('Raphael Saadiq','Go to Hell','Stone Rollin''','00:04:19',5),
  ('Radiohead','House of Cards','In Rainbows','00:05:28',4),
  ('The Shins','Sleeping Lessons','Wincing the Night Away','00:03:58',3),
  ('Bon Iver','Lump Sum','For Emma, Forever Ago','00:03:21',3),
  ('Arcade Fire','The Suburbs','The Suburbs','00:05:15',4),
  ('The Doors','Maggie M''Gill','Morrison Hotel','00:04:22',3),
  ('The Black Keys','Tighten Up','Brothers','00:03:31',3),
  ('The Rolling Stones','Can''t You Hear Me Knocking','Sticky Fingers','00:07:14',4),
  ('Mos Def','Climb','Black On Both Sides','00:04:02',4),
  ('Kanye West','Power','My Beautiful Dark Twisted Fantasy','00:04:52',3),
  ('The Postal Service','Brand New Colony','Give Up','00:04:13',5),
  ('Atoms for Peace','Atoms for Peace','The Eraser','00:05:14',5),
  ('The Black Keys','Little Black Submarines','El Camino','00:04:11',5),
  ('Florence + The Machine','Dog Days Are Over','Lungs','00:04:12',5),
  ('Bob Marley','Put It On','African Herbsman','00:03:34',5),
  ('Gorillaz','Man Research (Clapper)','Gorillaz','00:04:30',5)
)
INSERT INTO songs
  (artist_id, song, album, time, rating)
SELECT 
  artists.id, ins.song, ins.album, ins.time::time, ins.rating
FROM 
  artists JOIN ins
    ON ins.artist = artists.name;



