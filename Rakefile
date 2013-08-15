# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "acute"
  gem.homepage = "http://github.com/fokus-llc/acute"
  gem.summary = %Q{A flexible date and time parser}
  gem.description = %Q{A flexible date and time parser}
  gem.email = "oss@fok.us"
  gem.authors = ["Riley Lynch"]
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

require 'treetop'
lib_dir = 'lib/acute'
rules_dir = File.join(lib_dir, 'rules')
compiler = Treetop::Compiler::GrammarCompiler.new
task :grammar do

  compiler.compile(File.join(rules_dir, 'time_zones.treetop'))
  compiler.compile(File.join(rules_dir, 'clock_times.treetop'))

  compiler.compile(File.join(rules_dir, 'fragments.treetop'))

  compiler.compile(File.join(rules_dir, 'geological_years.treetop'))
  compiler.compile(File.join(rules_dir, 'calendar_years.treetop'))
  compiler.compile(File.join(rules_dir, 'seasons.treetop'))
  compiler.compile(File.join(rules_dir, 'months.treetop'))
  compiler.compile(File.join(rules_dir, 'dates.treetop'))
  compiler.compile(File.join(rules_dir, 'date_shifts.treetop'))
  compiler.compile(File.join(rules_dir, 'date_times.treetop'))

  compiler.compile(File.join(rules_dir, 'imprecise/calendar_year.treetop'))
  compiler.compile(File.join(rules_dir, 'imprecise/seasons.treetop'))
  compiler.compile(File.join(rules_dir, 'imprecise/months.treetop'))
  compiler.compile(File.join(rules_dir, 'imprecise/dates.treetop'))
  compiler.compile(File.join(rules_dir, 'imprecise/date_shifts.treetop'))
  compiler.compile(File.join(rules_dir, 'imprecise/date_times.treetop'))
  compiler.compile(File.join(rules_dir, 'imprecision.treetop'))

  compiler.compile(File.join(lib_dir, 'grammar.treetop'))

end

task :default => :spec

