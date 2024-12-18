SELECT 
 "player_id",
 COUNT(DISTINCT "game_id") as "games_played",
 MAX("team_name") as "most_recent_team",
 SUM("IS_WIN") as "total_wins",
 SUM("IS_LOSS") as "total_losses", 
 SUM("IS_SAVE") as "total_saves",
 SUM("ip") as "total_ip",
 SUM("h") as "total_h",
 SUM("r") as "total_r",
 SUM("er") as "total_er",
 SUM("bb") as "total_bb",
 SUM("k") as "total_k",
 SUM("hr") as "total_hr",
 AVG("era") as "average_era",
 SUM("pitches") as "total_pitches",
 SUM("strikes") as "total_strikes"
FROM {{ ref('mart_season_pitching_stats_by_game') }}
GROUP BY "player_id"