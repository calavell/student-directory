@students = [] #array is accessible to all methods
require 'csv'
def interactive_menu
  loop do
    print_menu
    user_choice(STDIN.gets.chomp)#input from keyboard
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to local file"
  puts "4. Load the list from students.csv"
  puts "9. exit"
end

def user_choice(selection)
  case selection
  when "1"
    puts "You have chosen option 1"
    input_students
  when "2"
    puts "You have chosen option 2"
    display_students
  when "3"
    puts "You have chosen option 3"
    save_students
  when "4"
    puts "You have chosen option 4"
    load_students
  when "9"
    exit
  else puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish just hit return twice"
  name = STDIN.gets.chomp #get the first name. STDIN specifies it is from keyboard
  while !name.empty? do #enters loop if user types something
    add_students(name) #add the student hash to the array
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def display_students
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
  puts "Please enter the filename where you wish to save to"
  file_choice = STDIN.gets.chomp
  CSV.open(file_choice, "w") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end
end

def load_students(filename = "students.csv") #default value
  puts "What file do you want to load from?"
  puts "If you don't want to load from a file, press enter."
  file_choice = STDIN.gets.chomp
  if File.exists?(file_choice)
    CSV.foreach(filename) do |row|
      name = row[0]
      cohort = row[1]
      add_students(name, cohort)
    end
    puts "Loaded #{@students.count} students from #{file_choice}"
  elsif file_choice == ""
    puts "No file uploaded"
  else
    puts "That file does not exist"
    exit
  end
end

def try_load_students
  filename = ARGV.first #first argument from command line
  if filename.nil? #get out of method if no argument given
    load_students
  elsif File.exists?(filename)
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
