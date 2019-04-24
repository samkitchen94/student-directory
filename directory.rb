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

input_students
print_header
print_students
print_footer
