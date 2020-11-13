def input_students
  students = []
  counter = 0
  while true do
    puts "Please enter the name of a student"
    puts "To finish type 'exit'"
    name = gets.chop
    if name == "exit"
      break
    elsif name == ""
      name = "john"
    end
    students << {name: name}
    puts "What cohort are you on?"
    cohort = gets.chop
    if cohort == ""
      cohort = "january"
    end
    students[counter][:cohort] = cohort
    puts "What is their favourite sport?"
    sport = gets.chop
    if sport == ""
      sport = "football"
    end
    students[counter][:sport] = sport
    puts "Where were they born?"
    country = gets.chop
    if country == ""
      country = "ireland"
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
  #puts "Here are the students grouped by cohort".center(80)
  #puts cohort_group
  cohort_group.each do |key, value|
    puts "#{key}: #{value.join(", ")}"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.length} great students".center(80)
end

students = input_students
print_header
print_names(students)
print_footer(students)
