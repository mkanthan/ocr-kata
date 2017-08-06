begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec)

  task :default => :spec
rescue LoadError
  # no rspec available
end

desc "Run the parser to parse the spec/fixtures/digit_sample.txt"
task :parse do
  Dir.glob("lib/**/*.rb").each { |file| require_relative file }

  lines = []
  File.readlines('spec/fixtures/digit_sample.txt').each do |line|
    line = line.gsub("\n", " ") if line.length == 27
    lines << line.chomp unless line.chomp.empty?
  end

  lines.each_slice(3).to_a.each do |account_num|
    a = AccountNumberTransformer.new(account_num).transform
    puts "#{a.number} #{a.status}"
  end
end
