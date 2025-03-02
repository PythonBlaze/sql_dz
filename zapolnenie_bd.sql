INSERT INTO Genres (name) VALUES ('Rock'), ('Pop'), ('Jazz');

insert into Artists (name) 
values ('The Beatles'), ('Ariana Grande'), ('Benny Goodman'), ('The Rolling Stones');

insert into Albums (title, year_of_release) 
values ('Aftermath', 1966), ('Please Please Me,', 1963), ('Yours Truly', 2013), ('The Essential Benny Goodman', 1934);

insert into Tracks (title, duration, album_id) 
values ('Baby I', '3:17:00', 3), ('I Saw Her Standing There', '2:55:00', 2), ('Lets Dance', '2:12:00', 4), ('Under My Thumb', '3:41:00', 1), ('The Way', '3:55:00', 3), ('Misery', '1:47:00', 2);

insert into Compilations (title, year_of_release) 
values ('The Remix', 2015), ('A Collection of Beatles Oldies', 1966), ('Sing, Sing, Sing', 1987), ('Greatest Hits', 1964);

insert into Albumartists (album_id, artist_id) 
values (1, 4), (2, 1), (3, 2), (4, 3);

insert into Artistgenres (artist_id, genre_id) 
values (1, 1), (2, 2), (3, 3), (4, 1);

insert into compilationtracks  (compilation_id, track_id) 
values (2, 1), (3, 2), (4, 3), (5, 4), (2, 5), (3, 6);
