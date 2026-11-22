\set idx random(1, 9)
SELECT data->>'id' AS id
FROM "Guardian"
WHERE 
    to_tsvector('english', data->'fields'->>'headline') @@ plainto_tsquery('english', (ARRAY['president', 'rocket', 'cheeseburger', 'car', 'worst', 'dinosaur', 'computer', 'new year', 'easter'])[:idx])
    OR
    to_tsvector('english', data->'fields'->>'bodyText') @@ plainto_tsquery('english', (ARRAY['president', 'rocket', 'cheeseburger', 'car', 'worst', 'dinosaur', 'computer', 'new year', 'easter'])[:idx])