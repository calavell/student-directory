def input_students
  puts "Please enter the name of a student"
  puts "To finish just hit return twice"
  students = []
  counter = 0
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "What is their favourite sport?"
    sport = gets.chomp
    students[counter][:sport] = sport
    puts "Where were they born?"
    country = gets.chomp
    students[counter][:country] = country
    counter += 1
    puts "Now we have #{students.count} students"
    puts "Please enter the name of a student"
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
    puts "#{students[n2p][:name]}, #{students[n2p][:cohort]} cohort, likes #{students[n2p][:sport]}, born in #{students[n2p][:country]}".center(80)
    n2p += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(80)
end

students = input_students
print_header
print_names(students)
print_footer(students)
