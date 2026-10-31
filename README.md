# Task Manager

A web application built with JSP, Java and MySQL where an Admin adds Managers, Managers add Employees and assign tasks to them, and Employees update the status of their tasks. After a task is done, the Manager can give a rating.

## Features

- Login system with three roles: Admin, Manager and Employee
- Admin can add and view Managers
- Manager can add and view their Employees
- Manager can assign tasks to Employees (project, task, duration, assign date)
- Employee can see their own tasks
- Employee can update the status of a task (for example: WIP, Completed)
- Manager can see the status of assigned tasks and give a rating
- Logout

## Technologies Used

- JSP (JavaServer Pages)
- Java
- JDBC
- MySQL
- HTML and CSS
- Apache Tomcat 9

## Project Structure

```
src/            Java source files
WebContent/     JSP pages, CSS and WEB-INF
taskManager.sql Database tables and sample data
```

## Database

The database has two tables:

| Table | Purpose |
|---|---|
| `softcopy` | Stores users (Admin, Managers and Employees) with their role |
| `employee_task` | Stores tasks, their status and rating |

Roles in the `softcopy` table: `0` = Admin, `1` = Manager, `2` = Employee.

## How to Run

1. Install Java (JDK), Apache Tomcat 9 and MySQL.
2. Open MySQL Workbench and create a new database (schema). The JSP files use the name `yourdb`.
3. Import `taskManager.sql` into that database to create the tables and sample data.
4. Open the JSP files and find this line:

   ```java
   DriverManager.getConnection("jdbc:mysql://localhost:3306/yourdb", "root", "your_password");
   ```

   Replace `your_password` with your own MySQL password. If your database has a different name, replace `yourdb` too.
5. Import the project into Eclipse (Dynamic Web Project) and add the MySQL Connector/J jar to the project.
6. Run the project on Tomcat and open `http://localhost:8080/` in your browser.

## Author

Akshat Tyagi
