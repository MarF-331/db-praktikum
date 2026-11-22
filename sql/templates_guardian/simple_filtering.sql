\set rand_wordcount random(1, 8000)
SELECT data->'fields'->>'headline' AS headline 
FROM "Guardian" 
WHERE (data->'fields'->>'wordcount')::integer > :rand_wordcount;