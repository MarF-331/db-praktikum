SELECT a.name AS author,
       COUNT(*) AS number_of_articles
FROM "Spiegel" s
CROSS JOIN LATERAL jsonb_array_elements_text(s.data->'author'->'names') AS a(name)
GROUP BY a.name
ORDER BY number_of_articles DESC;