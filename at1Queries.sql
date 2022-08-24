select * 
from BOOKING 
where DATEBOOKED like '2021%'
order by eventmonth, EVENTDAY ASC

select b.tourName, c.gender, count(tourName) as 'num bookings'
from BOOKING b
INNER join client c
on b.ClientID = c.ClientID
GROUP by c.GENDER, TOURNAME
order by TOURNAME DESC

select b.tourName, c.gender, count(tourName) as 'num bookings'
from BOOKING b
INNER join client c
on b.ClientID = c.ClientID
where (EVENTMONTH = 'Feb') 
GROUP by c.GENDER, TOURNAME
having count(*) < 2
order by tourname desc

select c.givenName, c.surname, b.tourname, b.datebooked, e.eventfee, t.[DESCRIPTION]
from CLIENT C
INNER join booking b
on c.CLIENTID = b.CLIENTID
inner join EVENT e 
on b.tourname = e.TOURNAME
inner join TOUR t
on e.TOURNAME = t.tourname
where b.eventMonth = 'Jan'

select c.givenName, c.surname, COUNT(b.DATEBOOKED) as 'num bookings'
from client c 
left join booking b 
on c.ClientID = b.ClientID
GROUP by c.GIVENNAME, c.SURNAME

select c.givenName, c.surname, COUNT(b.DATEBOOKED) as 'num bookings'
from booking b 
right join client c 
on b.ClientID = c.ClientID 
GROUP by c.GIVENNAME, c.SURNAME

select *
from client c 
RIGHT join [booking] b
on c.ClientID = b.clientID 
FULL join [event] e
on b.EVENTDAY = e.EVENTDAY
select c.clientID
from client c
where c.gender = 'F'

select * 
from booking 
where CLIENTID in (select c.clientID
from client c
where c.gender = 'F')

select c.givenName, c.SURNAME, (e.eventfee - b.payment) as 'amount owning'
from client c 
right join booking B
on c.CLIENTID = b.CLIENTID
inner join [event] e 
on b.EVENTDAY = e.EVENTDAY
where (e.EVENTFEE - b.PAYMENT) > 0

select datebooked, datename(WEEKDAY, datebooked) as DayOfWeek, DATEPART(WEEKDAY, DATEBOOKED) as DayOfMonth, DATENAME(MONTH, DATEBOOKED) as MonthName, datepart(month, DATEBOOKED) as MonthNum, DATEPART(year, DATEBOOKED) as Year 
from booking