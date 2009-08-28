require 'rake'
require 'rake/testtask'

Dir.glob(File.join(File.dirname(__FILE__), 'src', '*')).each do |f|
  require f
end

def parse_people
  people = []
  people += Parser.parse_pipe File.open('data/pipe.txt').read
  people += Parser.parse_comma File.open('data/comma.txt').read
  people += Parser.parse_space File.open('data/space.txt').read

  people
end

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

desc "Run the runner"
task :run do
  puts Runner.run :pipe => 'data/pipe.txt', :space => 'data/space.txt', :comma => 'data/comma.txt'
end
