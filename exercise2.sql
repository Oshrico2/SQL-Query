-- ex1
select * 
from listofartists
where (DateDeceased-DateOfBirth) = (select max(DateDeceased-DateOfBirth) from listofartists);


-- ex2

select count(*) as ArtistCount
from listofartists
where DateOfBirth between 1900 and 1950;

-- ex3

select count(*), Nationality as NumberOfArtists
from listofartists
group by Nationality;


-- ex4

select LastName Name, Nationality, (DateDeceased - DateOfBirth) as Age
from listofartists
order by Age;

-- ex5

select distinct Nationality
from listofartists;

-- ex6
select LastName
from listofartists
where DateOfBirth >= 1900;

-- ex7
select distinct Country
from Customer
order by Country;

-- ex8
select count(*) as Count, Country
from Customer
group by Country
order by Country;

-- ex9

select concat(FirstName,' ',LastName) as Name, Nationality
from listofartists;

-- ex10
select LastName, Nationality, DateDeceased
from listofartists
order by DateDeceased desc, LastName;



