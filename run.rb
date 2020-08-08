require_relative "lib/Manager"
require_relative "lib/Employee"
require 'pry'


#Test your code here

m1 = Manager.new("David", "Accounting", 46)
m2 = Manager.new("Keisha", "Sales", 34)


e1 = Employee.new("Ivan", 26000, m1)
e2 = Employee.new("Eric", 32000, m2)
e3 = Employee.new("Dominique", 72000, m1)
e4 = Employee.new("Sara", 72500, m2)

binding.pry
puts "done"

