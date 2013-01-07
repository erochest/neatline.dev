
require 'fileutils'

NL_REPOS = {
  'NeatlineTime' => 'git@github.com:scholarslab/NeatlineTime.git',
}

task :default => :usage

task :usage do
  puts "I don't know what to do. Try running"
  puts "  rake -T"
  puts "and give me something specific to do."
end

namespace :git do
  desc 'This changes the ownership of the plugin repositories and sets up git flow.'
  task :reown do
    NL_REPOS.each do |k, v|
      sh %{cd Omeka/plugins/#{k} && git remote set-url origin #{v} && git flow init -d}
    end
  end
end

desc 'This clears out the Omeka installation.'
task :clean do
  FileUtils.rmtree 'Omeka', :verbose => true
end

