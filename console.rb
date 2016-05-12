require_relative( 'models/course.rb' )
require_relative( 'models/student.rb' )
require_relative( 'models/timetable.rb' )
require( 'pry-byebug' )

Course.delete_all(  )
Student.delete_all(  )
Timetable.delete_all(  )

course1 = Course.new( { 'name' => 'Maths' } )
course2 = Course.new( { 'name' => 'English' } )
course3 = Course.new( { 'name' => 'Information Systems' } )

c1 = course1.save(  )
c2 = course2.save(  )
c3 = course3.save(  )

student1 = Student.new( { 'name' => 'Alistair' } )
student2 = Student.new( { 'name' => 'Bob' } )
student3 = Student.new( { 'name' => 'Gary' } )
student4 = Student.new( { 'name' => 'Tim' } )
student5 = Student.new( { 'name' => 'Ralph' } )
student6 = Student.new( { 'name' => 'Bobby-no-mates' } )

s1 = student1.save(  )
s2 = student2.save(  )
s3 = student3.save(  )
s4 = student4.save(  )
s5 = student5.save(  )
s6 = student6.save(  )

timetable1 = Timetables.new( { 'course_id' => c1.id, 'student_id' => s1.id } )
timetable2 = Timetables.new( { 'course_id' => c2.id, 'student_id' => s1.id } )
timetable3 = Timetables.new( { 'course_id' => c2.id, 'student_id' => s2.id } )
timetable4 = Timetables.new( { 'course_id' => c3.id, 'student_id' => s3.id } )
timetable5 = Timetables.new( { 'course_id' => c3.id, 'student_id' => s4.id } )
timetable6 = Timetables.new( { 'course_id' => c1.id, 'student_id' => s5.id } )
timetable7 = Timetables.new( { 'course_id' => c3.id, 'student_id' => s6.id } )
timetable8 = Timetables.new( { 'course_id' => c2.id, 'student_id' => s6.id } )

t1 = timetable1.save(  )
t2 = timetable2.save(  )
t3 = timetable3.save(  )
t4 = timetable4.save(  )
t5 = timetable5.save(  )
t6 = timetable6.save(  )
t7 = timetable7.save(  )
t8 = timetable8.save(  )



binding.pry
nil
