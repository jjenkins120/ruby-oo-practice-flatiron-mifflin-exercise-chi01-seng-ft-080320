class Employee

    attr_reader :name, :salary, :manager_instance

    @@all = []

    def initialize(name, salary, manager_instance)
        @name = name
        @salary = salary
        @manager_instance = manager_instance
        @@all << self
    end

    def manager_name
        manager_instance.name
    end

    def self.all
        @@all
    end

    def self.paid_over(min_salary)
        employees_over_min = Employee.all.select do |employee_instance|
            employee_instance.salary > min_salary
        end
        employees_over_min_name = employees_over_min.map do |employee_instance|
            employee_instance.name
        end
        employees_over_min_name
    end

    def self.find_by_department(department_name)
        manager_in_dept = Manager.all.select do |manager_instance|
            manager_instance.department == department_name
        end
        Employee.all.find do |employee_instance|
            employee_instance.manager_instance == manager_in_dept
            #is false bc one is a Manager instance and the other is an array
            binding.pry
        end
        
    end

    def tax_bracket
        salary_range = ((self.salary - 1000)..(self.salary + 1000))
        Employee.all.select do |employee_instance|
                (salary_range) === employee_instance.salary
        end
    end

end





=begin
XEmployee#name
returns a String that is the employee's name

XEmployee#salary
returns a Fixnum that is the employee's salary

XEmployee#manager_name
returns a String that is the name of their manager

XEmployee.all
returns an Array of all the employees

XEmployee.paid_over
takes a Fixnum argument and returns an Array of all the employees whose salaries are over that amount

Employee.find_by_department
Xtakes a String argument that is the name of a department
Xmanager is working in that department
returns the first employee 

XEmployee#tax_bracket
returns an Array of all the employees whose salaries are within $1000 (± 1000) of the employee who invoked the method
=end
