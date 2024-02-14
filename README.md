# Comprehensive Analysis of Professional Tennis Matches Data
## Overview
This project offers a deep dive into a rich dataset covering various aspects of professional tennis matches. The dataset is structured into 15 relational dataframes derived from parquet files across 6 distinct folders, providing a multidimensional view of tennis matches. It includes player profiles, match scores, event details, betting odds, point-by-point actions, and more. A detailed database schema is available here, which facilitates understanding the dataset's structure and relationships.

## Dataset Tables Description
# Description of the Dataset and the Analysis

## Overview
This dataset offers a comprehensive collection of data points spanning multiple facets of professional tennis matches. It is meticulously structured into 15 relational dataframes derived from parquet files across 6 distinct folders. These dataframes collectively provide a multidimensional view of tennis matches, covering player profiles, match scores, event details, betting odds, point-by-point actions, tournament rounds, seasonal information, statistical analyses, time durations, tournament specifics, venue details, and audience engagement metrics. A detailed database schema is available for reference at <a href='https://dbdiagram.io/d/Tennis-Schema-65085e6b02bd1c4a5ec9eca3'>Tennis Schema</a>, facilitating a deeper understanding of the dataset's structure and relationships.

## Dataset Tables Description
* **Player Profiles (HomeTeamInfo and AwayTeamInfo)**: 
These tables detail profiles for players in home and away teams, encompassing personal demographics (e.g., birthplace, residence), professional attributes (e.g., plays, turned pro), and performance metrics (e.g., current rank, total prize).

* **Match Scores (HomeTeamScore and AwayTeamScore)**: 
Document scoring dynamics for both teams, capturing scores by period and detailing tie-break outcomes, thus providing a snapshot of competitive flow across match segments.

* **Event Details (Event)**: This table is the nucleus of the dataset, chronicling essential match events, participant details, match outcomes, and timings, enriched with unique identifiers and datetime stamps for comprehensive event tracking.

* **Betting Odds (Odds)**: Offers a glimpse into the betting landscape prior to matches, with detailed odds and predictions, serving as a valuable resource for understanding market expectations versus actual outcomes.

* **Point-by-Point Analysis (PointbyPoint)**: Provides a granular breakdown of scoring for each point, illuminating strategies, scoring patterns, and serving turns, essential for in-depth performance analysis.

* **Power Metrics (Power)**: Focuses on the intensity and strategic breaks within games and sets, offering insights into the pivotal moments that could shift match momentum.

* **Round Progression (Round)**: Details the stages of tournament progression, from preliminary rounds to the climactic finals, categorized by unique round identifiers and types, essential for understanding the competitive hierarchy.

* **Seasonal Context (Season)**: Aligns matches within their respective seasons, providing a temporal framework that is crucial for trend analysis and seasonal performance assessment.

* **Statistical Deep Dive (Statistics)**: A comprehensive compilation of match statistics, from aces to double faults, segmented by home and away participants, offering a quantitative foundation for performance evaluation.

* **Timing Insights (Time)**: Tracks the duration of each set, adding a layer of analysis that can correlate time factors with player performance and endurance.

* **Tournament Insights (Tournament)**: Expands on tournament specifics, including location, surface type, and categories, providing a rich backdrop against which matches unfold, influencing player performance and strategy.

* **Venue Details (Venue)**: Specifies match venues, offering insights into geographical and infrastructural factors that may influence match dynamics and player adaptability.

* **Public Engagement (Votes)**: Reflects public sentiment through vote counts for home and away teams, serving as an indicator of audience preferences and perceptions.


        
## Key Features
The analysis was done with both **Python** and **SQL Query** that covers several key aspects, including:

1. How many tennis players are included in the dataset?

2. What is the average age of the players?

3. Which player has the highest number of wins?

4. What is the longest match recorded in terms of duration?

5. How many sets are typically played in a tennis match?

6. Which country has produced the most successful tennis players?

7. What is the average number of aces per match?

8. Is there a difference in the number of double faults based on gender?

9. Which player has won the most tournaments in a single month?

10. Is there a correlation between a player's height and their ranking?

11. What is the average duration of matches?

12. What is the average number of games per set in men's matches compared to women's matches?

13. What is the distribution of left-handed versus right-handed players?

14. What is the most common type of surface used in tournaments?

15. How many distinct countries are represented in the dataset?

16. Which player has the highest winning percentage against top 10 ranked opponents?

17. What is the average number of breaks of serve per match?

18. The least risky matchs to bet on

19. Is the first guess the best?

20. Assuming that votes table are fan's predictions, has it any affects the player's performance?

21. Does playing the tournament in the player's home country effect the player's win?

22. Win/Loss ratio for each player

23. Which season has players with highest ranks?

24. Players Service Points

## Dependencies

This project utilizes various Python libraries, including Pandas for data manipulation, Matplotlib and Seaborn for data visualization, SQLAlchemy for database interactions, and several others for data analysis and machine learning tasks.

## Installation
To run this analysis, ensure you have Python installed along with the following libraries:

* pandas
* matplotlib
* seaborn
* sqlalchemy
* numpy
* psycopg2

You can install these dependencies using pip:

    bash
    pip install pandas matplotlib seaborn sqlalchemy numpy psycopg2

## Usage
To perform the analysis:

* Ensure all dependencies are installed.
* Clone this repository or download the Jupyter notebook.
* Open the notebook in Jupyter Lab or Jupyter Notebook.
* Adjust dataset directory accordingly
* Run the cells in order to execute the analysis and view the results.

## Contributing
Contributions to this project are welcome. Please open an issue or pull request on the project's repository.

## License
This project is licensed under the MIT License - see the LICENSE file for details