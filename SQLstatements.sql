--HOW TO RUN .sql FILES:
./psql --username=sl_admin -f C:/School/'SFU 3'/streamline/sqlTest.sql streamline_db
./psql --username=sl_admin




-- JOIN:
-- Find name of playlist created by the listener
SELECT PlaylistName
FROM CreatePlaylist
WHERE CreatePlaylist.UserID = getUserID() -- UserID passed from view

-- Output SongName, Artist StageName, and TrackLength in the user playlist
-- returnPlaylistName = whatever PlaylistName is returned from above query

SELECT CS.SongName, AID.StageName, CS.TrackLength
FROM ContainSong CS, ArtistUserID AID
JOIN CreateAlbum C ON 
	CS.AlbumID = C.AlbumID AND 
	C.UserID = AID.UserID AND

	-- test this part
	returnPlaylistName IN (
		SELECT PlaylistName 
		FROM Include
		WHERE UserID = AID.UserID)



-- Find all songs under chosen genre
-- genre = 'Techno';
SELECT SongName
FROM ContainSong, Genre
WHERE ContainSong.SongName = Genre.SongName AND
	Genre.GenreName = getGenreName()




-- AGGREGATION:
-- Find total number of songs in the user playlist
SELECT COUNT(*)
FROM Include 
JOIN CreatePlaylist ON 
	Include.UserID = CreatePlaylist.UserID AND 
	Include.PlaylistName = CreatePlaylist.PlaylistName
JOIN ListenerUserID ON CreatePlaylist.UserID = ListenerUserID.UserID
WHERE Include.UserID = getUserID()



-- NESTED AGGREGATE WITH GROUP-BY:
-- Return names of all songs in a specified genre that has more than 5 songs within that genre
SELECT CS.SongName
FROM ContainSong CS
WHERE CS.SongName IN (
	SELECT H.SongName
	FROM Have H
	WHERE H.GenreName = getGenreName()
	GROUP BY H.GenreName
	HAVING COUNT(*) > 5)



-- UPDATE:
-- Change all Artist StageName to StageNameEdit (input)
UPDATE ArtistUserID
SET StageName = StageNameEdit

UPDATE ArtistName
SET StageName = StageNameEdit


-- DELETE:
-- Delete song from user's playlists 
-- (still remains in DB though)
DELETE FROM Include
WHERE UserID = getUserID() AND
	SongName = inputSongName()



-- DIVISION:
-- Return songs that are in ALL of playlists 

-- // select song names such that there is no user that does not have the song in their playlist 
SELECT CS.SongName
FROM ContainSong CS
WHERE NOT EXISTS (
	(SELECT CP.UserID FROM CreatePlaylist CP)
--or(SELECT CP.PlaylistName FROM CreatePlaylist CP)
	EXCEPT
	(SELECT I.SongName 
	FROM Include I 
	WHERE I.SongName = CS.SongName AND 
		I.AlbumID = CS.AlbumID)
)

