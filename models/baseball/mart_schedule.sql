WITH pitching_games AS (
  SELECT DISTINCT "game_id"
  FROM {{ ref('mart_season_pitching_stats_by_game') }}
)

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
  END as "has_stats"
FROM {{ ref('int_schedule') }} s
LEFT JOIN pitching_games p
  ON s."game_id" = p."game_id"
ORDER BY s."game_date", s."game_id"