require( 'pg' )
require_relative( '../db/sql_runner' )

class Course

attr_accessor( :name )
attr_reader( :id )

  def initialize( options )
    @id = options[ 'id' ].to_i
    @name = options[ 'name' ]
  end

  def save
    sql =
    "INSERT INTO courses( name )
    VALUES ( '#{@name}' )
    RETURNING * ;"
    return Course.map_item( sql )
  end

  def self.all
    sql =
    "SELECT * FROM courses"
    return Course.map_items( sql )
  end

  def students
    sql =
    "SELECT s.*
    FROM students s
    INNER JOIN timetable.t
    ON t.student_id = s.id
    WHERE course_id = #{@id};"
    SqlRunner.run( sql )
  end

#Helper functions, ensure DRY (class methods).
  def self.delete_all
    sql =
    "DELETE FROM courses"
    SqlRunner.run( sql )
  end

  def self.map_items
    courses = SqlRunner.run( sql )
    result = courses.map { | course | Course.new( course ) }
    return result
  end

  def self.map_item
    result = Course.map_items( sql )
    return result.first
  end



end
