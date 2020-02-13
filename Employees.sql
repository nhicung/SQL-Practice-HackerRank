/*
Input Format
The Employee table containing employee data for a company is described as follows:
|  Column     |  Type       |
|_____________|_____________|
| employee_id | Integer     |
|   name      |  String     |
|  months     |  Integer    |
|  salary     |  Integer    |

where employee_id is an employee's ID number, name is their name, months is the total number of months they've been working for the company, and salary is the their monthly salary.
Sample Input:
|employee_id  |  name       |  months     |  salary     |
|_____________|_____________|_____________|_____________|
|   12228     |    Rose     |     15      | Integer     |
|   33645     |  Angela     |      1      |  String     |
|   45692     |  Frank      |     17      |  Integer    |
|   56118     |  Patrick    |      7      |  Integer    |
|   59725     |    Lisa     |     11      | Integer     |
|   74197     |  Kimberly   |     16      |  String     |
|   78454     |  Bonnie     |      8      |  Integer    |
|   83565     |  Michael    |      6      |  Integer    |
|   98607     |  Todd       |      5      |  Integer    |
|   99989     |  Joe        |      9      |  Integer    |

1. Write a query that prints a list of employee names (i.e.: the name attribute) 
for employees in Employee having a salary greater than $2000 per month who have been employees for less than 10 months. 
Sort your result by ascending employee_id.

Sample Output
Angela
Michael
Todd
Joe

Explanation
Angela has been an employee for 1 month and earns $3443 per month.
Michael has been an employee for 6 months and earns $2017 per month.
Todd has been an employee for 5 months and earns $3396 per month.
Joe has been an employee for 9 months and earns $3573 per month.
We order our output by ascending employee_id.

*/
select name
from Employee
where salary > 2000 and months < 10;

/*
2. Write a query that prints a list of employee names (i.e.: the name attribute) 
from the Employee table in alphabetical order.

Sample Output
Angela
Bonnie
Frank
Joe
Kimberly
Lisa
Michael
Patrick
Rose
Todd

*/

select name 
from Employee
order by name;