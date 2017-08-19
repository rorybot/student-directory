@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"# 9 because we'll be adding more items
end

def show_students(students)
  print_header
  print_student_list(students, @the_letter)
  print_footer(students)
end

def case_selection(selection)
  case selection
    when "1"
      students = input_students
    when "2"
      puts "Would you like to filter by first letter name? If so enter now."

      @the_letter = gets.chomp.to_s

      show_students(@students)

    when "3"
      save_students

    when "4"
      load_students

    when "9"
      exit #terminate program
    else
      puts "I don't know what you meant, try again"

  end
end

def interactive_menu
  loop do
    print_menu
    case_selection(gets.chomp)
  end
end



=begin #Prefilled list
@students = [
{name: "Dr. Hannibal Lecter", cohort: :august, age: 50, hobbies: "Cooking", born: "America"},
{name: "Darth Vader", cohort: :september, age: 45, hobbies: "Fencing", born: "Tatooine"},
{name: "Nurse Ratched", cohort: :october, age: 42, hobbies: "Nursing", born: "Hospital"},
{name: "Michael Corleone", cohort: :november, age: 35, hobbies: "Favouring", born: "da mafia"},
{name: "Alex DeLarge", cohort: :january, age: 25, hobbies: "No idea", born: "Huh"},
{name: "The Wicked Witch of the West", cohort: :june, age: 145, hobbies: "Wicca", born: "The West"},
{name: "Terminator", cohort: :june, age: 30, hobbies: "Biking", born: "the future"},
{name: "Freddy Krueger", cohort: :september, age: 111, hobbies: "Dreaming", born: "In yo dreams"},
{name: "The Joker", cohort: :november, age: 80, hobbies: "Comedy", born: "Gotham"},
{name: "Joffrey Baratheon", cohort: :january, age: 15, hobbies: "Archery", born: "King's Landing"},
{name: "Norman Bates", cohort: :october, age: 40, hobbies: "Dancing", born: "New York"},
]
=end


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return after typing the name"
  # get the first name
  name = gets.strip.to_s
    puts "And now the cohort please"
  cohort = gets.strip.to_sym
    puts "Age?"
  age = gets.strip.to_i
    puts "Any...hobbies?"
  hobbies = gets.strip.to_s
    puts "Oh, and where was they born?"
  born = gets.strip.to_s
  #when not empty, repeat code
    while !name.empty? do
      @students << {name: name, cohort: cohort, age: age, hobbies: hobbies, born: born}
        name = gets.strip
        cohort = gets.strip
        age = gets.strip
        hobbies = gets.strip
        born = gets.strip
      end

    @students.count == 1 ? (puts "Now we have #{@students.count} student") : (puts "Now we have #{@students.count} students")
end



#Introduce the Academy
def print_header
  puts "The students of Villains Academy".center(100).upcase
  puts "-------------".center(100)
end

#Then print students from array...
def print_student_list(students, letter_selection="")

    @students.each_with_index {|student, index|
      indexplus1 = index+1
      if letter_selection != String
        if student[:name].to_s.start_with? letter_selection.upcase
        puts "#{indexplus1}: #{student[:name]} (#{student[:cohort].to_s.capitalize} - born in #{student[:born]}, age #{student[:age]} and enjoys #{student[:hobbies]})".center(100)
        end
      else
        puts "#{indexplus1}: #{student[:name]} (#{student[:cohort].capitalize} cohort - born in #{ student[:born]}, age #{student[:age]} and enjoys #{student[:hobbies]})".center(100)
      end
    }



end
#Then the number, and how great they are
def print_footer(names)
   names.count == 1 ? (puts "Overall, we have #{names.count} great student".center(100)) : (puts "Overall, we have #{names.count} great students".center(100))
end

def save_students
  file = File.open("students.csv", "w")
  @students.each {|student|
    student_data = [student[:name], student[:cohort], student[:born], student[:age], student[:hobbies]]
    csv_line = student_data.join(",")
    file.puts csv_line
  }
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each { |line|
    name, cohort, born, age, hobbies = line.chomp.split (',')
      @students << {name: name, cohort: cohort.to_sym, born: born, age: age.to_i, hobbies: hobbies}
      }
  file.close
end

interactive_menu

#print_header
#print_student_list(@students, "G")
#print_footer(@students)

#puts @students
