--
-- PostgreSQL Insert Data Script
--
-- This script inserts predefined data into the `genres`, `movies`, and `movies_genres_xref` tables.
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Inserting Data into Genres Table
--
INSERT INTO public.genres (genre_id, genre_name) VALUES
(1, 'Action'), (2, 'Adventure'), (3, 'Animation'), (4, 'Comedy'), (5, 'Crime'), 
(6, 'Documentary'), (7, 'Drama'), (8, 'Family'), (9, 'Fantasy'), (10, 'History'), 
(11, 'Horror'), (12, 'Music'), (13, 'Mystery'), (14, 'Romance'), (15, 'Sci-Fi'), 
(16, 'Thriller'), (17, 'War'), (18, 'Western')
ON CONFLICT (genre_id) DO NOTHING;

--
-- Inserting Data into Movies Table
--
INSERT INTO public.movies (movie_id, title, format, release_year, times_watched, personal_rating) VALUES
(1, 'Whiplash', 'DVD', 2014, 8, 10.0),
(2, 'Frances Ha', 'BD', 2012, 5, 9.5),
(3, 'Jeff Who Lives at Home', 'DVD', 2011, 1, 6.0),
(4, 'O Brother Where Art Thou', 'VHS', 2000, 1, 7.0),
(5, 'Monty Python and the Holy Grail', 'VHS', 1975, 3, 8.0),
(6, 'Citizen Kane', 'VHS', 1941, 1, 7.0),
(7, 'Get Out', 'DVD', 2017, 2, 8.0),
(8, 'Safety Not Guaranteed', 'DVD', 2012, 4, 8.5),
(9, 'Some Like It Hot', 'DVD', 1959, 2, 8.5),
(10, '12 Angry Men', 'DVD', 1957, 3, 8.0),
(11, 'Fantastic Mr. Fox', 'DVD', 2009, 3, 7.5),
(12, 'Real Genius', 'VHS', 1985, 4, 6.5)
ON CONFLICT (movie_id) DO NOTHING;

--
-- Inserting Data into Movies-Genres Junction Table
--
INSERT INTO public.movies_genres_xref (movie_id, genre_id) VALUES
(1, 7), (1, 12), (2, 4), (2, 7), (3, 4), (3, 7), (4, 4), (4, 2), (4, 7),
(5, 4), (5, 9), (6, 10), (7, 11), (7, 16), (8, 13), (8, 2), (9, 4), (9, 14),
(10, 7), (10, 17), (11, 3), (11, 9), (12, 4), (12, 15)
ON CONFLICT (movie_id, genre_id) DO NOTHING;

--
-- Setting Sequence Values to Ensure Continuity
--
SELECT pg_catalog.setval('public.genres_genre_id_seq', 18, true);
SELECT pg_catalog.setval('public.movies_movie_id_seq', 12, true);
