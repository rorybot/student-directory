
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
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

#Then print students from array...
def print(names)
  names.each_with_index {|x, index|
    indexplus1 = index+1
    puts "#{indexplus1}: #{x}"}
end
#Then the number, and how great they are
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

print_header
print(students)
print_footer(students)
