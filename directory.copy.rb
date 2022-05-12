#Let's put all the students into an array
students = [ 
 {name: "Dr. Hannibal Lecter", cohort: :november, country_of_birth: "Lithuania"},
 {name: "Darth Vader", cohort: :november, country_of_birth: "Planet Tatooine"}, 
 {name: "Nurse Ratched", cohort: :november, country_of_birth: "USA"}, 
 {name: "Michael Corleone", cohort: :november, country_of_birth: "Italy"}, 
 {name: "Alec Delarge", cohort: :november, country_of_birth: "U.K"}, 
 {name: "The Wicked Witch of the West", cohort: :november, country_of_birth: "Winkie"}, 
 {name: "Terminator", cohort: :november, country_of_birth: "USA"}, 
 {name: "Freddy Krueger", cohort: :november, country_of_birth: "USA"}, 
 {name: "The Joker", cohort: :november, country_of_birth: "USA"}, 
 {name: "Joffrey Baratheon", cohort: :november, country_of_birth: "Crownlands"}, 
 {name: "Norman Bates", cohort: :november, country_of_birth: "USA"}
 ]
 
def print_student_number(students)
  students.each_with_index do |student, index|
    number = index + 1
    puts "#{number}. #{student[:name]}"
  end
end

def print_starts(students)
  students.each do |student, cohorts|
    if student[:name].start_with? "D"
      puts "#{student[:name]}"
    end
  end
end

def print_name_length(students)
  students.each do |student|
    if student[:name].length < 12
      puts "#{student[:name]}" 
    end
  end
end

def aligned(students)
  students.each do |student|
    string = student[:name]
    puts string.center(55)
  end
end

def print_by_cohort
  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  
end
  
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  
  #create an empty array
  students = []
  
  #get the first name
  name = gets.chomp
  
  puts "Please enter the cohort the student is in"
  cohort = gets.chomp
  
  #while the mame is not empty, repeat the code above
  while !name.empty? do 
    
    #add the student hash to the array
    students << {name: name , cohort: cohort}
    puts "Now we have #{students.count} students"
    
    #get another name from the user
    name = gets.chomp
  end 
  
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print(students)
  students.each do |student|
    until student[:cohort] == :december
      puts "#{student[:name]}, #{student[:country_of_birth]} (#{student[:cohort]} cohort)"
      break
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#students = input_students
#nothing happens until we call the methods 
#print_header
#print(students)
#print_footer(students)


#print_student_number(students)
#print_starts(students)
#print_name_length(students)
#print(students)

#aligned(students)

