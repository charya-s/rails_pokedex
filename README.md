# Pokédex App by Charya S.

This app uses Ruby 3.1.1, Rails 7.0.2.3, NodeJS 17.7.2. The database uses PostgreSQL 14.2 and the app is deployed on Heroku (see below).

### App Interface
https://pkmn-table.herokuapp.com/

- Click on any Pokémon on the table to open a popup with more information including stats and breeding information.
  - The sprite of the Pokémon and the icons for it's typing are sourced from an online database, and will not load without an internet connection.
- Click on the table behind the popup to close it.
- The table can be filtered using the checkbox and the search bar.
  - When the checkbox is ticked, only Pokémon considered "good" are displayed. The requirement for this classification is having two or more abilities and a total stat count of over 500. 
  - The search bar is case-insensitive and will display any Pokémon with the searched for abilities. 
  - The checkbox and search bar can be used together to filter only good Pokémon with the desired abilities.


### Admin Panel
https://pkmn-table.herokuapp.com/admin

- Log-in with the provided credentials.
  - Data can be edited in or added to any of the tables.
  - Data can also be downloaded as a CSV or in JSON format.


### Database Structure and Functionality
- Data is divided into four tables; pkmn_generals, pkmn_abilities, pkmn_stats, pkmn_breedings.
- They all contain one pkmn_general_id column that acts as a primary key in pkmn_generals and a foreign key in the other three tables.
- Generally, an SQL query requests for data from pkmn_generals alone and displays it on the table.
- When a Pokémon is selected and the info popup is active, a JOIN is used to combine all four tables to display all the information about the Pokémon.
- When only "good" Pokémon are desired, an SQL query JOINs pkmn_generals with pkmn_abilities and pkmn_stats, and then a WHERE query selects the Pokémon that meet the criteria.
- For the search function, an SQL WHERE query is either performed on the result of the normal list of Pokémon or the list of "good" Pokémon to find ones who have abilities that contain the search term.
