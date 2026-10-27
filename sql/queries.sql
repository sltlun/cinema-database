-- анализа выручки по фильмам
SELECT
    m."Название",
    m."Год выхода",
    COUNT(t.id) AS tickets_sold,
    SUM(t."Цена") AS total_revenue
FROM movies m
JOIN sessions s ON m.id = s.movie_id
JOIN tickets t ON s.id = t.session_id
WHERE t."Статус" = 'продан'
GROUP BY m.id, m."Название", m."Год выхода"
ORDER BY total_revenue DESC;


-- Топ-5 сеансов по выручке
WITH session_revenue AS (
    SELECT
        s.id,
        s."Дата и время",
        c."Название" AS cinema,
        m."Название" AS movie,
        SUM(
            CASE
                WHEN t."Статус" = 'продан'
                THEN t."Цена"
                ELSE 0
            END
        ) AS revenue
    FROM sessions s
    JOIN cinemas c ON c.id = s.cinema_id
    JOIN movies m ON m.id = s.movie_id
    LEFT JOIN tickets t ON t.session_id = s.id
    GROUP BY s.id, s."Дата и время",
             c."Название", m."Название"
)
SELECT *
FROM session_revenue
WHERE revenue > 0
ORDER BY revenue DESC
LIMIT 5;


-- Средняя стоимость билетов по кинотеатрам
SELECT
    c."Название" AS cinema,
    COUNT(t.id) AS total_tickets,
    ROUND(AVG(t."Цена"), 2) AS average_price,
    MIN(t."Цена") AS min_price,
    MAX(t."Цена") AS max_price
FROM cinemas c
JOIN sessions s ON s.cinema_id = c.id
JOIN tickets t ON t.session_id = s.id
WHERE t."Статус" = 'продан'
GROUP BY c.id, c."Название"
ORDER BY average_price DESC;


-- Анализ продаж билетов по кинотеатрам
SELECT
    c."Название" AS cinema,
    COUNT(t.id) AS total_tickets,

    COUNT(t.id) FILTER (
        WHERE t."Статус" = 'продан'
    ) AS sold_tickets,

    COUNT(t.id) FILTER (
        WHERE t."Статус" = 'доступен'
    ) AS available_tickets,

    COALESCE(
        SUM(t."Цена") FILTER (
            WHERE t."Статус" = 'продан'
        ), 0
    ) AS total_revenue,

    ROUND(
        100.0 * COUNT(t.id) FILTER (
            WHERE t."Статус" = 'продан'
        ) / NULLIF(COUNT(t.id), 0),
        2
    ) AS sold_percentage

FROM cinemas c
JOIN sessions s ON s.cinema_id = c.id
JOIN tickets t ON t.session_id = s.id

GROUP BY c.id, c."Название"
ORDER BY sold_percentage DESC;





