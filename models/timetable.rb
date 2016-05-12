class Timetable

attr_accessor( :student_id, :class_id  )
attr_reader( :id )

  def initialize( options )
    @id = options[ 'id' ].to_i
    @student_id = options[ 'student_id' ].to_i
    @course_id = options[ 'course_id' ].to_i
  end

  def save
#allows new entries to be created.
  end

  def self.all
#lists all students (class method)
  end

#Helper functions
  def self.delete_all
    sql =
    "DELETE FROM Timetables"
    SqlRunner.run( sql )
  end

  def self.map_items
    timetables = SqlRunner.run( sql )
    result = timetables.map { | timetable | Timetable.new( timetable ) }
    return result
  end

  def self.map_item
    result = Timetable.map_items( sql )
    return result.first
  end

end
