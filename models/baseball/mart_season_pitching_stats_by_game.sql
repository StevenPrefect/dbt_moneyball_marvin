WITH existing_games AS (
  SELECT DISTINCT "game_id", "player_id"
  FROM {{ ref('int_season_pitching_stats') }}
),

new_valid_games AS (
  SELECT l.*
  FROM {{ ref('int_last_game_pitching') }} l
  LEFT JOIN existing_games e 
    ON l."game_id" = e."game_id" 
    AND l."player_id" = e."player_id"
  WHERE e."game_id" IS NULL
)

SELECT 
  "game_id",
  "team_id",
  "team_name",
  "player_id",
  "IS_WIN",
  "IS_LOSS",
  "IS_SAVE",
  "ip",
  "h",
  "r",
  "er",
  "bb",
  "k",
  "hr",
  "era",
  "pitches",
  "strikes"
FROM {{ ref('int_season_pitching_stats') }}

UNION ALL

SELECT 
  "game_id",
  "team_id",
  "team_name",
  "player_id",
  "IS_WIN",
  "IS_LOSS",
  "IS_SAVE",
  "ip",
  "h",
  "r",
  "er",
  "bb",
  "k",
  "hr",
  "era",
  "pitches",
  "strikes"
FROM new_valid_games