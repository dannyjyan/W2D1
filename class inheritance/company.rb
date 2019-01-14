
class Employee

  attr_reader :name, :title, :salary, :boss

  def initialize(name, salary = nil, title = nil, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    boss.add_employee(self) if boss != nil
  end 
  
  def bonus(multiplier)
    salary * multiplier
  end 

  def inspect 
    @name
  end 
end

class Manager < Employee

  attr_reader :my_employees
  def initialize(name, salary = nil,  title = nil, boss = nil)
    @my_employees = []
    super
  end 

  def bonus(multiplier)
    # my_employees.inject { |emp| emp.salary * multiplier }
    result = 0
    my_employees.each do  |emp| 
      result += emp.salary * multiplier if emp.is_a?(Manager)
      result += emp.bonus(multiplier) 
    end
    result
  end 

  def add_employee(employee)
    my_employees << employee 
  end 
end 


ned = Manager.new("Ned", 1_000_000, "Founder")
darren = Manager.new("Darren", 78_000, "TA Manager", ned)
shawna = Employee.new("Shawna", 12_000, "TA", darren)
david = Employee.new("David", 10_000, "TA", darren)



ned.bonus(5) # => 500_000
darren.bonus(4) # => 88_000
david.bonus(3) # => 30_000

darren.my_employees

ned.my_employees