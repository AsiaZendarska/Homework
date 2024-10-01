-- Wyświetlenie wszystkich unikalnych drużyn w zbiorze danych
select distinct team_abbreviation 
from nba_sql ns;

-- Wyświetlenie wszystkich graczy, którzy mają więcej niż 210 cm wzrostu
select player_name, player_height 
from nba_sql ns 
where player_height > 210;

-- Obliczenie średniej wagi graczy dla każdego sezonu
select season, avg(player_weight) as average_weight
from nba_sql ns 
group by season;

-- Wyświetlenie graczy, którzy zostali wybrani w pierwszej rundzie draftu (draft_round = '1')
select player_name, draft_round
from nba_sql ns 
where draft_round = '1';

-- Znalezienie graczy, którzy nigdy nie grali na uczelni (brak wartości w kolumnie college)
select player_name, college
from nba_sql ns 
where college is null;

-- Wyświetlenie liczby graczy z każdego kraju, posortowane malejąco według liczby graczy
select country, count(*) as player_count
from nba_sql ns 
group by country 
order by player_count asc;

-- Znalezienie najstarszego gracza w sezonie 2020-2021
select player_name, age
from nba_sql ns 
where season = '2020-21'
order by age desc 
limit 1;

-- Obliczenie liczby graczy w każdej drużynie w sezonie 2019-2020
select team_abbreviation, count(*) as player_count
from nba_sql ns 
where season = '2019-20'
group by team_abbreviation;

-- Znalezienie graczy, którzy zostali wybrani z numerem draftu mniejszym niż 10, oraz w których drużynach grali w sezonie 2018-2019
select player_name, draft_number, team_abbreviation
from nba_sql ns 
WHERE draft_number ~ '^\d+$' AND draft_number::integer < 10 AND season = '2018-19';

-- Znalezienie graczy, którzy pochodzą z Kanady (country = 'Canada') i mają więcej niż 200 cm wzrostu
select player_name, player_height
from nba_sql ns 
where country = 'Canada' and player_height > 200;

SELECT datname, pg_encoding_to_char(encoding) AS encoding FROM pg_database;