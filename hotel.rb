# We know:


##### VIEW ####
class Interface
  def intro
  end

  def present_menu
    return user_response
  end

  def outro
  end


end

###### Controller ######

class AdminSystem

   def self.run
    Interface.start

   end

   def self.add_employee
    arguments = ARGV
    Employee.add(arguments)
   end

end

####### Model ########
class Employee
  def add(details)
    DB.exec("insert into employees values (#{details[:name]}, #{details[:type]}")
  end

  def view(employee_id)
  end

  def edit(employee_id)
  end

  def delete(employee_id)
  end
end

class Clerk < Employee
end

class Manager < Employee
end

class Reservation
end

class Room
end

class Guest
end

############## DRIVER #############
AdminSystem.run


