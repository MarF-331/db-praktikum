SELECT data->'id' AS id,
       regexp_count(data->'fields'->>'bodyText', 'cheese', 1, 'i') as occurrences
FROM "Guardian"
ORDER BY occurrences DESC;