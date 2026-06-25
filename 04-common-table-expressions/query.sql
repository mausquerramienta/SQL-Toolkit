-- ============================================================================
-- 04 - COMMON TABLE EXPRESSIONS (CTEs) & MULTI-JOINS
-- ============================================================================
-- Objective: Identify the most successful TV series by decoupling two independent 
-- aggregations (volume vs. quality) into modular Common Table Expressions.

WITH ShowAverages AS (
    SELECT 
        serie_id, 
        ROUND(AVG(rating_imdb), 2) AS avg_imdb
    FROM Episodios
    GROUP BY serie_id
),
ShowTotals AS (
    SELECT 
        serie_id, 
        COUNT(serie_id) AS total_episodes
    FROM Episodios
    GROUP BY serie_id
)

SELECT 
    s.titulo,
    st.total_episodes,
    sa.avg_imdb
FROM Series s
INNER JOIN ShowAverages sa 
    ON s.serie_id = sa.serie_id
INNER JOIN ShowTotals st 
    ON s.serie_id = st.serie_id
ORDER BY 
    sa.avg_imdb DESC, 
    st.total_episodes DESC;
