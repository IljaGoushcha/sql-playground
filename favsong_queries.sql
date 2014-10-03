\c favsongs

SELECT a.name, s.song, s.album, s.time 
  FROM artists a, songs s
  WHERE S.artist_id = a.id;
/*
           name          |            song            |               album               |   time   
 ------------------------+----------------------------+-----------------------------------+----------
  Arcade Fire            | The Suburbs                | The Suburbs                       | 00:05:15
  Arcade Fire            | Ocean of Noise             | Neon Bible                        | 00:04:54
  Arcade Fire            | Wake Up                    | Funeral                           | 00:05:35
  Atoms for Peace        | Atoms for Peace            | The Eraser                        | 00:05:14
  The Black Keys         | Little Black Submarines    | El Camino                         | 00:04:11
  The Black Keys         | Tighten Up                 | Brothers                          | 00:03:31
  Bob Marley             | Put It On                  | African Herbsman                  | 00:03:34
  Bon Iver               | Lump Sum                   | For Emma, Forever Ago             | 00:03:21
  The Doors              | Maggie M'Gill              | Morrison Hotel                    | 00:04:22
  Florence + The Machine | Dog Days Are Over          | Lungs                             | 00:04:12
  Gorillaz               | Man Research (Clapper)     | Gorillaz                          | 00:04:30
  Kanye West             | Power                      | My Beautiful Dark Twisted Fantasy | 00:04:52
  Led Zeppelin           | Ten Years Gone             | Physical Graffiti                 | 00:06:33
  Led Zeppelin           | Bron-Y-Aur Stomp           | Led Zeppelin III                  | 00:04:16
  Mos Def                | Climb                      | Black On Both Sides               | 00:04:02
  The Postal Service     | Brand New Colony           | Give Up                           | 00:04:13
  Radiohead              | House of Cards             | In Rainbows                       | 00:05:28
  Radiohead              | Jigsaw Falling Into Place  | In Rainbows                       | 00:04:09
  Raphael Saadiq         | Go to Hell                 | Stone Rollin'                     | 00:04:19
  The Rolling Stones     | Can't You Hear Me Knocking | Sticky Fingers                    | 00:07:14
  The Shins              | Sleeping Lessons           | Wincing the Night Away            | 00:03:58
  Van Morrison           | Virgo Clowns               | His Band And The Street Choir     | 00:04:14

*/

SELECT artists.name, songs.song, songs.album, songs.rating 
  FROM songs
  LEFT JOIN artists
  ON (songs.artist_id = artists.id)
  ORDER BY songs.rating DESC;
/*
          name          |            song            |               album               | rating 
------------------------+----------------------------+-----------------------------------+--------
 The Postal Service     | Brand New Colony           | Give Up                           |      5
 Led Zeppelin           | Ten Years Gone             | Physical Graffiti                 |      5
 Arcade Fire            | Wake Up                    | Funeral                           |      5
 Atoms for Peace        | Atoms for Peace            | The Eraser                        |      5
 The Black Keys         | Little Black Submarines    | El Camino                         |      5
 Van Morrison           | Virgo Clowns               | His Band And The Street Choir     |      5
 Bob Marley             | Put It On                  | African Herbsman                  |      5
 Raphael Saadiq         | Go to Hell                 | Stone Rollin'                     |      5
 Radiohead              | Jigsaw Falling Into Place  | In Rainbows                       |      5
 Florence + The Machine | Dog Days Are Over          | Lungs                             |      5
 Gorillaz               | Man Research (Clapper)     | Gorillaz                          |      5
 Arcade Fire            | The Suburbs                | The Suburbs                       |      4
 Arcade Fire            | Ocean of Noise             | Neon Bible                        |      4
 Led Zeppelin           | Bron-Y-Aur Stomp           | Led Zeppelin III                  |      4
 Mos Def                | Climb                      | Black On Both Sides               |      4
 Radiohead              | House of Cards             | In Rainbows                       |      4
 The Rolling Stones     | Can't You Hear Me Knocking | Sticky Fingers                    |      4
 The Doors              | Maggie M'Gill              | Morrison Hotel                    |      3
 Bon Iver               | Lump Sum                   | For Emma, Forever Ago             |      3
 The Black Keys         | Tighten Up                 | Brothers                          |      3
 Kanye West             | Power                      | My Beautiful Dark Twisted Fantasy |      3
 The Shins              | Sleeping Lessons           | Wincing the Night Away            |      3
*/


SELECT artists.name, songs.song, songs.rating FROM songs
LEFT JOIN artists
ON (songs.artist_id = artists.id)
WHERE (songs.rating = 5);
/*
          name          |           song            | rating 
------------------------+---------------------------+--------
 Arcade Fire            | Wake Up                   |      5
 Atoms for Peace        | Atoms for Peace           |      5
 The Black Keys         | Little Black Submarines   |      5
 Bob Marley             | Put It On                 |      5
 Florence + The Machine | Dog Days Are Over         |      5
 Gorillaz               | Man Research (Clapper)    |      5
 Led Zeppelin           | Ten Years Gone            |      5
 The Postal Service     | Brand New Colony          |      5
 Radiohead              | Jigsaw Falling Into Place |      5
 Raphael Saadiq         | Go to Hell                |      5
 Van Morrison           | Virgo Clowns              |      5
*/

SELECT songs.song, songs.album FROM songs
LEFT JOIN artists
ON (songs.artist_id = artists.id)
WHERE (artists.name = 'Led Zeppelin');
/*
       song       |       album       
------------------+-------------------
 Ten Years Gone   | Physical Graffiti
 Bron-Y-Aur Stomp | Led Zeppelin III
*/

SELECT a.name, s.song, s.rating, MIN(s.rating)
FROM songs s
JOIN artists a ON a.id = s.artist_id
WHERE a.name = 'Kanye West'
GROUP BY a.name, s.song,s.rating;
/*
    name    | song  | rating | min 
------------+-------+--------+-----
 Kanye West | Power |      3 |   3
*/



-- create a trigger that deletes a song that corresponds to the artist 
-- if we delete an artist from the artist table
CREATE FUNCTION delete_songs() RETURNS TRIGGER AS $_$
BEGIN
  DELETE FROM songs WHERE songs.artist_id = OLD.id;
  RETURN OLD;
END $_$ LANGUAGE plpgsql;

CREATE TRIGGER delete_artist_songs 
BEFORE DELETE 
ON artists 
FOR EACH ROW EXECUTE PROCEDURE delete_songs();

SELECT artists.id, artists.name FROM artists
  WHERE artists.name = 'Kanye West';

-- DELETE FROM artists WHERE name = 'Kanye West';

-- SELECT * FROM songs;

































