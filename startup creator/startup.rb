require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(startup)
        startup.funding < self.funding
    end

    def hire(name, title)
        if self.valid_title?(title)
            @employees << Employee.new(name, title)
        else
            raise 'title is invalid!'
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        moneyz = @salaries[employee.title]

        if @funding >= moneyz
            employee.pay(moneyz)
            @funding -= moneyz
        else
            raise 'not enough funding!'
        end
    end

    def payday
        @employees.each {|employee| self.pay_employee(employee)}
    end

    def average_salary
        sum = 0

        @employees.each do |employee|
            sum += @salaries[employee.title]
        end

        sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each do |title, amount|
            if !@salaries.has_key?(title)
                @salaries[title] = amount
            end
        end
        @employees += startup.employees
        startup.close
    end

end
