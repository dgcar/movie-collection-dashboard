--
-- PostgreSQL database dump
--

-- Dropping tables if they exist to prevent conflicts
DROP TABLE IF EXISTS public.movies_genres_xref;
DROP TABLE IF EXISTS public.movies;
DROP TABLE IF EXISTS public.genres;

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

SET default_tablespace = '';
SET default_table_access_method = heap;

--
-- Creating Genres Table
--
CREATE TABLE public.genres (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(50) UNIQUE NOT NULL
);

--
-- Creating Movies Table
--
CREATE TABLE public.movies (
    movie_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    format VARCHAR(10),
    release_year INTEGER CHECK (release_year >= 1888),
    times_watched INTEGER DEFAULT 0,
    personal_rating NUMERIC(3,1) CHECK (personal_rating BETWEEN 0 AND 10)
);

--
-- Creating Movies-Genres Junction Table (Many-to-Many Relationship)
--
CREATE TABLE public.movies_genres_xref (
    movie_id INTEGER NOT NULL,
    genre_id INTEGER NOT NULL,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES public.movies(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES public.genres(genre_id) ON DELETE CASCADE
);

--
-- Adding Indexes for Performance Optimization
--
CREATE INDEX idx_movies_release_year ON public.movies(release_year);
