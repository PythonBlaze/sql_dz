
SET search_path TO public;

CREATE TABLE IF NOT EXISTS public.Genres (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.Artists (
    artist_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.Albums (
    album_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    year_of_release INT CHECK (year_of_release >= 1800 AND year_of_release <= 2050)
);

CREATE TABLE IF NOT EXISTS public.Tracks (
    track_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    duration TIME CHECK (duration > '00:00:00'),
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES public.Albums(album_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.Compilations (
    compilation_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    year_of_release INT CHECK (year_of_release >= 1800 AND year_of_release <= 2050)
);

CREATE TABLE IF NOT EXISTS public.CompilationTracks (
    compilation_id INT,
    track_id INT,
    PRIMARY KEY (compilation_id, track_id),
    FOREIGN KEY (compilation_id) REFERENCES public.Compilations(compilation_id) ON DELETE CASCADE,
    FOREIGN KEY (track_id) REFERENCES public.Tracks(track_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.AlbumArtists (
    album_id INT,
    artist_id INT,
    PRIMARY KEY (album_id, artist_id),
    FOREIGN KEY (album_id) REFERENCES public.Albums(album_id) ON DELETE CASCADE,
    FOREIGN KEY (artist_id) REFERENCES public.Artists(artist_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.ArtistGenres (
    artist_id INT,
    genre_id INT,
    PRIMARY KEY (artist_id, genre_id),
    FOREIGN KEY (artist_id) REFERENCES public.Artists(artist_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES public.Genres(genre_id) ON DELETE CASCADE
);
