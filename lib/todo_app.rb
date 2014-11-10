class TodoApp < CommandLineApp
  def initialize(input, output)
    @input = input
    @output = output
  end

  def run
    puts "Welcome"
    puts "'list' to list projects"
    puts "'create' to create a new project"
    puts "'edit' to edit a project"
    puts "Please enter the new project name:\n "

    input = gets.chomp

    projects = ""

    while input != 'quit'

      if input == 'list'
        if projects== ""
          puts "Projects:\n  none"
        else
          puts "Projects:\n  #{projects}"
        end

      elsif input == 'create'
        puts "Please enter the new project name:\n"
        projects = gets.chomp
        puts "Projects:\n  #{projects}"

      elsif input == 'edit'
        puts "Please enter the project name to edit:\n"
        projects = gets.chomp
        puts "Please enter the new project name:\n"
        projects = gets.chomp
        puts "Projects:\n  #{projects}"

      elsif input == 'delete'
        puts "Please enter the project name to delete:\n"
        input = gets.chomp
        projects = projects.gsub!("#{input}", "")

      end
      input = gets.chomp
    end

  end

  def real_puts message = ""
    $stdout.puts message
  end
end
