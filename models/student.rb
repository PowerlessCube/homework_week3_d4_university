class Student

attr_accessor( :name )
attr_reader( :id )

  def initialize( options )
    @id = options[ 'id' ].to_i
    @name = options[ 'name' ]
  end

  def save
    sql =
    "INSERT INTO students ( name )
    VALUES ( '#{@name}' )"
  end

  def self.all
#lists all students (class method)
  end

  def courses
#will display a list of students in the student.
  end

#Helper functions, DRY (Class)
  def self.delete_all
    sql =
    "DELETE FROM students"
    SqlRunner.run( sql )
  end

  def self.map_item
    result = Student.map_items( sql )
    return result.first
  end

  def self.map_items
    students = SqlRunner.run( sql )
    result = students.map { | student | Student.new( student ) }
    return result
  end

end
