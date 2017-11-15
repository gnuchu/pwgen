require 'rake/testtask'
require 'ocra'

task :test do 
  Rake::TestTask.new do |t|
    t.libs << "tests"
    t.test_files = FileList['tests/test*.rb']
    t.verbose = true
  end
end

task :build do
  sh %{ocra --no-enc --gem-minimal --output exe/pwgen.exe bin/pwgen.rb}
end