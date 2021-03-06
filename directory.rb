#Let's put all the students into an array
@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do 
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
     show_students
    when "9"
      exit # this will cause the program to end
    when "3"
      save_students
    when "4"
      load_students
    else
      puts "I dont know what you meant, try again"
  end
end 

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #get the first name
  name = STDIN.gets.chomp
  #while the name is not empty, repeat the code above
  while !name.empty? do 
    #add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    #get another name from the user
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
  puts "--------------"
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
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end 
  file.close
end

def load_students(filename = "students.csv")
  #open the file for reading
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end 
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  #get out of the method if it isnt given
  return if filename.nil?
  #if it exists
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  # if it doesnt exist
  else 
    puts "Sorry,  #{filename} doesn't exist."
    # quit the program
    exit
  end
end 

try_load_students
interactive_menu 
