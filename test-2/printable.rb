module Printable
  def self.included(some_class)
    some_class.send(:define_method, :print_info) do
      puts "Obj info: #{self.inspect}"
    end
  end

  def method_missing(name)
    puts "There is no method #{name} in class #{self.class}"
  end
end