DELETE FROM CreatePlaylist;
DELETE FROM Include;

INSERT INTO CreatePlaylist(UserID,PlayListName)
VALUES
(6, 'Babe coming over'),
(6, 'Chill'),
(8, 'Sad song for a sad boi'),
(9, 'Favorites'),
(9, 'Study playlist'),
(9, 'Moms home playlist'),
(10, 'Gospels only Praise the Holy Father')
;

INSERT INTO Include (AlbumID, SongName, UserID, PlaylistName)
VALUES
(1, 'Private Selec.', 6, 'Babe coming over'),
(1, 'Bliss', 6, 'Babe coming over'),
(5, '7-11', 6, 'Chill'),
(2, 'Sad boi', 8, 'Sad song for a sad boi'),
(2, 'Cries', 8, 'Sad song for a sad boi'),
(1, 'Jouse Flow', 9, 'Study playlist'),
(4, 'BossMama', 9, 'Moms home playlist'),
(2, 'Trap Nation', 9, 'Favorites'),
(3, 'I am a sinner', 10, 'Gospels only Praise the Holy Father')
;
