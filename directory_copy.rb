def input_students
  puts "Please enter the names of the students"
  puts "To finish just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_names(students)
  n2p = 0
  while n2p < students.length do
    puts "#{students[n2p][:name]}: #{students[n2p][:cohort]}"
    n2p += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print_names(students)
print_footer(students)
