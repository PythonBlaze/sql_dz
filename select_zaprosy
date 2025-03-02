

--Задание 2
SELECT title, duration
FROM public.Tracks
ORDER BY duration DESC
LIMIT 1;

SELECT title
FROM public.Tracks
WHERE duration >= '00:03:30';

SELECT title
FROM public.Compilations
WHERE year_of_release BETWEEN 2015 AND 2020;

SELECT name
FROM public.Artists
WHERE name NOT LIKE '% %'; --у меня все состоят из нескольких слов

SELECT title
FROM public.Tracks
WHERE title ILIKE '%мой%' OR title ILIKE '%my%'

--Задание 3
SELECT g.name AS genre_name, COUNT(DISTINCT ag.artist_id) AS artist_count
FROM public.Genres g
JOIN public.ArtistGenres ag ON g.genre_id = ag.genre_id
GROUP BY g.genre_id;

SELECT COUNT(t.track_id) AS track_count
FROM public.Tracks t
JOIN public.Albums a ON t.album_id = a.album_id
WHERE a.year_of_release BETWEEN 1960 AND 2020;

SELECT a.title AS album_title, AVG(t.duration) AS average_duration
FROM public.Albums a
JOIN public.Tracks t ON a.album_id = t.album_id
GROUP BY a.album_id;

SELECT DISTINCT ar.name
FROM public.Artists ar
LEFT JOIN public.AlbumArtists aa ON ar.artist_id = aa.artist_id
LEFT JOIN public.Albums al ON aa.album_id = al.album_id AND al.year_of_release = 2020
WHERE al.album_id IS NULL;

SELECT c.title AS compilation_title
FROM public.Compilations c
JOIN public.CompilationTracks ct ON c.compilation_id = ct.compilation_id
JOIN public.Tracks t ON ct.track_id = t.track_id
JOIN public.AlbumArtists aa ON t.album_id = aa.album_id
JOIN public.Artists ar ON aa.artist_id = ar.artist_id
WHERE ar.name = 'The Rolling Stones';
