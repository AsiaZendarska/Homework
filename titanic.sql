-- Wyswietl wszystkich danych pasazerow
SELECT 
    passengerid, 
    survived, 
    pclass, 
    "Name", 
    sex, 
    age, 
    sibsp, 
    parch, 
    ticket, 
    fare, 
    cabin, 
    embarked
FROM titanic_dataset_csv tdc;

-- Wyswietl unikalne klasy kablin
select distinct pclass
from titanic_dataset_csv tdc;

-- Zlicz liczbę pasazerow na podstawie plci
select sex, count(*) as passenger_count
from titanic_dataset_csv tdc 
group by sex;

-- Zlicz pasazerow wedlug klasy kabin
select pclass, COUNT(*) as passenger_count
from titanic_dataset_csv tdc 
group by pclass;

-- Oblicz sredni wiek pasazerow
select avg(age) as age_ave
from titanic_dataset_csv tdc;

-- Znajdz najmlodszego pasazera
select *
from titanic_dataset_csv tdc 
where age = (select min(age) from titanic_dataset_csv);

-- Policz liczbe osob, ktore przezyly i nie przezyly katastrofy
select survived, count(*) as passenger_count
from titanic_dataset_csv tdc 
group by survived;

-- Oblicz procent pasazerow, ktorzy przezyli
select avg(survived) * 100 as survival_rate
from titanic_dataset_csv tdc;

SELECT 
    (COUNT(CASE WHEN survived = 1 THEN 1 END) * 100.0 / COUNT(*)) AS survival_rate
FROM titanic_dataset_csv;

-- Zlicz pasazerow według wieku powyzej i ponizej 18 lat
select 
	case 
		when age < 18 then 'Below 18'
		else '18 and above'
	end as age_group,
	count(*) as passenger_count
from titanic_dataset_csv tdc 
group by age_group;

-- Policz liczbę pasazerow według klasy kabin i plci
select pclass, sex, count(*) as passenger_count
from titanic_dataset_csv tdc 
group by pclass, sex;

-- Zlicz pasazerow, ktorzy podrozowali samotnie (bez rodzeństwa, malzonka ani rodzicow)
select count(*) as passenger_count
from titanic_dataset_csv tdc 
where sibsp = 0 and parch = 0;

-- Oblicz srednia opłate za bilet (Fare) według klasy kabin
select avg(fare) as average_fare
from titanic_dataset_csv tdc 
group by pclass;

-- Wyswietlenie pasazerow, ktorzy mieli więcej niż 3 czlonków rodziny na pokładzie
select *
from titanic_dataset_csv tdc 
where (sibsp + parch) > 3;

-- Policz liczbe dzieci (ponizej 18 lat), ktore przezyly i ktore nie przezyly
select survived, count(*) as children_count
from titanic_dataset_csv tdc 
where age < 18
group by survived;

-- Wyswietl pasazerow, ktorzy zaplacili za bilet wiecej niz srednia oplata
select *
from titanic_dataset_csv tdc 
where fare > (select avg(fare) from titanic_dataset_csv tdc2);

-- Policz liczbę pasazerow z tytulami „Mr”, „Mrs” i „Miss” w imieniu
select 
	case 
		when "Name" like '%Mr.%' then 'Mr'
		when "Name" like '%Mrs.%' then 'Mrs'
		when "Name" like '%Miss.%' then 'Miss'
	end as title,
	count(*) as passenger_count
from titanic_dataset_csv tdc 
where "Name" like '%Mr.%' OR "Name" LIKE '%Mrs.%' OR "Name" LIKE '%Miss%'
group by title;

SHOW server_encoding;	
SHOW client_encoding;
SET client_encoding TO 'UTF8';