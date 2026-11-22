SELECT data->'id' AS id,
       LENGTH(data->'fields'->>'bodyText') AS length_of_body_text
FROM "Guardian";
