class Student
@@all = []

  attr_reader :first_name

  def initialize(first_name)
    @first_name = first_name
    @@all << self
  end

  def self.all
    @@all
  end

  def add_boating_test(name, status, instructor)
    BoatingTest.new(self, name, status, instructor)
  end

  def self.find_student(first_name)
    @@all.find{|student| student.first_name == first_name}
  end

  def tests
    BoatingTest.all.select do |tests|
      tests.student == self
    end
  end

  def grade_percentage
    test = self.tests

    passed = test.select do |tests|
      tests.status == "passed"
    end
    (passed.count/test.count).to_f
  end

  
end
