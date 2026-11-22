SELECT data->'id' AS id
FROM "Guardian"
WHERE data->'fields'->>'headline' ~* 'rocket.*moon'
    OR data->'fields'->>'bodyText' ~* 'rocket.*moon';