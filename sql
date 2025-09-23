SELECT 
    SUBSTR(
        item_name,
        INSTR(item_name, '_', 1, 1) + 1,
        INSTR(item_name, '_', 1, 2) - INSTR(item_name, '_', 1, 1) - 1
    ) AS unique_value,
    COUNT(*) as transaction_count
FROM rpa_items
WHERE status_flag IN (0)
   AND process_id = 444
   AND item_name LIKE '%092320255'
GROUP BY 
    SUBSTR(
        item_name,
        INSTR(item_name, '_', 1, 1) + 1,
        INSTR(item_name, '_', 1, 2) - INSTR(item_name, '_', 1, 1) - 1
    )
ORDER BY transaction_count DESC;
