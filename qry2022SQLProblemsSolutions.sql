
/*

Show all information in the SHIPPERS table.


SELECT *
FROM SHIPPERS

*/
/* 
There are four columns in the Categories Table.
Show only columns CategoryName and Description.

SELECT CATEGORYNAME, DESCRIPTION
FROM CATEGORIES
*/

/*********************************September 27, 2022*********************************************************/

/*
 
Hi I'm your new data analyst. You'd like to get a list of all the sales representives and their hire date? 
Thank you 

Not being familiar with the data in the employees table first I may want to just do a display all or 
SELECT *
FROM EMPLOYEES
;
But in a company that could be thousands of records. Instead I'll limit myself to a sampling of the data to keep my query quick
I'll use a TOP and the number of rows I want to display from the database. 

The TOP followed by a number will only display the specified number of rows, in the example below 3 rows are displayed and the
* asks to return all the coluumns. 

SELECT TOP 3 *
FROM EMPLOYEES
;
*/

/*
SELECT TITLEOFCOURTESY, LASTNAME, FIRSTNAME, HIREDATE
FROM EMPLOYEES
WHERE TITLE='Sales Representative'
;

 The request didn't specify 'Title of Courtsey' but I'll include it here just in case they need it later. Also I don't want to send them
this list with the column names the same as in the database, they don't look great, so I need to change those to a more suitable format.
If this is a reoccuring report I'd alias the column names to sommething more human readable, however if it is a one off I'd just use excel and 
change them their. 
However we are here to learn so let's give these columns assumed identies or Alias them. 

SELECT TITLEOFCOURTESY AS Title, LASTNAME AS 'Last Name', FIRSTNAME AS 'First Name', HIREDATE AS 'Hire Date'
FROM EMPLOYEES
WHERE TITLE='Sales Representative'
;

Using the column name AS preferred name format we can change TitleOfCourtesy to Title and the other column names can also be updated.
Two more things, first the Hire Date column I only need the date not the time and two do I really need the names in last name, first name format
or is one column more suitable. I'll email the requestor asking about the single column name. While I'm waiting for a response I'll
update the Hire Date to remove the time.
If this is an one off or ad hoc I'd use a LEFT and set the number of charcters at 10, datetime example is '2010-05-01 00:00:00:00' the date
only is ten characters. While I'm updating the column names in Excel I'll use LEFT to trim off the time from the date. 
I want to ask the database team why the HireDate column is set as DateTime instead of just Date if the time is not being recorded.
*/

/* We heard back from the requestor and they want one column for the names and they also do want the title as well. 
We use the CONCAT to combine the LASTNAME and FIRSTNAME columns into column 'Name'. We also switched the order in the query
which switched the order it displays the results. We use the ' ' single quote with a space to create the space between 
FIRSTNAME and LASTNAME, else the results will combine the name without the space. 

SELECT TITLEOFCOURTESY AS Title, CONCAT(FIRSTNAME,' ',LASTNAME) AS 'Name', HIREDATE AS 'Hire Date'
FROM EMPLOYEES
WHERE TITLE='Sales Representative'
;
*/

/* Hire Date skimming off the time in the SQL query, I've never done that before so to the web we go. Somewhere someone has done this
and posted about it. Just have to discover it. Also now is a great time to save the code we have generated thus far to our toolbox for
future use.
*/

/* Thank you internet. It is the same in T-SQL as it is in Excel LEFT(columnname, number of characters). Oh and it wasn't 10 it was 11 characters
Now look at those results human readable column names, FIRSTNAME and LASTNAME are now one column Name and the Hire Date no longer
contains an empty Time. Oh but looks like we have some ordering to do. We need to rearrange the results by either 
last name or date of hire or date of hire and last name descending or accending order? 
ORDER BY allows me to specify an order but without using it the data already displays HIREDATE in ascending order and then LASTNAME. 
However maybe we want it by LASTNAME and then HIREDATE. ORDER BY

SELECT TITLEOFCOURTESY AS Title, CONCAT(FIRSTNAME,' ',LASTNAME) AS 'Name', LEFT(HIREDATE, 11) AS 'Hire Date'
FROM EMPLOYEES
WHERE TITLE='Sales Representative'
;
*/

/* 
By adding the ORDER BY we change the order to be by last name and then hire date. 

SELECT TITLEOFCOURTESY AS Title, CONCAT(FIRSTNAME,' ',LASTNAME) AS 'Name', LEFT(HIREDATE, 11) AS 'Hire Date'
FROM EMPLOYEES
WHERE TITLE='Sales Representative'
ORDER BY LASTNAME
;

*/



/* and on everyone of these I forgot to end my statements with a ';' */

/*Way to go. Look at what we accomplished while we were at the autoshop getting our oil changed. */


/* Hi new Data Analyst I'd like to get a list of Sales Reps in the United States. Please also include their hire dates. 
Hey glad we didn't delete that code. Off to the toolbox to retrieve it. With a few additions we can get this request completed quickly


SELECT TITLEOFCOURTESY AS Title, CONCAT(FIRSTNAME,' ',LASTNAME) AS 'Name', LEFT(HIREDATE, 11) AS 'Hire Date'
FROM EMPLOYEES
WHERE Title='Sales Representative' AND Country='United States'
ORDER BY LASTNAME
;

Wait, why didn't this return anything.... Let's see how the countries in the COUNTRY column are spelled.

SELECT DISTINCT COUNTRY
FROM EMPLOYEES

This displays unique country names. Basically every country name in the COUNTRY column but only once. 
USA
UK
Let's now adjust our query accordingly


SELECT TITLEOFCOURTESY AS Title, CONCAT(FIRSTNAME,' ',LASTNAME) AS 'Name', LEFT(HIREDATE, 11) AS 'Hire Date'
FROM EMPLOYEES
WHERE Country='USA'
ORDER BY LASTNAME
;

Now let's check the Title column to see exactly how Sales Rep is spelled. 

SELECT DISTINCT TITLE
FROM EMPLOYEES

Sales Representative

Excellent! Let's add this with an AND to our WHERE statement




SELECT TITLEOFCOURTESY AS Title, CONCAT(FIRSTNAME,' ',LASTNAME) AS 'Name', LEFT(HIREDATE, 11) AS 'Hire Date'
FROM EMPLOYEES
WHERE Country='USA' AND Title='Sales Representative'
ORDER BY LASTNAME 
*/


/*
I heard someone say that coding is like a muscle, if you don't work it out and use it you loose it.
I'm getting back to the gym
*/

/* 
#work #coding #data #dataanalysis #sql #sqlqueries #tsql
*/

/************************OCT 4 2022 *********************************************/

/*
Hi I'm your Data Analyst
Can you provide me a list of orders for employee ID 5?

SELECT ORDERID AS 'Order ID', ORDERDATE AS 'Order Date'
FROM ORDERS
WHERE EMPLOYEEID=5
;
*/

/*
Hi I'm your Data Analyst
I need a suppliers contact list for everyone who isn't a Marketing Manager. Please include supplier ID too.
Thank you,

Let's see what the first 10 rows of data look like.

SELECT TOP 10 *
FROM Suppliers
*/

/* While the request didn't ask for the Company Name I'll inlcude it just in case. 
SELECT SUPPLIERID AS 'Supplier ID', COMPANYNAME AS 'Company Name', CONTACTNAME AS 'Contact Name', CONTACTTITLE AS 'Title'
FROM Suppliers
WHERE NOT CONTACTTITLE='Marketing Manager'
;
*/

/*
Hi Data Analyst
We need a list of all the Queso products.
Thank you,

Let's see what the first 20 rows of data look like.

SELECT TOP 20 *
FROM PRODUCTS
*/

/*
The LIKE command and the % on either side so that no matter where the string Queso appears it will be found.

SELECT PRODUCTID AS 'Product ID', PRODUCTNAME AS 'Product Name'
FROM PRODUCTS
WHERE PRODUCTNAME LIKE '%QUESO%'
*/


/* 
Hi I'm your new data analyst. 
Yes, I can get you a list of Order and Customer IDs that had orders shipped to either Belgium or France. 
Thank you 

Not being familiar with the data in the ORDERS table I want to display all the countries listed in the ShipCountry column

SELECT DISTINCT SHIPCOUNTRY
FROM ORDERS
ORDER BY SHIPCOUNTRY
;
*/
/* 

Let's use the OR to find orders shipped to either France or Belgium. Also we will Order By to keep the orders together by ShipCountry.

SELECT ORDERID AS 'Order ID', CUSTOMERID AS 'CUstomer ID', SHIPCOUNTRY AS 'Ship Country'
FROM Orders
WHERE SHIPCOUNTRY='Belgium' or SHIPCOUNTRY='FRANCE'
ORDER BY ShipCountry
;
*/

/* 
Hi I'm your new data analyst. 
Yes, I can get you a list of Order and Customer IDs that had orders shipped to Latin American countries. 
Thank you 

Never delete your code. Save it to a flash drive "toolbox"
Delete everything from 'Belgium' over. 
*/

/*
We are using IN. This allows you to choose multiple values wihtout using multiple OR. 

SELECT ORDERID AS 'Order ID', CUSTOMERID AS 'CUstomer ID', SHIPCOUNTRY AS 'Ship Country'
FROM Orders
WHERE SHIPCOUNTRY IN ('Brazil', 'Mexico', 'Argentina', 'Venezuela')
ORDER BY ShipCountry
;
*/

/*
Hi I'm your new data analyst. 
HR would like a list of employees with their titles and date of births so they can plan birthday parties. 

Thank you,

Here we use the LEFT in the BirthDate column so we only include the date not the time. 

SELECT FirstName AS 'First Name', LastName AS 'Last Name', Title, LEFT(BirthDate, 11) AS 'Birth Date'
FROM EMPLOYEES
Order By BirthDate
*/

/*

Well you learn something new or you stall out. A wiser more knowledgable SQL guru pointed out instead of LEFT we should use
CONVERT to convert the datetime column to a date column.

SELECT FirstName AS 'First Name', LastName AS 'Last Name', Title, CONVERT(varchar, BirthDate, 101) AS 'Birth Date'
FROM EMPLOYEES
Order By BirthDate

*/

/************** October 5, 2022 **************
Hi I'm your new data analyst.


SELECT OrderID, ProductID, UnitPrice*Quantity AS 'Total Price'
FROM ORDERDETAILS

SELECT ORDERDETAILS.OrderID, ORDERDETAILS.ProductID, Products.ProductName, ORDERDETAILS.UnitPrice*ORDERDETAILS.Quantity AS 'Total Price'
FROM ORDERDETAILS
Inner Join Products ON ORDERDETAILS.ProductID=PRODUCTS.ProductID

*/

/*
How many customers are in the database?
SELECT COUNT(CustomerID) as 'Total Number of Customers'
FROM Customers
*/

/*
First order in the database
SELECT Convert(varchar,MIN(OrderDate), 101) AS 'Frist Order'
FROM ORDERS
*/




/*
I heard someone say that coding is like a muscle, if you don't work it out and use it you loose it.
I'm getting back to the gym
*/

/* 
#work #coding #data #dataanalysis #sql #sqlqueries #tsql
*/






