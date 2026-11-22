SELECT date_trunc('week', (data->'fields'->>'firstPublicationDate')::timestamp AT TIME ZONE 'UTC') AS publication_week,
       COUNT(*) AS number_of_articles_published
FROM "Guardian"
GROUP BY date_trunc('week', (data->'fields'->>'firstPublicationDate')::timestamp AT TIME ZONE 'UTC');