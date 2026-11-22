SELECT
    ARRAY(
        SELECT jsonb_array_elements(data->'tags')->>'id'
    ) AS tag_ids
FROM "Guardian";