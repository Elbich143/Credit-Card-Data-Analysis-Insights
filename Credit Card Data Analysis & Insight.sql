## Credit Card Data Analysis & Insight 

-- Which city has spent the heighest amount over the year ?

Select City, years, Amount from creditcards
where (select max(Amount) from creditcards)
order by Amount desc
limit 5;

-- Which Card_type has the heighest amount over the year?

select Card_Type, Years, Amount from creditcards
where (select max(amount) from creditcards)
order by Amount desc
limit 5;

-- Which Expense Type has the highest amount over the year?

select Exp_Type, Years, Amount from creditcards
Where (select max(Amount) from creditcards)
order by Amount desc
limit 5;

select * from creditcards;
-- What is the total amount spent between males and female in number and percentages?

Select Gender, sum(Amount) as total_Amount ,
sum(Amount) * 100 /(select sum(Amount) from creditcards) percentage
From creditcards
group by Gender
order by percentage; 

-- What is the total amount of spend by the female via card type?

select sum(Amount) Amount, Card_Type from creditcards
where Gender = "f" 
group by Card_Type
order by sum(Amount) desc;

-- Which are the top 5 cities which has heighest spend for Female?

select City, Amount from creditcards
where Gender = 'F'
order by Amount desc
limit 5;


-- List the Top 5 Cities with maximum transcation

select city, count(*) as 'no. of transactions' from creditcards
 group by city
order by count(city) desc
limit 5 ;

-- Show the Month wise Spend across the year in descending order

select Months, sum(Amount) as Total_Amount from creditcards
group by Months 
order by  sum(Amount) desc;

-- Show the Total Amout spend by Female  via Expense_Type

select sum(Amount) as Total_Amount, Exp_type from creditcards
where Gender = "F" 
group by Exp_Type
order by sum(Amount) desc;

-- Which City use what type of card the most?

select city,
Card_Type,
count(Card_Type) card_use from creditcards 
group by City, Card_Type 
having count(Card_Type)>= 50
order by Card_Type desc, card_use desc ;
