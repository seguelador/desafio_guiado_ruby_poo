require 'byebug'

class Student
  attr_accessor :scores

  def initialize(name, scores = [])
    raise RangeError, 'Siempre deben ser 4 calificaciones' if (scores.count != 4)
    @name = name
    @scores = scores
  end

  def average
    # Devolver el promedio de notas del alumno
    @scores.sum(0.0) / @scores.count
  end
end

def best_of(students)
  # Podemos utilizar .each para iterar sobre cada estudiante
  # y así poder obtener la nota más alta y agregarla a un arreglo auxiliar
  # para luego obtener el max de ese arreglo
  #
  # highest_scores = []
  # students.each do |student|
  #   highest_scores << student.scores.max
  # end
  # highest_scores.max

  # Es mejor utilizar .map, porque .map siempre devuelve un arreglo
  #
  # highest_scores = students.map { |student| student.scores.max }
  # highest_scores.max

  # A continuación está la versión más optimizada utilizando .map
  students.map { |student| student.scores.max }.max
end

def student_scores(student)
  student.scores
end

students = []

10.times do |i|
  # rand_scores = []
  # 4.times do
  #   rand_scores << Random.rand(1..7)
  # end
  rand_scores = Array.new(4) { rand(1..7) }
  students << Student.new("Estudiante #{i}", rand_scores)
end


puts "La nota más alta de entre todos los estudiantes es:"
puts best_of(students)


puts "Las notas del estudiante x son:"
puts student_scores(students.sample)
