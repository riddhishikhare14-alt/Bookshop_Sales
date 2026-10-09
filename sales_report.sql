-- Bookshop Sales Report by Genre

SELECT
    genre,
    COUNT(*) AS book_count,
    SUM(price * quantity_sold) AS total_revenue,
    RANK() OVER (
        ORDER BY SUM(price * quantity_sold) DESC
    ) AS revenue_rank
FROM sales
GROUP BY genre
HAVING SUM(price * quantity_sold) > 100
ORDER BY revenue_rank ASC;