require_relative 'config/application'
require_relative 'app/models/task'

def list
  Task.all.each do |x|

    puts "#{x.count} #{x.name}  #{x.completed == false ? "[ ]" : "[x]"}"
  end
end

def delete(count)
  Task.find(count).destroy
  recount
  list
end

def add(task)
  Task.create!(name: task)
  recount
  list
end

def done(count)
  Task.find(convert_count_to_id(count)).update(:completed => true)
  list
end

def cancel_done(count)
  Task.find(convert_count_to_id(count)).update(:completed => false)
  list
end

def recount
  c = 1
  Task.all.each do |x|
    x.update(:count => c)
    c += 1
  end
end

def convert_count_to_id(count)
  id_count = 0
  Task.select(:id).distinct.where(:count => count).each do |y|
    id_count = y.id
  end
  id_count
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
elsif input == "done"
  done(input2[0].to_i)
elsif input == "cancel"
  cancel_done(input2[0].to_i)
else
  puts "To-do List version 1.0"
  puts "commands avaliable are list, done (id), cancel (id), delete (id), add (task) "
end