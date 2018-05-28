require "byebug"

class Employee
  attr_accessor :manager, :name, :salary
  def initialize(name, title, salary, manager)
    if manager 
      manager.add_employee(self)
    end 
    @manager = manager
    @salary = salary
    @name = name
    @title = title
  end
  
  def bonus(multiplier)
    bonus = (salary) * multiplier
  end
  
  def manager=(boss)
    @manager = boss
  end
  
  protected
  attr_reader :name
  
end

class Manager < Employee
  attr_accessor :employees
  def initialize(name, title, salary, manager = nil)
    super
    @employees = []
  end
  
  def add_employee(employee)
    @employees << employee
    employee.manager = self
  end
  
  def bonus(multiplier)
    base  = 0 
    base = bonus_rec(self)
    base * multiplier
  end
  
  private 
  
  def bonus_rec(person)
    return person.salary if (person.class == Employee) || person.employees.empty?
    salary = 0
    person.employees.each do |emp|
      salary += emp.salary
      bonus_rec(emp)
    end
    salary
  end
  
  protected
  attr_reader :manager_name
  
end