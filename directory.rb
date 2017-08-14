
students = [
  "Dr. Hannibal Lecter",
 "Darth Vader",
 "Nurse Ratched",
 "Michael Corleone",
 "Alex DeLarge",
 "The Wicked Witch of the West",
 "Terminator",
 "Freddy Krueger",
 "The Joker",
 "Joffrey Baratheon",
 "Norman Bates"
]
#Introduce the Academy
puts "The students of Villains Academy"
puts "-------------"
#Then print students from array...

students.each_with_index {|x, index|
indexplus1 = index+1
  puts "#{indexplus1}: #{x}"}
#Then the number, and how great they are
puts "Overall, we have #{students.count} great students"
