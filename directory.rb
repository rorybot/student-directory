@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save a list"
  puts "4. Load a list"
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

      @the_letter = STDIN.gets.chomp.to_s

      show_students(@students)

    when "3"
      save_students
      "<Beep boop> File successfully saved"

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
    try_load_students
    print_menu
    case_selection(STDIN.gets.chomp)
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

def standard_string_getter
  STDIN.gets.strip.to_s
end


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return after typing the name"
  # get the first name
  name = standard_string_getter
    puts "And now the cohort please"
  cohort = STDIN.gets.strip.to_sym
    puts "Age?"
  age = STDIN.gets.strip.to_i
    puts "Any...hobbies? If none, type 'nothing'"
  hobbies = standard_string_getter
    puts "Oh, and where was they born?"
  born = standard_string_getter
  #when not empty, repeat code
    while !name.empty? do
      @students << {name: name, cohort: cohort.to_sym, age: age.to_i, hobbies: hobbies, born: born}
        name, cohort, age, hobbies, born = STDIN.gets.strip

      end

    @students.count == 1 ? (puts "Now we have #{@students.count} student") : (puts "Now we have #{@students.count} students")
end



#Introduce the Academy
def print_header
  puts "The students of Villains Academy".center(100).upcase
  puts "-------------".center(100)
end

#Then print students from array...

def student_putter(indexthing,the_student)
  puts "#{indexthing}: #{the_student[:name]} (#{the_student[:cohort].to_s.capitalize} - born in #{the_student[:born]}, age #{the_student[:age]} and enjoys #{the_student[:hobbies]})".center(100)
end

def print_student_list(students, letter_selection="")
    @students.each_with_index {|student, index|
      indexplus1 = index+1
      if letter_selection != String
        if student[:name].to_s.start_with? letter_selection.upcase
          student_putter(indexplus1,student)
        else
          student_putter(indexplus1,student)
        end
      end
    }
end
#Then the number, and how great they are
def print_footer(names)
   names.count == 1 ? (puts "Overall, we have #{names.count} great student".center(100)) : (puts "Overall, we have #{names.count} great students".center(100))
end

def save_students
  filename_selector
  file = File.open(@filename, "w")

  @students.each {|student|
    student_data = [student[:name], student[:cohort], student[:born], student[:age], student[:hobbies]]
    csv_line = student_data.join(",")
    file.puts csv_line
  }
  file.close
  puts "
  <Beep boop> #{@filename} saved!
  "
end

def filename_selector
  puts "Whats the filename?"
  @filename = STDIN.gets.strip

    if !@filename.include? (".csv") || (@filename != nil)
      puts "You have not made a valid selection. I am returning you to the interactive menu
      "
      interactive_menu

    end

end

def load_students
  @students = []
  filename_selector
  require 'csv'
  file = File.open(@filename, "r")

    CSV.parse(file, headers: false) { |row|
        @students << {name: row[0], cohort: row[1], born: row[2], age: row[3], hobbies: row[4]}
      }

      ensure file.close

    puts "
    <Beep boop> #{@filename} loaded!
    "

end



def try_load_students
  filename = ARGV.first #1st arg from cmd line
  return if filename.nil? #grab nothing if nothing given
  if File.exists?(filename) #if file exists
    load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
  else #if not exists
    puts "sorry, #{filename} doesn't exist."
    exit #quit the program
  end
end


interactive_menu

#print_header
#print_student_list(@students, "G")
#print_footer(@students)

#puts @students
