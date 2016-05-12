require( 'pg' )
require_relative( '../db/sql_runner' )

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
    VALUES ( '#{@name}' )
    RETURNING * ;"
    return Student.map_item( sql )
  end

  def self.all
    sql =
    "SELECT * FROM students"
    return Student.map_items( sql )
  end

  def courses
    sql =
    "SELECT c.*
    FROM courses c
    INNER JOIN timetables t
    ON t.course_id = c.id
    WHERE student_id = #{@id};"
    return Student.map_items( sql )
  end

#Helper functions, DRY (Class)
  def self.delete_all
    sql =
    "DELETE FROM students"
    SqlRunner.run( sql )
  end

  def self.map_item( sql )
    result = Student.map_items( sql )
    return result.first
  end

  def self.map_items( sql )
    students = SqlRunner.run( sql )
    result = students.map { | student | Student.new( student ) }
    return result
  end

end
