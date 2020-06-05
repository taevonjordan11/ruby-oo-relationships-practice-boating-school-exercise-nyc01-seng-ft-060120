

# Instructor` class:
# * initialize with a name
# * `Instructor.all` should return all instructors
# * `Instructor#pass_student` should take in a student instance and test name. 
#  If there is a `BoatingTest` whose name and student match the values passed in, this method
# should update the status of that BoatingTest
# to 'passed'. If there is no matching test, this method should create a test with the s
#tudent, that boat test name, and the status 'passed'. Either way, it should return the `BoatingTest` 
#instance.
# * `Instructor#fail_student` should take in a student instance and test name. 
#Like `#pass_student`, it should try to find a matching `BoatingTest` 
#and update its status to 'failed'. If it cannot find an existing `BoatingTest`, 
#it should create one with the name, the matching student, and the status 'failed'.

class Instructor
    
    
    @@all = []
    
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_test(student, name, status)
        BoatingTest.new(student, name, status, self)
    end

    def pass_student(student, test_name)
        test = student.tests.find{ |test|
            test.name == test_name
        }
        if test
            test.status = "passed"
        else
            test = self.add_test(student, test_name, "passed")
        end

        test
    end

    def fail_student(student, test_name)
        test = student.tests.find{ |test|
            test.name == test_name
        }
        if test
            test.status = "failed"
        else
            test = self.add_test(student, test_name, "failed")
        end
        
        test
    end
end
