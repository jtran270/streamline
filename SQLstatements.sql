-- SELECT:
-- Find name of playlist created by the listener
SELECT PlaylistName
FROM CreatePlaylist
WHERE CreatePlaylist.UserID = getUserID() -- UserID passed from view


-- JOIN:
-- Output playlist name, and all song-related info for user logged in
SELECT PIS.songname, AID.stagename, A.albumname, CS.tracklength
FROM playlistincludessongs PIS
JOIN containsong CS ON CS.albumid = PIS.albumid AND CS.songname = PIS.songname
JOIN Album A ON A.albumid = CS.albumid 
JOIN createalbum CA ON CA.albumid = A.albumid
JOIN ArtistUserId AID ON AID.userid = CA.userid
WHERE PIS.playlistname = 'Babe coming over' --(replace with playlistname)


-- Find all songs under chosen genre
-- genre = 'Deep House';
SELECT CS.SongName, AID.stagename, A.albumname
FROM ContainSong CS
JOIN havesongs HS ON HS.albumid = CS.albumid AND HS.songname = CS.songname
JOIN Album A ON A.albumid = CS.albumid 
JOIN createalbum CA ON CA.albumid = A.albumid
JOIN ArtistUserId AID ON AID.userid = CA.userid
WHERE HS.genrename = 'Deep House' --(replace with genre selection)



-- AGGREGATION:
-- Find total number of songs in the user playlist
SELECT COUNT(*)
FROM playlistincludessongs PIS
JOIN CreatePlaylist CP ON 
	PIS.UserID = CP.UserID AND 
	PIS.PlaylistName = CP.PlaylistName
JOIN ListenerUserID LID ON CP.UserID = LID.UserID
WHERE PIS.UserID = 6
-- AND PIS.playlistname = 'Chill'


-- NESTED AGGREGATE WITH GROUP-BY:
-- Return user's playlist and number of songs in those playlists by a specific artist (stagename)
SELECT PIS.playlistname, AID.stagename, COUNT(*)
FROM playlistincludessongs PIS
JOIN containsong CS ON CS.albumid = PIS.albumid AND CS.songname = PIS.songname
JOIN havesongs HS ON HS.albumid = CS.albumid AND HS.songname = CS.songname
JOIN album A ON A.albumid = CS.albumid
JOIN createalbum CA ON CA.albumid = A.albumid
JOIN artistuserid AID ON AID.userid = CA.userid
WHERE PIS.userid = 9 AND AID.stagename = 'a' --pass values for userID and artist's stagename
GROUP BY PIS.playlistname, AID.stagename



/* insert these before running query
INSERT INTO havesongs VALUES (5, '7-11', 'House');
INSERT INTO havesongs VALUES (4, 'BossMama', 'House');
INSERT INTO havesongs VALUES (1, 'Bliss', 'Trap');
INSERT INTO havesongs VALUES (3, 'I am a sinner', 'Rap');
INSERT INTO havesongs VALUES (2, 'Cries', 'Trap');
*/




-- UPDATE:
-- Change all Artist StageName to StageNameEdit (input)
UPDATE ArtistUserID
SET StageName = 'JCUBE2' --input2
WHERE StageName = 'JCUBE' --input1

UPDATE ArtistName
SET StageName = 'JCUBE2' --input2
WHERE StageName = 'JCUBE' --input1




-- DELETE:
-- Delete song from user's playlists (still remains in DB though)
DELETE FROM playlistincludessongs
WHERE UserID = 9 --get userID from view 
	AND SongName = 'Jouse Flow' --input songname or select songname from list

-- Delete user's chosen playlist
-- parent table createplaylist deletes child table playlistincludessongs's entries
DELETE FROM createplaylist 
WHERE userid = 9 --get userID from view
	AND playlistname = 'Favorites' --input playlistname or select playlistname from list

/*
INSERT INTO createplaylist VALUES (9, 'Favorites')
INSERT INTO playlistincludessongs VALUES (2, 'Trap Nation', 9, 'Favorites')
*/




-- DIVISION:
-- Return songs and their info that are in ALL of playlists 
-- select song names such that there is no user that does not have the song in their playlist"
SELECT DISTINCT CS.SongName, AID.stagename, A.albumname, CS.tracklength
FROM containsong CS 
JOIN playlistincludessongs PIS ON PIS.songname = CS.songname AND PIS.albumid = CS.albumid
JOIN Album A ON A.albumid = CS.albumid 
JOIN createalbum CA ON CA.albumid = A.albumid
JOIN ArtistUserId AID ON AID.userid = CA.userid
WHERE 
	NOT EXISTS (
		(SELECT CP.UserID, CP.playlistname
		FROM CreatePlaylist CP
		WHERE CP.playlistname IN (
			SELECT playlistname
			FROM createplaylist
			WHERE userid = 9) --make this value the userID from login page
		)

		EXCEPT

		(SELECT PIS.userid, PIS.playlistname
		FROM playlistincludessongs PIS, createplaylist CP
		WHERE PIS.SongName = CS.SongName AND
			PIS.playlistname = CP.playlistname AND
			PIS.userid = CP.userid)
	)


/* insert all of these first before querying
INSERT INTO playlistincludessongs VALUES (1, 'Bliss', 6, 'Chill');
INSERT INTO playlistincludessongs VALUES (1, 'Bliss', 8, 'Sad song for a sad boi');
INSERT INTO playlistincludessongs VALUES (1, 'Bliss', 9, 'Study playlist');
INSERT INTO playlistincludessongs VALUES (1, 'Bliss', 9, 'Moms home playlist');
INSERT INTO playlistincludessongs VALUES (1, 'Bliss', 10, 'Gospels only Praise the Holy Father');
INSERT INTO playlistincludessongs VALUES (1, 'Bliss', 9, 'Favorites');
*/


/* test queries 
DELETE FROM playlistincludessongs
WHERE playlistname = 'Chill' AND songname = 'Bliss'

INSERT INTO playlistincludessongs VALUES (1, 'Bliss', 6, 'Chill');

SELECT * FROM playlistincludessongs
WHERE songname = 'Bliss'
ORDER BY userid
*/


