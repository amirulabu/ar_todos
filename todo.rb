require_relative 'config/application'
require_relative 'app/models/task'

def list
  Task.all.each do |x|

    puts "#{x.id} #{x.name}  #{x.completed == false ? "[ ]" : "[x]"}"
  end
end

def delete(id)
  Task.find(id).destroy
end

def add(task)
  Task.create!(name: task)
end


input = ARGV[0]
input2 = ARGV[1..-1]
if input == "list"
  list
elsif input == "delete"
  delete(input2[0].to_i)
  #puts input

elsif input == "add"
  input3 = input2.join(" ")
  add(input3)
else
  puts "To-do List version 0.01alpha"
  puts "commands avaliable are list, delete (id), add (task) "
end