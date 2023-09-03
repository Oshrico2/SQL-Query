-- ex1
select Country
from customer
group by Country
order by Country;

-- ex2
select count(*) as Count, Country
from customer
group by Country
order by Country;

-- ex3

select LastName, FirstName from listofartists
union
select LastName, FirstName from customer
order by LastName;

-- ex4

select LastName, FirstName,'A' from listofartists
union
select LastName, FirstName,'C' from customer
order by LastName;


-- ex5
select Title
from work
where Description like "%impressionist%";

-- ex6

select FirstName,LastName,Title
from customer c left join (work w join trans t on t.WorkID = w.WorkID)
						on c.CustomerID = t.CustomerID;

-- ex7

select FirstName,LastName, count(*)
from listofartists l join work w 
on l.ArtistID = w.ArtistID
group by l.ArtistID;


-- ex8

select avg(DateDeceased-DateOfBirth) as avg_age_less_then_1900
from listofartists
where DateOfBirth < 1900;

-- ex9
select 	Nationality,
		max(DateDeceased - DateOfBirth) as MaxAge,
		min(DateDeceased - DateOfBirth) as MinAge,
        avg(DateDeceased - DateOfBirth) as AvgAge
from listofartists
group by Nationality;
		

