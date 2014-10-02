SELECT a.name, s.song, s.album, s.time 
  FROM artists a, songs s
  WHERE S.artist_id = a.id;


/*
 id |       song       |       album       |   time   | rating | artist_id | id |     name     | alive 
----+------------------+-------------------+----------+--------+-----------+----+--------------+-------
  1 | Ten Years Gone   | Physical Graffiti | 00:06:33 |      5 |         1 |  1 | Led Zeppelin | t
  2 | Bron-Y-Aur Stomp | Led Zeppelin III  | 00:04:16 |      4 |         1 |  1 | Led Zeppelin | t
  3 | Wake Up          | Funeral           | 00:05:35 |      5 |         6 |  6 | Arcade Fire  | t

*/


