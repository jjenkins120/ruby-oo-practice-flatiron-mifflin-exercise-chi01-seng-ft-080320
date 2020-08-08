class Manager

    attr_reader :name, :department, :age

    @@all = []

    def initialize(name, department, age)
        @name = name
        @department = department
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def employees
        Employee.all.select do |employee_instance|
            employee_instance.manager_instance == self
        end
    end

    def hire_employee(name, salary)
        Employee.new(name, salary, self)
    end

    def self.all_departments
        all_dept = Manager.all.map do |manager_instance|
            manager_instance.department
        end
        all_dept.uniq
    end

    def self.average_age
        age_array = Manager.all.map do |manager_instance|
            manager_instance.age
        end
        age_array.sum / age_array.count
    end

end






=begin
    XManager#name
    returns a String that is the manager's name

    XManager#department
    returns a String that is the department that the manager oversees

    XManager#age
    returns a Fixnum that is the age of the manager

    XManager#employees
    returns an Array of all the employees that the manager oversees

    XManager.all
    returns an Array of all the managers

    XManager#hire_employee
    takes a String argument and a Fixnum argument of an employee's name and the employee's salary, respectively, and adds that employee to the list of employees that the manager oversees

    XManager.all_departments
    returns an Array of all the department names that every manager oversees

    XManager.average_age
    returns a Float that is the average age of all the managers
=end