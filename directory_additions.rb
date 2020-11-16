@students = [] #array is accessible to all methods

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)#input from keyboard
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. exit"
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit #this will cause program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish just hit return twice"
  name = STDIN.gets.chomp #get the first name. STDIN specifies it is from keyboard
  while !name.empty? do #enters loop if user types something
    #add the student hash to the array
    add_students(name)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  file = File.open("students.csv", "w") #open the file for writing
  @students.each do |student| #iterate over students
    student_data = [student[:name], student[:cohort]] #pulls data from @students
    csv_line = student_data.join(",") #converst data to string
    file.puts csv_line
  end
  file.close #any method which opens a file must then close it
end

def load_students(filename = "students.csv") #default value
  file = File.open(filename, "r") #"r" means in read only mode
  file.readlines.each do |line| #iterate over each line of file
    name, cohort = line.chomp.split(",") #parallel assignment of 2 varialbes
    add_students(name, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first #first argument from command line
  return if filename.nil? #get out of method if no argument given
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else #if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit #exits the program
  end
end

def add_students(name, cohort = "november")
  @students << {name: name, cohort: cohort.to_sym}
end

try_load_students
interactive_menu
