SELECT date_trunc('hour', (data->'fields'->>'firstPublicationDate')::timestamp AT TIME ZONE 'UTC') AS publication_hour,
       COUNT(*) AS number_of_articles_published
FROM "Guardian"
GROUP BY date_trunc('hour', (data->'fields'->>'firstPublicationDate')::timestamp AT TIME ZONE 'UTC');