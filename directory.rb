def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "9. Exit"
end

def show_students
  print_header
  print_students
  print_footer 
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      puts "Sorry I don't know what you mean, please enter your selection by number"
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # then we iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:age]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end
        
def input_students
  puts "Time to enter the name of the students"
  puts "To finish, just hit return twice"
  
  @students =[]
  
  loop do
    puts "Enter the name of a student"
    name = gets.chomp.capitalize
    break if name.empty?
    
    puts "What cohort is #{name} in?"
    cohort = gets.chomp.capitalize
    cohort = "November" if cohort.empty?
    
    puts "What age is #{name}?"
    age = gets.chomp
    
    @students << {name: name, cohort: cohort, age: age.to_s}
    
    if @students.length == 1
      puts "We now have #{@students.length} student"
    else
      puts "We now have #{@students.length} students"
    end
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-----------"
end 

def print_students
  if @students.length > 0
    @students.each_with_index do |student, index|
      student[index] = index
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort, #{student[:age]} years old)"
    end
  end 
end

def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

interactive_menu
input_students
print_header
print_students
print_footer
