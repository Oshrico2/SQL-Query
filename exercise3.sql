-- ex1

select distinct LastName
from listofartists l join work w
on l.ArtistID = w.ArtistID;

-- ex2

select *
from listofartists
where ArtistID not in(select ArtistID from work);


-- ex3

select distinct LastName, FirstName
from listofartists l  join work w join trans t
on t.WorkID = w.WorkID and w.ArtistID = l.ArtistID;


-- ex4

select distinct LastName, FirstName
from listofartists
where ArtistID not in(select ArtistID from work,trans
						where work.WorkID=trans.WorkID);
                        
-- ex5

select  LastName, FirstName, PhoneNumber
from customer c join trans t
on c.CustomerID = t.CustomerID;

-- ex6

select  LastName, FirstName, PhoneNumber
from customer
where CustomerID not in(select CustomerID from trans);

-- ex7

select Title,LastName
from work w join listofartists l 
on w.Copy = 'Unique' and w.ArtistID = l.ArtistID;

-- ex8
select distinct LastName
from listofartists l join work w
on l.ArtistID = w.ArtistID and w.Description like "%impressionist%";

-- ex9

select distinct LastName
from listofartists l join customer_artist_int c
on l.ArtistID = c.ArtistID;

-- ex10

select distinct Title 
from work w,listofartists l,customer_artist_int c
where c.ArtistID = l.ArtistID and w.ArtistID = l.ArtistID
and w.WorkID not in(select WorkID from trans);
