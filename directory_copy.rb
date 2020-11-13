def input_students
  students = []
  counter = 0
  while true do
    puts "Please enter the name of a student"
    puts "To finish type 'exit'"
    name = gets.chomp
    if name == "exit"
      break
    elsif name == ""
      name = "John"
    end
    students << {name: name}
    puts "What cohort are you on?"
    cohort = gets.chomp
    if cohort == ""
      cohort = "January"
    end
    students[counter][:cohort] = cohort
    puts "What is their favourite sport?"
    sport = gets.chomp
    if sport == ""
      sport = "football"
    end
    students[counter][:sport] = sport
    puts "Where were they born?"
    country = gets.chomp
    if country == ""
      country = "Ireland"
    end
    students[counter][:country] = country
    counter += 1
    if counter == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_names(students)
  cohort_group = {}
  students.each do |student|
    name = student[:name]
    cohort = student[:cohort]
    if cohort_group[cohort] == nil
      cohort_group[cohort] = [name]
    else
      cohort_group[cohort].push(name)
    end
  end
  puts "Here are the students grouped by cohort".center(80)
  puts cohort_group
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(80)
end

students = input_students
print_header
print_names(students)
print_footer(students)
