require 'csv'
require_relative '../app/models/task'

module TasksImporter
  def self.import(filename='data/todo.csv')
    csv = CSV.new(File.open(filename), :headers => true)

    csv.each do |row|
      data = Array.new
        row.each do |field, value|
        # TODO: begin
          data << field
          data << value

          # raise NotImplementedError, "TODO: figure out what to do with this row and do it!"
        # TODO: end
        end
      h = Hash[data.each_slice(2).to_a]
      task = Task.create!(h)
      puts task
    end
  end
end

begin
  raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
  TasksImporter.import(ARGV[0])
rescue ArgumentError => e
  $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
rescue NotImplementedError => e
  $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
end