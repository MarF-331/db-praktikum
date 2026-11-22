SELECT data->>'id' AS id
FROM "Guardian"
WHERE 
    to_tsvector('english', data->'fields'->>'headline') @@ plainto_tsquery('english', 'rocket')
    OR
    to_tsvector('english', data->'fields'->>'bodyText') @@ plainto_tsquery('english', 'rocket')