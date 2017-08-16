
  students = [
  {name: "Dr. Hannibal Lecter", cohort: :august, age: 50, hobbies: "Cooking", born: "America"},
  {name: "Darth Vader", cohort: :august, age: 45, hobbies: "Fencing", born: "Tatooine"},
  {name: "Nurse Ratched", cohort: :august, age: 42, hobbies: "Nursing", born: "Hospital"},
  {name: "Michael Corleone", cohort: :august, age: 35, hobbies: "Favouring", born: "da mafia"},
  {name: "Alex DeLarge", cohort: :august, age: 25, hobbies: "No idea", born: "Huh"},
  {name: "The Wicked Witch of the West", cohort: :august, age: 145, hobbies: "Wicca", born: "The West"},
  {name: "Terminator", cohort: :august, age: 30, hobbies: "Biking", born: "the future"},
  {name: "Freddy Krueger", cohort: :august, age: 111, hobbies: "Dreaming", born: "In yo dreams"},
  {name: "The Joker", cohort: :august, age: 80, hobbies: "Comedy", born: "Gotham"},
  {name: "Joffrey Baratheon", cohort: :august, age: 15, hobbies: "Archery", born: "King's Landing"},
  {name: "Norman Bates", cohort: :august, age: 40, hobbies: "Dancing", born: "New York"},
]

=begin
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
=end
#Introduce the Academy
def print_header
  puts "The students of Villains Academy".center(100).upcase
  puts "-------------".center(100)
end

#Then print students from array...
def print(students, letter_selection)

    students.each_with_index {|student, index|
      indexplus1 = index+1
      if letter_selection != String
        if student[:name].start_with? letter_selection.upcase
        puts "#{indexplus1}: #{student[:name]} (#{student[:cohort].capitalize} - born in #{student[:born]}, age #{student[:age]} and enjoys #{student[:hobbies]})".center(100)
        end
      else
        puts "#{indexplus1}: #{student[:name]} (#{student[:cohort].capitalize} cohort - born in #{student[:born]}, age #{student[:age]} and enjoys #{student[:hobbies]})".center(100)
      end
    }



end
#Then the number, and how great they are
def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(100)
end

#students = input_students
print_header
print(students, "m")
print_footer(students)
