SELECT data->'headline'->>'main' AS headline 
FROM "Spiegel" 
WHERE LOWER(data->>'subchannel') = 'deutschland';