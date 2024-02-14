### 1. MatchTournamentInfo

1. `match_id`
    * **Numerical**
    * Showing ID of the match and seems like all the tables relate to each other with this ID
    
2. `tournament_id`
    * **Numerical**
    * Showing ID of the tournament for each match. 
    * Has duplicate values that differ with match ID

3. `tournament_name`
    * **Categorical**
    * This column shows tournament name and it is combination of city and country shown like this : `City, Country`
    * This column has **55 Unique Values**
4. `tournament_slug`
    * **Categorical**
    * This column shows tournament name and it is combination of city and country shown like this : `city-country`
    * This column has **55 Unique Values**

5. `tournament_unique_id`
    * **Numerical**
    * All the values of this column is missing and **This column will be droped in the Cleaning Process**
6. `tournament_category_name`
    * **Categorical**
    * This column shows the category of the tournament
    * Has **5 Unique Values**
        * Challenger
        * WTA
        * ATP
        * ITF Men
        * ITF Women

7. `tournament_category_slug`
    * **Categorical**
    * This column shows the category of the tournament in slug meaning they are lower case and have no space
    * Has **5 Unique Values**
        * challenger
        * wta
        * atp
        * itf-men
        * itf-women

8. `user_count`
    * **Numerical**
    * This column shows how many users participated in the tournament
    * Some of the information about this column:
        * Mean : 223.56
        * Min : 2
        * Max : 3627
        * std : 711.36
        * Q1 : 7
        * Q3 : 19
        

9. `ground_type`
    * **Categorical**
    * This column shows what kind of ground the match was played on
    * Has **6 Unique Values**
        * Red clay
        * Hardcourt outdoor
        * Hardcourt indoor
        * Carpet indoor
        * nan
        * Synthetic outdoor
    * **Has 17 Missing Values that will be dropped**


10. `tennis_points`
    * **Numerical**
    * This column shows how many points were scored in this tournament
    * This column has **600 Missing Values** - *Not decided what to do with it*
    * Some of the information about this column:
        * Mean : 406.097561
        * Min : 75
        * Max : 1000
        * std : 412.441871
        * Q1 : 100
        * Q3 : 1000

***All the following columns only have **One** Value and **None** is Missing***

11. `has_event_player_statistics`

12. `crowd_sourcing_enabled`

13. `has_performance_graph_feature`

14. `display_inverse_home_away_teams`

15. `priority`

16. `competition_type`


### 2. MatchVenueInfo

1. `match_id`
    * **Numerical**
    * Showing ID of the match and seems like all the tables relate to each other with this ID
    
2. `city`
    * **Categorical**
    * Showing City for each match. 
    * This column has **38 Unique Values**

3. `stadium`
    * **Categorical**
    * This column shows stadium name
    * This column has **43 Unique Values**

4. `venue_id`
    * **Numerical**
    * Showing ID of the venue

5. `country`
    * **Categorical**
    * This column has **One** Missing Value


### 3. MatchVenueInfo

1. `match_id`
    * **Numerical**
    * Showing ID of the match and seems like all the tables relate to each other with this ID
    
2. `home_vote`
    * **Numerical**
    * This column shows count of home_votes
    * This column has **38 Unique Values**
    * Some of the information about this column:
        * Mean : 136.298429
        * Min : 0
        * Max : 8133
        * std : 591.036442
        * Q1 : 2
        * Q3 : 32

3. `away_vote`
    * **Numerical**
    * This column shows count of away_votes
    * This column has **43 Unique Values**
    * Some of the information about this column:
        * Mean : 130.712042
        * Min : 0
        * Max : 6851
        * std : 521.944636
        * Q1 : 2
        * Q3 : 24

