-- ex1
select *
from listofartists;


-- ex2 
select FirstName, LastName
from listofartists;

-- ex3
select FirstName, LastName
from listofartists
where Nationality = 'Russian';

-- ex4

select LastName, FirstName, DateOfBirth
from listofartists
where LastName like 'K%';


-- ex5
select LastName, FirstName, DateOfBirth
from listofartists
where FirstName like '%E%';

-- ex6
select LastName, FirstName
from Customer
where Email is Null;


-- ex7
select LastName, FirstName, Email
from customer
where Email is not Null;


-- ex8
select LastName
from listofartists
where Nationality in ('German','French') 
order by(LastName);

-- ex9

select LastName
from listofartists
where Nationality not in('Russian','Belgian');

-- ex10

select LastName
from listofartists
where Nationality not in('French','Spanish') and DateOfBirth > 1890;



