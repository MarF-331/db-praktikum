SELECT date_trunc('day', (data->'fields'->>'firstPublicationDate')::timestamp AT TIME ZONE 'UTC') AS publication_day,
       COUNT(*) AS number_of_articles_published
FROM "Guardian"
GROUP BY date_trunc('day', (data->'fields'->>'firstPublicationDate')::timestamp AT TIME ZONE 'UTC');