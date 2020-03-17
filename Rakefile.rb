task default: %w[spec]

desc 'Run unit test suite'
task :spec do
  exec './prodenum/spec.rb'
end
