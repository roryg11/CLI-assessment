class TodoApp < CommandLineApp
  def initialize(input, output)
    @input = input
    @output = output
    @projects = []
    @task_list = []
  end

  def projects
    @projects
  end

  def task_list
    @task_list
  end

  def run

    running = true

    while running == true

      puts "Welcome"
      puts "'list' to list projects"
      puts "'create' to create a new project"
      puts "'edit' to edit a project"
      puts "'rename' to rename a project"

      response = gets.chomp

      if response == 'list'
        list

      elsif response == 'create'
        create

      elsif response == 'rename'
        rename

      elsif response == 'edit'
        tasks

      elsif response == 'delete'
        delete

      elsif response == 'quit'
        running = false

      end
    end
  end

  def real_puts message = ""
    $stdout.puts message
  end

  def list
    if projects == []
      puts "Projects:\n  none"
    else
      puts "Projects:\n  #{projects.join(", ")}"
    end
  end

  def create
    puts "Please enter the new project name:\n"
    project_name = gets.chomp
    @projects << project_name
  end

  def rename
    puts "Please enter the project name to rename:\n"
    current_project_name = gets.chomp
    puts "Please enter the new project name:\n"
    new_project_name = gets.chomp

    @projects.map do |project|
      project.gsub!("#{current_project_name}", "#{new_project_name}")
    end

    puts "Projects:\n  #{@projects.join(", ")}"
  end

  def delete
    puts "Please enter the project name to delete:\n"
    name_to_delete = gets.chomp
    @projects.delete_if{|project_name| project_name == name_to_delete}
  end

  def tasks

    editing = true

    puts "Please enter the name of the project you want to edit: \n"

    project_to_edit = gets.chomp

    puts "Editing Project: #{project_to_edit}"

    while editing
      #lists list intructions in the edit command
      puts "'list' to list tasks"
      puts "'create' to create a new task"
      puts "'edit' to edit a task"
      puts "'complete' to complete a task and remove it from the list"

      response = gets.chomp

      if response == 'list'
        if @task_list == []
          puts "  none"
        else
          puts "#{project_to_edit} tasks:\n #{@task_list.join(", ")}"
        end

      elsif response == 'create'
        puts "Please enter new task name: "
        new_task = gets.chomp
        @task_list << new_task
        puts "You added a new task to #{project_to_edit}!"

      elsif response == 'edit'

        puts "What task would you like to edit?"
        task_to_edit = gets.chomp

        if @task_list.include?("#{task_to_edit}") == false
          puts "task not found: '#{task_to_edit}'"
        else
          puts "What would you like to change it to?"
          task_edited = gets.chomp

          @task_list.map do |task|
            task.gsub!("#{task_to_edit}", "#{task_edited}")
          end
        end

      elsif response == 'complete'
        puts "What task have you completed?"
        completed_task = gets.chomp

        if @task_list.include?("#{completed_task}") == true
          @task_list.map do |task|
            task.gsub!("#{completed_task}", "#{completed_task}: completed")
          end
        else
          puts "task not found: 'not here'"
        end

      elsif response == 'back'
        editing = false

      elsif response == 'quit'
        editing = false
        running = false

      end
    end
  end
end
