
-- QUESTION 1
SELECT COUNT(DISTINCT NAME) AS count_player
FROM (
    SELECT match_away_team_info.name FROM match_away_team_info
    UNION
    SELECT match_home_team_info.name FROM match_home_team_info
) AS combined_teams;

-- QUESTION 3
WITH HomeWins AS (
    SELECT h.name AS player_name, COUNT(*) AS wins
    FROM match_home_team_info h
    JOIN match_event_info e ON h.match_id = e.match_id AND e.winner_code = 1
    GROUP BY h.name
),
AwayWins AS (
    SELECT a.name AS player_name, COUNT(*) AS wins
    FROM match_away_team_info a
    JOIN match_event_info e ON a.match_id = e.match_id AND e.winner_code = 2
    GROUP BY a.name
),
CombinedWins AS (
    SELECT player_name, SUM(wins) AS total_wins
    FROM (
        SELECT * FROM HomeWins
        UNION ALL
        SELECT * FROM AwayWins
    ) AS AllWins
    GROUP BY player_name
)
SELECT player_name, total_wins
FROM CombinedWins
WHERE total_wins = (SELECT MAX(total_wins) FROM CombinedWins);

-- QUESTION 4
SELECT 
    AVG(total_duration) AS mean_val, 
    MAX(total_duration) AS max_val
FROM (
    SELECT 
        (period_1 + period_2 + period_3 + period_4 + period_5) AS total_duration
    FROM 
        match_time_info
) AS durations;

-- QUESTION 5
SELECT ROUND(AVG(max_set_num)) AS average_sets
FROM (
    SELECT match_id, MAX(set_num) AS max_set_num
    FROM power_info
    GROUP BY match_id
) AS match_sets;

-- QUESTION 6
SELECT country, AVG(best_rank) AS average_rank
FROM (
    SELECT NAME, country, MIN(current_rank) AS best_rank
    FROM (
        SELECT NAME, current_rank, country FROM match_home_team_info
        UNION ALL
        SELECT NAME, current_rank, country FROM match_away_team_info
    ) AS combined_teams
    WHERE NAME IS NOT NULL AND current_rank IS NOT NULL AND country IS NOT NULL
    GROUP BY NAME, country
) AS unique_player_ranks
GROUP BY country
ORDER BY average_rank ASC
LIMIT 1;

-- QUESTION 7
SELECT AVG(total_aces) AS average_aces_per_match
FROM (
    SELECT match_id,
           SUM(home_value) AS home_aces,
           SUM(away_value) AS away_aces,
           (SUM(home_value) + SUM(away_value)) AS total_aces
    FROM period_info
    WHERE statistic_name = 'aces'
    GROUP BY match_id
) AS total_aces_per_match;

-- QUESTION 8
WITH double_faults AS (
    SELECT
        DISTINCT(s.match_id),
        s.home_value + s.away_value AS sum_stat,
        h.gender AS gender_home,
        a.gender AS gender_away,
        s.home_value,
        s.away_value
    FROM
        period_info s
        JOIN match_home_team_info h ON s.match_id = h.match_id
        JOIN match_away_team_info a ON s.match_id = a.match_id
    WHERE
        s.statistic_name = 'double_faults'
        AND s.period = 'ALL'
),
aggregated AS (
    SELECT
        gender_home AS gender,
        SUM(home_value) AS home_stat_sum,
        SUM(away_value) AS away_stat_sum
    FROM
        double_faults
    GROUP BY
        gender_home
)
SELECT
    gender,
    home_stat_sum + away_stat_sum AS total_stat
FROM
    aggregated;

-- QUESTION 9
SELECT
    player.name,
    EXTRACT(MONTH FROM TO_TIMESTAMP(match_event_info.start_datetime)) AS MONTH, -- Adjusted for Unix timestamp
    COUNT(*) AS win_counts
FROM
    match_event_info
JOIN
    (SELECT match_id, NAME FROM match_home_team_info
     UNION
     SELECT match_id, NAME FROM match_away_team_info) player ON match_event_info.match_id = player.match_id
WHERE
    (match_event_info.winner_code = 1 AND match_event_info.match_id IN (SELECT match_id FROM match_home_team_info))
    OR (match_event_info.winner_code = 2 AND match_event_info.match_id IN (SELECT match_id FROM match_away_team_info))
GROUP BY
    player.name,
    MONTH
ORDER BY
    win_counts DESC
LIMIT 10;

-- QUESTION 10
WITH combined AS (
    SELECT DISTINCT(NAME), height, current_rank
    FROM match_away_team_info
    WHERE height IS NOT NULL AND current_rank IS NOT NULL
    UNION ALL
    SELECT DISTINCT(NAME), height, current_rank
    FROM match_home_team_info
    WHERE height IS NOT NULL AND current_rank IS NOT NULL
)
SELECT CORR(height, current_rank) AS height_rank_correlation
FROM combined;

-- QUESTION 11
SELECT AVG(total_duration) AS average_duration
FROM (
    SELECT
        (COALESCE(period_1, 0) + COALESCE(period_2, 0) + COALESCE(period_3, 0) +
         COALESCE(period_4, 0) + COALESCE(period_5, 0)) AS total_duration
    FROM
        match_time_info
) AS durations
WHERE total_duration != 0;

-- QUESTION 12
WITH merged_data AS (
    SELECT
        p.match_id,
        p.set_num,
        h.gender,
        COUNT(p.game_num) AS game_count
    FROM
        power_info p
    JOIN
        match_home_team_info h ON p.match_id = h.match_id
    GROUP BY
        p.match_id, p.set_num, h.gender
)
, average_games AS (
    SELECT
        gender,
        AVG(game_count) AS avg_games_per_set
    FROM
        merged_data
    GROUP BY
        gender
)
SELECT
    gender,
    avg_games_per_set
FROM
    average_games;

-- QUESTION 13
WITH combined_players AS (
    SELECT NAME, plays
    FROM match_home_team_info
    UNION
    SELECT NAME, plays
    FROM match_away_team_info
)
, play_counts AS (
    SELECT plays, COUNT(*) AS count
    FROM combined_players
    WHERE plays IN ('right-handed', 'left-handed')
    GROUP BY plays
)
SELECT plays, count
FROM play_counts;

-- QUESTION 14
SELECT ground_type, COUNT(*) AS surface_count
FROM match_tournament_info
WHERE ground_type IS NOT NULL
GROUP BY ground_type
ORDER BY surface_count DESC

-- QUESTION 15
SELECT COUNT(DISTINCT country) AS distinct_countries_count
FROM (
    SELECT country FROM match_home_team_info
    UNION ALL
    SELECT country FROM match_away_team_info
) AS combined_countries;

-- QUESTION 16
WITH top_10_matches AS (
    SELECT 
        e.match_id,
        COALESCE(ht.name, at.name) AS player_name,
        CASE 
            WHEN e.winner_code = 1 THEN 'home'
            ELSE 'away'
        END AS winning_side
    FROM 
        match_event_info AS e
    LEFT JOIN 
        match_home_team_info AS ht ON e.match_id = ht.match_id
    LEFT JOIN 
        match_away_team_info AS AT ON e.match_id = at.match_id
    WHERE 
        ht.current_rank <= 10 OR at.current_rank <= 10
),
player_performance AS (
    SELECT 
        player_name,
        COUNT(*) AS total_matches,
        SUM(CASE WHEN winning_side = 'home' THEN 1 ELSE 0 END) AS wins
    FROM 
        top_10_matches
    GROUP BY 
        player_name
)
SELECT 
    player_name,
    (wins::NUMERIC / total_matches) * 100 AS winning_percentage
FROM 
    player_performance
ORDER BY 
    winning_percentage DESC;

-- QUESTION 17
SELECT AVG(breaks_count) AS average_breaks_per_match
FROM (
    SELECT match_id, COUNT(*) AS breaks_count
    FROM power_info
    WHERE break_occurred = TRUE
    GROUP BY match_id
) AS break_counts;