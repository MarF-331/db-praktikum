SELECT
    ARRAY(
        SELECT jsonb_array_elements(data->'topics')
    ) AS topics
FROM "Spiegel";