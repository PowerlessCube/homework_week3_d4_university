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
    VALUES '#{@name}'
    RETURNING * ;"
    return Course.map_item( sql )
  end

  def self.all
#lists all courses (class method)
  end

  def students
#will display a list of students in the course.
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
