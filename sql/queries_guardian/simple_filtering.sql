SELECT data->'fields'->>'headline' AS headline 
FROM "Guardian" 
WHERE (data->'fields'->>'wordcount')::integer > 1000;