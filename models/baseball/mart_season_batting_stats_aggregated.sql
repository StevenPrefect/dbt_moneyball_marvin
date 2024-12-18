SELECT 
 "player_id",
 COUNT(DISTINCT "game_id") as "games_played",
 MAX("team_name") as "most_recent_team",
 SUM("ab") as "total_ab",
 SUM("r") as "total_r",
 SUM("h") as "total_h",
 SUM("doubles") as "total_doubles",
 SUM("triples") as "total_triples",
 SUM("hr") as "total_hr",
 SUM("rbi") as "total_rbi",
 SUM("bb") as "total_bb",
 SUM("k") as "total_k",
 SUM("lob") as "total_lob",
 AVG("avg") as "average_avg",
 AVG("ops") as "average_ops",
 AVG("obp") as "average_obp",
 AVG("slg") as "average_slg"
FROM {{ ref('mart_season_batting_stats_by_game') }}
GROUP BY "player_id"