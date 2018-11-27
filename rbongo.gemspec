Gem::Specification.new do |s|
  s.name = 'rbongo'
  s.version = '0.0.1'
  s.summary = "A binding for the Bongo-Project Store protocol"
  s.description = s.summary
  s.author = "Lance Haig / Baris Balic"
  s.email = "lance@bongo-project.org"
  s.homepage = "http://www.bongo-project.org/Development/RBongo"
  s.required_ruby_version = ">= 1.8.7"
  s.files = ['README', 'LICENSE', 'lib/collection.rb', 'spec/spec-helper.rb']
  s.add_development_dependency('rspec', '= 3.8.0')
end