require( 'pg' )

class Timetable

attr_accessor( :student_id, :class_id  )
attr_reader( :id )

  def initialize( options )
    @id = options[ 'id' ].to_i
    @student_id = options[ 'student_id' ].to_i
    @course_id = options[ 'course_id' ].to_i
  end

  def save
    sql =
    "INSERT INTO timetables (
      student_id,
      course_id )
    VALUES (
      #{@student_id},
      #{@course_id} )
    RETURNING * ;"
    return Timetable.map_items( sql )
  end

  def self.all
    sql =
    "SELECT * FROM timetables"
    return Timetable.map_items( sql )
  end

#Helper functions
  def self.delete_all
    sql =
    "DELETE FROM Timetables"
    SqlRunner.run( sql )
  end

  def self.map_items( sql )
    timetables = SqlRunner.run( sql )
    result = timetables.map { | timetable | Timetable.new( timetable ) }
    return result
  end

  def self.map_item( sql )
    result = Timetable.map_items( sql )
    return result.first
  end

end
