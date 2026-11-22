SELECT 
    data->'id' AS id,
    data->'fields'->>'wordcount' AS wordcount,
    regexp_count(data->'fields'->>'bodyText', '[A-Z][^.!?]*[.!?]') as count_sentences
FROM "Guardian";