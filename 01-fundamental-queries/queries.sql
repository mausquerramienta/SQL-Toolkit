USE NetflixDB;

/* ============================================================================
   1. ACTOR FREQUENCY ANALYSIS
   Identifies which actors have participated in the highest number of 
   different series by counting their registry in the junction table.
============================================================================ */
SELECT 
    actor_id, 
    COUNT(serie_id) AS total_series_appearances
FROM 
    Actuaciones
GROUP BY 
    actor_id
ORDER BY 
    total_series_appearances DESC;


/* ============================================================================
   2. SERIES RATING METRICS
   Calculates the overall quality of a series by averaging the IMDB ratings 
   across all its associated episodes.
============================================================================ */
SELECT 
    serie_id, 
    AVG(rating_imdb) AS average_imdb_rating
FROM 
    Episodios
GROUP BY 
    serie_id
ORDER BY 
    average_imdb_rating DESC;


/* ============================================================================
   3. CONTENT DURATION LOOKUP
   Retrieves the single longest episode available in the database based 
   on its runtime in minutes.
============================================================================ */
SELECT 
    titulo AS episode_title, 
    duracion AS runtime_minutes 
FROM 
    Episodios
ORDER BY 
    duracion DESC
LIMIT 1;
