COPY (
    SELECT 
        m.movie_id, 
        m.title, 
        m.format, 
        m.release_year, 
        m.times_watched, 
        m.personal_rating, 
        COALESCE(string_agg(g.genre_name, ', '), 'No Genre') AS genre_names
    FROM public.movies m
    LEFT JOIN public.movies_genres_xref mg ON m.movie_id = mg.movie_id
    LEFT JOIN public.genres g ON mg.genre_id = g.genre_id
    GROUP BY m.movie_id, m.title, m.format, m.release_year, m.times_watched, m.personal_rating
) TO 'movies_data.csv' WITH CSV HEADER;
