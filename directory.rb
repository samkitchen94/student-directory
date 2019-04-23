# It's better to put all students into an array
students = [
  "The students of Villains Academy",
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wiched Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
# and then print them
students.each do |student|
  puts student
end
# and then we print the total
puts "Overall, we have #{students.count} great students"