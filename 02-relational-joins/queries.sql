USE NetflixDB;

/* ============================================================================
   1. GENRE PREVALENCE ANALYSIS
   Determines the most common genres in the catalog by aggregating the total 
   number of series per genre category.
============================================================================ */
SELECT 
    genero AS genre, 
    COUNT(genero) AS total_series
FROM 
    Series
GROUP BY 
    genre
ORDER BY 
    total_series DESC;

/* ============================================================================
   2. TOP PERFORMING SERIES
   Cross-references Series and Episodes (INNER JOIN) to calculate the highest 
   average IMDB rating and total episode count for the top 3 shows.
============================================================================ */
SELECT 
    Series.titulo AS series_title,
    AVG(Episodios.rating_imdb) AS average_rating,
    COUNT(Episodios.episodio_id) AS total_episodes
FROM 
    Series
INNER JOIN 
    Episodios ON Series.serie_id = Episodios.serie_id
GROUP BY 
    series_title
ORDER BY 
    average_rating DESC
LIMIT 3;

/* ============================================================================
   3. BINGE-WATCHING METRICS
   Calculates the total runtime duration and episode count for a specific 
   target series ("Stranger Things").
============================================================================ */
SELECT 
    Series.titulo AS series_title,
    SUM(Episodios.duracion) AS total_duration_minutes,
    COUNT(Episodios.episodio_id) AS total_episodes
FROM 
    Series
INNER JOIN 
    Episodios ON Series.serie_id = Episodios.serie_id
WHERE 
    Series.titulo = 'Stranger Things'
GROUP BY 
    series_title;

/* ============================================================================
   4. SPECIFIC SERIES EPISODE PERFORMANCE (LEFT JOIN)
   Retrieves all episodes for a specific series ("Stranger Things") and ranks 
   them by their IMDB rating. The LEFT JOIN ensures the series record would 
   still be returned even if no episodes were currently logged in the database.
============================================================================ */
SELECT 
    Series.titulo AS series_title,
    Episodios.titulo AS episode_title,
    Episodios.rating_imdb AS imdb_rating
FROM 
    Series
LEFT JOIN 
    Episodios ON Series.serie_id = Episodios.serie_id
WHERE 
    Series.titulo = 'Stranger Things'
ORDER BY 
    Episodios.rating_imdb DESC;

/* ============================================================================
   5. CATALOG COMPLETENESS (RIGHT JOIN)
   Retrieves the series catalog and their respective episodes, ensuring that 
   series lacking episode records are still surfaced in the output.
============================================================================ */
SELECT 
    Episodios.titulo AS episode_title, 
    Series.titulo AS series_title
FROM 
    Episodios
RIGHT JOIN 
    Series ON Episodios.serie_id = Series.serie_id;
