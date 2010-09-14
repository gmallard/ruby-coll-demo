#
# Show instance method names for Enumerable
#
enum_methods = Enumerable.instance_methods.sort
puts RUBY_VERSION + " has #{enum_methods.size} instance methods.  They are:"
enum_methods.each do |meth_name|
  puts "\t#{meth_name}"
end

