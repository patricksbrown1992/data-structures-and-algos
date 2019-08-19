class Bootcamp
    attr_reader :name, :slogan, :teachers, :students, :student_capacity
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new {|h, k| h[k] = []}
    end 

    def hire(teacher)
        @teachers.push(teacher)
    end

    def enroll(student)
        if @student_capacity - @students.length > 0
            @students.push(student)
            true
        else 
            false
        end
    end

    def enrolled?(student)
        @students.include?(student)
    end

    def student_to_teacher_ratio
        @students.length / @teachers.length
    end

    def add_grade(student, grade)
        if @students.include?(student)
            @grades[student].push(grade)
            true
        else
            false
        end
    end

    def num_grades(student)
        @grades[student].length
    end

    def average_grade(student)
        if !@students.include?(student)
            nil
        elsif @grades[student].length == 0
            nil
        else
            @grades[student].sum / @grades[student].length
        end
    end

end
