select *from roles r ;
select* from salary s ;
select *from employees e ;
select *from employee_salary es ;
select *from roles_employee re ;

-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employees.employee_name ,salary.monthly_salary 
from employee_salary 
join employees
on employee_salary.employee_id =employees.id 
join  salary  
on salary.id =employee_salary.salary_id ;

-- 2. Вывести всех работников у которых ЗП меньше 2000.
select distinct employees.employee_name ,salary.monthly_salary 
from employee_salary 
join salary 
on employee_salary .salary_id =salary.id
join  employees  
on employees.id =employee_salary.employee_id
where salary.monthly_salary <2000;
 --3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
--select employee_salary.employee_id 
--вывул зарплатную позицию
select employee_salary.employee_id 
from employee_salary
full join employees 
on employee_salary.employee_id =employees.id
where employees.id is null;
--вывел зарплатную позицию и ЗП(количество)
select es.employee_id ,s.monthly_salary 
from employee_salary es 
full join employees 
on es.employee_id =employees.id
join salary s 
on s.id =es.salary_id 
where employees.id is null;
 --4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employee_salary.employee_id,s.monthly_salary 
from employee_salary
full join employees 
on employee_salary.employee_id =employees.id
join salary s 
on s.id = employee_salary.salary_id 
where employees.id is null and s.monthly_salary <2000;
 --5. Найти всех работников кому не начислена ЗП.
select e.employee_name 
from roles_employee re 
full join employees e 
on e.id =re.employee_id 
full join employee_salary es 
on es.employee_id =re.employee_id
full join salary s 
on s.id =es.salary_id 
where s.id is null;

 --6. Вывести всех работников с названиями их должности.
select e.employee_name ,r.role_name 
from employees e 
join roles_employee re 
on e.id =re.employee_id 
join roles r 
on r.id=re.role_id ;
 --7. Вывести имена и должность только Java разработчиков.
select e.employee_name ,r.role_name 
from employees e 
join roles_employee re 
on e.id =re.employee_id 
join roles r 
on r.id=re.role_id 
where r.role_name like '%Java%';

 --8. Вывести имена и должность только Python разработчиков.
select e.employee_name ,r.role_name 
from employees e 
join roles_employee re 
on e.id =re.employee_id 
join roles r 
on r.id=re.role_id 
where r.role_name like '%Python%';
 --9. Вывести имена и должность всех QA инженеров.
select e.employee_name ,r.role_name 
from employees e 
join roles_employee re 
on e.id =re.employee_id 
join roles r 
on r.id=re.role_id 
where r.role_name like '%QA%';

 --10. Вывести имена и должность ручных QA инженеров.
select e.employee_name ,r.role_name 
from employees e 
join roles_employee re 
on e.id =re.employee_id 
join roles r 
on r.id=re.role_id 
where r.role_name like '%Manual QA%';

 --11. Вывести имена и должность автоматизаторов QA
select e.employee_name ,r.role_name 
from employees e 
join roles_employee re 
on e.id =re.employee_id 
join roles r 
on r.id=re.role_id 
where r.role_name  like '%Automation%QA%';
 --12. Вывести имена и зарплаты Junior специалистов
--select e.employee_name ,s.monthly_salary 
select e.employee_name ,s.monthly_salary 
from roles r 
join roles_employee re 
on r.id =re.role_id 
join employees e 
on re.employee_id =e.id 
join employee_salary es 
on es.employee_id =e.id 
join salary s 
on s.id =es.salary_id 
where r.role_name like '%Junior%' 

 --13. Вывести имена и зарплаты Middle специалистов
select e.employee_name ,s.monthly_salary 
from roles r 
join roles_employee re 
on r.id =re.role_id 
join employees e 
on re.employee_id =e.id 
join employee_salary es 
on es.employee_id =e.id 
join salary s 
on s.id =es.salary_id 
where r.role_name like '%Middle%';
 --14. Вывести имена и зарплаты Senior специалистов
--select e.employee_name ,s.monthly_salary
select *
from roles_employee re 
join employees e 
on re.employee_id =e.id  
join roles r 
on re.role_id =r.id 
join employee_salary es 
on es.employee_id =e.id 
join salary s 
on s.id =es.salary_id 
where r.role_name  like '%Senior%' ;

 --15. Вывести зарплаты Java разработчиков
select r.role_name ,s.monthly_salary 
from roles_employee re 
join roles r 
on re.role_id =r.id 
join employee_salary es 
on es.employee_id =re.employee_id 
join salary s 
on s.id =es.salary_id 
where r.role_name like '%Java%'

 --16. Вывести зарплаты Python разработчиков
select r.role_name ,s.monthly_salary 
from roles_employee re 
join roles r 
on re.role_id =r.id 
join employee_salary es 
on es.employee_id =re.employee_id 
join salary s 
on s.id =es.salary_id 
where r.role_name like '%Python%';
 --17. Вывести имена и зарплаты Junior Python разработчиков
select r.role_name ,s.monthly_salary 
from roles_employee re 
join roles r 
on re.role_id =r.id 
join employee_salary es 
on es.employee_id =re.employee_id 
join employees e 
on e.id =re.employee_id 
join salary s 
on s.id =es.salary_id 
where r.role_name like '%Junior%Python%';

 --18. Вывести имена и зарплаты Middle JS разработчиков
select r.role_name ,s.monthly_salary 
from roles_employee re 
join roles r 
on re.role_id =r.id 
join employee_salary es 
on es.employee_id =re.employee_id 
join employees e 
on e.id =re.employee_id 
join salary s 
on s.id =es.salary_id 
where r.role_name like '%Middle%JavaScript%';

 --19. Вывести имена и зарплаты Senior Java разработчиков
select r.role_name ,s.monthly_salary 
from roles_employee re 
join roles r 
on re.role_id =r.id 
join employee_salary es 
on es.employee_id =re.employee_id 
join employees e 
on e.id =re.employee_id 
join salary s 
on s.id =es.salary_id 
where r.role_name like '%Senior%Java%';
 --20. Вывести зарплаты Junior QA инженеров
select s.monthly_salary 
from roles_employee re
join roles r 
on re.role_id =r.id 
join employee_salary es 
on es.employee_id =re.employee_id 
join salary s 
on s.id =es.salary_id 
where r.role_name like '%Junior%QA%';
 --21. Вывести среднюю зарплату всех Junior специалистов
select AVG(s.monthly_salary )
from roles_employee re
join roles r 
on re.role_id =r.id 
join employee_salary es 
on es.employee_id =re.employee_id 
join salary s 
on s.id =es.salary_id 
where r.role_name like '%Junior%';
 --22. Вывести сумму зарплат JS разработчиков
select sum(monthly_salary)
from employee_salary es
join roles_employee re 
on  es.employee_id =re.employee_id 
join roles r 
on r.id =re.role_id 
join salary s 
on s.id = es.salary_id 
where r.role_name like '%JavaScript%';
 --23. Вывести минимальную ЗП QA инжеров 
select MIN(s.monthly_salary)
from roles_employee re 
join roles r 
on re.role_id = r.id 
join employee_salary es 
on es.employee_id =re.employee_id 
join salary s 
on s.id =es.salary_id 
where r.role_name like '%QA%';
 --24. Вывести максимальную ЗП QA инженеров
select MAX(s.monthly_salary)
from roles_employee re 
join roles r 
on re.role_id = r.id 
join employee_salary es 
on es.employee_id =re.employee_id 
join salary s 
on s.id =es.salary_id 
where r.role_name like '%QA%';
 --25. Вывести количество QA инженеров
select count(r.role_name)
from roles_employee re 
join roles r 
on re.role_id = r.id 
join employee_salary es 
on es.employee_id =re.employee_id 
join salary s 
on s.id =es.salary_id 
where r.role_name like '%QA%';
 --26. Вывести количество Middle специалистов.
select COUNT(r.role_name)
from roles_employee re 
join roles r 
on re.role_id = r.id 
join employee_salary es 
on es.employee_id =re.employee_id 
join salary s 
on s.id =es.salary_id 
where r.role_name like '%Middle%';
 --27. Вывести количество разработчиков
select COUNT(r.role_name)
from roles_employee re 
join roles r 
on re.role_id = r.id 
join employee_salary es 
on es.employee_id =re.employee_id 
join salary s 
on s.id =es.salary_id 
where r.role_name like '%developer%';
 --28. Вывести фонд (сумму) зарплаты разработчиков.
select SUM(s.monthly_salary)
from roles_employee re 
join roles r 
on re.role_id = r.id 
join employee_salary es 
on es.employee_id =re.employee_id 
join salary s 
on s.id =es.salary_id 
where r.role_name like '%developer%';
 --29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select e.employee_name ,r.role_name ,s.monthly_salary 
from roles_employee re 
join roles r 
on re.role_id = r.id 
join employee_salary es 
on es.employee_id =re.employee_id 
join salary s 
on s.id =es.salary_id 
join employees e 
on e.id =re.employee_id 
order by s.monthly_salary ;


 --30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select e.employee_name ,r.role_name ,s.monthly_salary 
from roles_employee re 
join roles r 
on re.role_id = r.id 
join employee_salary es 
on es.employee_id =re.employee_id 
join salary s 
on s.id =es.salary_id 
join employees e 
on e.id =re.employee_id 
where s.monthly_salary between 1700 and 2000
order by s.monthly_salary;
 --31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select e.employee_name ,r.role_name ,s.monthly_salary 
from roles_employee re 
join roles r 
on re.role_id = r.id 
join employee_salary es 
on es.employee_id =re.employee_id 
join salary s 
on s.id =es.salary_id 
join employees e 
on e.id =re.employee_id 
where s.monthly_salary<2300
order by s.monthly_salary;
 --32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select e.employee_name ,r.role_name ,s.monthly_salary 
from roles_employee re 
join roles r 
on re.role_id = r.id 
join employee_salary es 
on es.employee_id =re.employee_id 
join salary s 
on s.id =es.salary_id 
join employees e 
on e.id =re.employee_id 
where s.monthly_salary in (1100,1500,2000)
order by s.monthly_salary;


