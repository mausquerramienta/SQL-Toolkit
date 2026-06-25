-- ============================================================================
-- 03 - SUBQUERIES & ADVANCED AGGREGATIONS
-- ============================================================================
-- Objective: Identify the series from the top three most popular genres and calculate
-- their average rating based on individual episode performance.

SELECT
    s.titulo,
    s.año_lanzamiento,
    s.genero,
    ROUND(AVG(e.rating_imdb), 2) AS average_rating
FROM Series s
INNER JOIN Episodios e
    ON s.serie_id = e.serie_id
WHERE s.genero IN (
    -- Nested subquery to extract the top 3 genres
    -- (The 'top3' derived table bypasses MySQL's restriction on LIMIT inside IN)
    SELECT genero
    FROM (
        SELECT genero, COUNT(*) AS show_count
        FROM Series
        GROUP BY genero
        ORDER BY show_count DESC
        LIMIT 3
    ) AS top3
)
GROUP BY 
    s.serie_id,
    s.titulo,
    s.año_lanzamiento,
    s.genero
ORDER BY 
    average_rating DESC;
