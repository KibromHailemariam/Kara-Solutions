-- models/staging/stg_telegram.sql
{{ config(materialized='table') }}

SELECT
    message_id,
    channel_name,
    TRIM(LOWER(message_text)) AS cleaned_text,
    TO_TIMESTAMP(timestamp, 'YYYY-MM-DD HH24:MI:SS') AS standardized_timestamp
FROM {{ source('raw', 'telegram_messages') }}
WHERE message_text IS NOT NULL