WITH pitching_games AS (
  SELECT DISTINCT "game_id" 
  FROM {{ ref('int_season_pitching_stats') }}
),
add_column as (
SELECT 
  s."game_date",
  s."game_id",
  s."home_team",
  s."home_team_id",
  s."away_team",
  s."away_team_id",
  s."venue",
  CASE 
    WHEN p."game_id" IS NOT NULL THEN 1 
    ELSE 0 
  END as have_stats
FROM {{ ref('raw_schedule') }} s
LEFT JOIN pitching_games p
  ON s."game_id" = p."game_id"
ORDER BY s."game_date", s."game_id"
)

select * from add_column