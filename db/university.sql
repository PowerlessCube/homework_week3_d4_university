DROP TABLE courses;
DROP TABLE students;
DROP TABLE timetable;

CREATE TABLE courses (
  id SERIAL4 primary key,
  name VARCHAR(255)
);

CREATE TABLE students (
  id SERIAL4 primary key,
  name VARCHAR(255)
);

CREATE TABLE timetables (
  id SERIAL4 primary key,
  student_id INT4,
  course€_id INT4
);
