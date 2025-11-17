/*1. Employés qui n’ont pas d’équipe*/
SELECT id_Employee, first_name, last_name
FROM Employee
WHERE id_Team IS NULL;

 /*2. Employés qui n’ont jamais pris de congé*/
SELECT id_Employee, first_name, last_name
FROM Employee
WHERE id_Leave IS NULL;

 /*3. Congés avec infos employé + équipe*/
SELECT l.id_Leave, l.start_date, l.end_date,
       e.first_name, e.last_name,
       t.name_Team
FROM Leave l
JOIN Employee e ON l.id_Leave = e.id_Leave
JOIN Team t ON e.id_Team = t.id_Team;
/*4. Nombre d’employés par type de contrat*/


SELECT contract_type,
       COUNT(*) AS nombre_employés
FROM Employee
GROUP BY contract_type;
/*5. Nombre d'employés en congé aujourd'hui*/
select count (distinct e.id_Employee) 
as Employee_leave_today from Employee e 
inner join Leave l on e.id_Leave = l.id_Leave 
where current_date between l.start_date and l.end_date;
/*6. Employés en congé aujourd''hui avec leur équipe*/

select e.id_Employee , e.first_name , e.last_name , t.name_Team
 from Employee e inner join Team t on e.id_Team = t.id_Team 
 inner join Leave l  on e.id_Leave = l.id_Leave 
 where current_date between l.start_date and l.end_date;
