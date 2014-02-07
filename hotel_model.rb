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
