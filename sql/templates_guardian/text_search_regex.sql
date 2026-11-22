\set idx random(1, 6)
SELECT data->'id' AS id
FROM "Guardian"
WHERE data->'fields'->>'headline' ~* (ARRAY['rocket.*moon', '\mpresident\M', '\mpolicy\M', '\mcrashed\M.*\mpeople\M', '\mscore\M.*[0-9]+', '\myear\M.*[0-9]+'])[:idx]
    OR data->'fields'->>'bodyText' ~* (ARRAY['rocket.*moon', '\mpresident\M', '\mpolicy\M', '\mcrashed\M.*\mpeople\M', '\mscore\M.*[0-9]+', '\myear\M.*[0-9]+'])[:idx];
