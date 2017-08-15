
  students = [
  {name: "Dr. Hannibal Lecter", cohort: :august},
  {name: "Darth Vader", cohort: :august},
  {name: "Nurse Ratched", cohort: :august},
  {name: "Michael Corleone", cohort: :august},
  {name: "Alex DeLarge", cohort: :august},
  {name: "The Wicked Witch of the West", cohort: :august},
  {name: "Terminator", cohort: :august},
  {name: "Freddy Krueger", cohort: :august},
  {name: "The Joker", cohort: :august},
  {name: "Joffrey Baratheon", cohort: :august},
  {name: "Norman Bates", cohort: :august},
]


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #Create an empty array
  students =[]
  # get the first name
  name = gets.chomp
  #when not empty, repeat code
    while !name.empty? do
      students << {name: name, cohort: :august}
        puts "Now we have #{students.count} students"

        name = gets.chomp
      end

  students

end

#Introduce the Academy
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

#Then print students from array...
def print(students)
  students.each_with_index {|student, index|
    indexplus1 = index+1
    puts "#{indexplus1}: #{student[:name]} (#{student[:cohort]})"}
end
#Then the number, and how great they are
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
