select 
    "game_id",
    "team_id",
    "team_name",
    "player_id",
    CASE 
      WHEN "note" LIKE '%(W,%' THEN 1
      ELSE 0
    END as is_win,
    CASE 
      WHEN "note" LIKE '%(L,%' THEN 1
      ELSE 0
    END as is_loss,
    CASE 
      WHEN "note" LIKE '%(S,%' THEN 1
      ELSE 0
    END as is_save,
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
from
    {{ ref('raw_season_pitching_stats') }}
where
    "team_id" = 120