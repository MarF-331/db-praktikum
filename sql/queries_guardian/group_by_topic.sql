SELECT t->>'webTitle' AS topic,
       COUNT(*) AS number_of_articles
FROM "Guardian" g
CROSS JOIN LATERAL jsonb_array_elements(g.data->'tags') AS t
WHERE t->>'type' = 'keyword'
GROUP BY 1
ORDER BY number_of_articles DESC;