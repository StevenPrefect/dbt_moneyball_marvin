select 
    "game_id",
    "team_id",
    "team_name", 
    "player_id",
    "ab",
    "r",
    "h",
    "doubles",
    "triples",
    "hr",
    "rbi",
    "bb",
    "k",
    "lob",
    "avg",
    "ops",
    "obp",
    "slg"
from
    {{ ref('raw_season_batting_stats') }}
where
    "team_id" = 120
